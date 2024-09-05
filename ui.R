library(shiny)
library(shinydashboard)
library(DT)

#Creating the dashboard and provinding info on the app's purpose
dashboardPage(
  dashboardHeader(title = "Human Development Indicators"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Instructions", tabName = "instructions", icon = icon("info")),
      menuItem("App", tabName = "app", icon = icon("dashboard"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "instructions",
              h2("Instructions"),
              p("A Shiny app by Raj Navalakha(23205373) to read and summarize the Human Development Indicators data."),
              p("The Shiny app allows you to perform the following task:"),
              tags$ol(
                tags$li("Select the data for atleast one country and produce its data table"),
                tags$li("A user can select the number of rows and the columns to be displayed."),
                tags$li("You can produce two different plots showing different information each."),
                tags$li("Has the built-in data for 5 countries: Afghanistan, Germany, Spain, India and Ireland"),
                tags$li("Allows the user to upload any extra Human Development Indicators dataset.")
              )
      ),
      
      #Creation of all the other tabs like Data Table, Plots and Adding Datasets
      tabItem(tabName = "app",
              fluidRow(
                box(title = "Country", status = "primary", solidHeader = TRUE, width = 12,
                    selectInput("country", "Select Country:", choices = NULL, multiple = TRUE)
                ),
                box(title = "Data Table", status = "primary", solidHeader = TRUE, width = 12,
                    DTOutput("dataTable")
                ),
                
                fluidRow(
                  box(title = "Plot 1", status = "primary", solidHeader = TRUE, width = 12,
                      selectInput("x_var1", "X Variable:", choices = NULL),
                      selectInput("y_var1", "Y Variable:", choices = NULL),
                      selectInput("color1", "Color By:", choices = NULL),
                      plotOutput("plot1")
                  )
                ),
                fluidRow(
                  box(title = "Plot 2", status = "primary", solidHeader = TRUE, width = 12,
                      selectInput("x_var2", "X Variable:", choices = NULL),
                      selectInput("y_var2", "Y Variable:", choices = NULL),
                      selectInput("color2", "Color By:", choices = NULL),
                      plotOutput("plot2")
                  )
                ),
                box(title = "Upload Data", status = "primary", solidHeader = TRUE, width = 12,
                    fileInput("file1", "Upload CSV File", accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv"))
                )
              )
      )
    )
  )
)  
                
                
                
                
          
  
