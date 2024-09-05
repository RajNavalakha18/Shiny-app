library(ggplot2)

#Loading the datasets for the 5 countries
initial_data = list(
  Afghanistan = read.csv("/Users/rajnavalakha/Documents/Adv Data Prog with R/Final Project/Human_Development_Indicators/hdro_indicators_afg.csv"),
  Germany = read.csv("/Users/rajnavalakha/Documents/Adv Data Prog with R/Final Project/Human_Development_Indicators/hdro_indicators_deu.csv"),
  Spain = read.csv("/Users/rajnavalakha/Documents/Adv Data Prog with R/Final Project/Human_Development_Indicators/hdro_indicators_esp.csv"),
  India = read.csv("/Users/rajnavalakha/Documents/Adv Data Prog with R/Final Project/Human_Development_Indicators/hdro_indicators_ind.csv"),
  Ireland = read.csv("/Users/rajnavalakha/Documents/Adv Data Prog with R/Final Project/Human_Development_Indicators/hdro_indicators_irl.csv")
)

shinyServer(function(input, output, session) {
  rv = reactiveValues(data = initial_data)
  observe({
    updateSelectInput(session, "country", choices = names(rv$data))
  })
  
  #Handling the files upload 
  observeEvent(input$file1, {
    inFile = input$file1
    if (is.null(inFile)) return(NULL)
    new_data = read.csv(inFile$datapath)
    rv$data[[tools::file_path_sans_ext(inFile$name)]] = new_data
    updateSelectInput(session, "country", choices = names(rv$data), selected = input$country)
  })
  
  #Providing the inputs for variable selection
  observe({
    if (!is.null(input$country) && length(input$country) > 0) {
      updateSelectInput(session, "x_var1", choices = names(rv$data[[input$country[1]]]))
      updateSelectInput(session, "y_var1", choices = names(rv$data[[input$country[1]]]))
      updateSelectInput(session, "color1", choices = names(rv$data[[input$country[1]]]))
      updateSelectInput(session, "x_var2", choices = names(rv$data[[input$country[1]]]))
      updateSelectInput(session, "y_var2", choices = names(rv$data[[input$country[1]]]))
      updateSelectInput(session, "color2", choices = names(rv$data[[input$country[1]]]))
    }
  })
  
  #For Data Table
  output$dataTable = renderDT({
    if (is.null(input$country) || length(input$country) == 0) return(NULL)
    data = do.call(rbind, lapply(input$country, function(c) rv$data[[c]]))
    datatable(data, options = list(pageLength = 5, lengthMenu = c(5, 10, 15)))
  })
  
  #For the plots
  #Scatterplot for the 1st country
  output$plot1 = renderPlot({
    if (is.null(input$x_var1) || is.null(input$y_var1) || is.null(input$color1) ||
        input$x_var1 == "" || input$y_var1 == "" || input$color1 == "") return(NULL)
    ggplot(rv$data[[input$country[1]]], aes_string(x = input$x_var1, y = input$y_var1, color = input$color1)) + 
      geom_point() + labs(title = paste("Plot for", input$country[1])) + theme_minimal() + theme(
        plot.title = element_text(size = 14, face = "bold"),
        axis.title = element_text(size = 12),
        axis.text.x = element_text(angle = 45, hjust = 1),
        axis.text.y = element_text(size = 10, angle = 0),
        plot.margin = margin(1, 1, 1, 1, "cm")
      )
  })
  
  #Density plot for the 2nd country
  output$plot2 = renderPlot({
    if (is.null(input$x_var2) || is.null(input$y_var2) || is.null(input$color2) ||
        input$x_var2 == "" || input$y_var2 == "" || input$color2 == "") return(NULL)
    ggplot(rv$data[[input$country[2]]], aes_string(x = input$x_var2, fill = input$color2)) + 
      geom_density(alpha = 0.5) + labs(title = paste("Density Plot for", input$country[2])) + theme_minimal() + theme(
        plot.title = element_text(size = 14, face = "bold"),
        axis.title = element_text(size = 12),
        axis.text.x = element_text(angle = 45, hjust = 1),
        axis.text.y = element_text(size = 10, angle = 0),
        plot.margin = margin(1, 1, 1, 1, "cm")
      )
  })
})



