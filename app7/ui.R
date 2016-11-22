library(shiny)
shinyUI(fluidPage(
    titlePanel("Visualize Many Models"),
    sidebarLayout(
        sidebarPanel(
            h3("Slope"),
            textOutput("slopeOut"), # look for this label from shiny server
            h3("Intercept"),
            textOutput("intOut") # look for this label from shiny server
        ),
        mainPanel(
            plotOutput("plot1", brush = brushOpts( # plot output with **brush**
                id = "brush1"
            ))
        )
    )
))