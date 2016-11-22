### WEEK 1

# SHINY

# 2 files required ui.R (user interface) and server.R
# alt + s + w + enter sets working directory
# runApp() will run the shiny app, can also use runApp(path)
# all standard html tags exist in shiny
# ?builder

### SHINY GADGETS

# shiny gadgets is more for interactivity in R studio than outward facing to customers
# launches small single page app in the viewer panel

library(shiny)
library(miniUI)

myFirstGadget <- function() {
    ui <- miniPage( # like ui.R
        gadgetTitleBar("My First Gadget")
    )
    server <- function(input, output, session) { # like server.R
        # The Done button closes the app
        observeEvent(input$done, {
            stopApp()
        })
    }
    runGadget(ui, server)
}

myFirstGadget() 


