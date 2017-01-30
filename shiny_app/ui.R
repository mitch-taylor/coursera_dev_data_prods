
library(shiny)

# Define UI for application models titanic data using CART
shinyUI(fluidPage(

  # Application title
  titlePanel("Titanic Survival Prediction With CART"),

  # Sidebar with user input for date and weight
  sidebarLayout(
    sidebarPanel(
        # maxdepth
        sliderInput("depth", "Max Depth:", min=1, max=30, value=1)
    ),

    # Show a plot of the model
    mainPanel(
        "Enter a max depth parameter to include in the CART model. The fitted 
        CART tree output for the provided max depth parameter is shown below.
        For documentation of data please refer to the ptitanic dataset help file.",
        # tree plot
        plotOutput("distPlot")
    )
  )
))
