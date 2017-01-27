
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Credit Default Prediction With CART"),
  
  # Sidebar with user input for date and weight
  sidebarLayout(
    sidebarPanel(
        # maxdepth
        sliderInput("depth", "Max Depth:", min=0, max=30, value=3)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        # tree plot
        plotOutput("distPlot")
    )
  )
))
