
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Weight Tracking"),
  
  # Sidebar with user input for date and weight
  sidebarLayout(
    sidebarPanel(
        # date
        dateInput('date', 'Entry Date (mm-dd-yyyy)', Sys.Date(), 
                  format = 'mm-dd-yyyy'),
        # weight
        numericInput('weight', 'Weight', '', min = 0)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        # plot
        plotOutput("distPlot"),
        # data
        tableOutput("view")
    )
  )
))
