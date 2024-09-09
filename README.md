# Shiny-app for Human Indicators Data
This Shiny app provides an interactive interface to explore and visualize Human Development Indicators (HDI) for various countries. I have used 5 countries for this project - Germany, Afghanistan, Spain, Ireland and India. The app allows users to upload their own datasets, view data tables, and generate various plots to analyze the indicators. The app is built using the shiny and shinydashboard packages in R.
## Features
1. Instructions Tab:
* Provides an overview of the app and how to use it.
* Highlights the main features:
  * Select at least one country to display its HDI data.
  * Customize the number of rows and columns shown in the data table.
  * Generate two distinct plots for different aspects of the data.
  * Use built-in data for five countries: Afghanistan, Germany, Spain, India, and Ireland.
  * Upload custom HDI datasets for additional countries.
2. App Tab:
* Allows users to select countries and analyze their HDI data.
* Generate dynamic data tables and visualize HDI data with two types of plots:
  * Scatterplot (Plot 1) for a selected country.
  * Density Plot (Plot 2) for a second country.
## Files
1. ui.R: Defines the user interface of the Shiny app, including:
* A sidebar with options for navigating between the "Instructions" and "App" tabs.
* Inputs for selecting countries, variables for plotting, and additional user-uploaded datasets.
* The main dashboard where the data table and plots are displayed.
2. server.R: Contains the server-side logic of the app, including:
* Reading and loading the built-in and user-uploaded datasets.
* Dynamically updating country selections based on user input.
* Generating the data tables and rendering the scatterplot and density plot based on the selected countries and variables.
## Usage
1. Launch the App:

 Use the shiny package to run the app:

 library(shiny)

 runApp()

* Instructions: Visit the "Instructions" tab for detailed usage steps and a list of available functionalities.
* Explore the Data:
  * Select a country from the dropdown in the "App" tab to load its data.
  * Use the controls to filter the table and visualize the data with scatterplots and density plots.
* Upload Your Dataset:
  * You can upload additional HDI datasets in CSV format to analyze data for countries not included by default.
## Dataset
The app includes 5 built-in datasets for 5 different countries. The datasets were downloaded from [Human Indicators](https://data.humdata.org/dataset/?organization=undp-human-development-reports-office&q=Human+Development+Indicators)
##
Raj Navalakha
