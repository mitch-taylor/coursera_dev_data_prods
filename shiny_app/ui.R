
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
        # tree plot
        plotOutput("distPlot")
    )
  )
))
