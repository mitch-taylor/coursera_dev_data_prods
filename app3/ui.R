# create slider, take slider output and pass to server then return
# back into ui.

library(shiny)
shinyUI(fluidPage(
    titlePanel("Slider App"),
    sidebarLayout(
        sidebarPanel(
            h1("Move the Slider!"),
            sliderInput("slider1" # name of slider
                        , "Slide Me!", 0, 100, 0)
        ),
        mainPanel(
            h3("Slider Value:"),
            textOutput("text1") # output text1 from server.R
        )
    )
))

