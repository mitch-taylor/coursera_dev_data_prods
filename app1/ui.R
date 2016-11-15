library(shiny)
# ShinyUI function is required
shinyUI(fluidPage( # fluid page is the pagetype (default)
    titlePanel("Data science FTW!"),
    sidebarLayout(
        sidebarPanel(
            h3("Sidebar Text") # relates to html heading level (smaller text 
            # than h2)
        ),
        mainPanel(
            h3("Main Panel Text")
        )
    )
))