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

# gadget 1
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

# gadget 2
multiplyNumbers <- function(numbers1, numbers2) {
    ui <- miniPage(
        gadgetTitleBar("Multiply Two Numbers"),
        miniContentPanel( # main body of the pain
            selectInput("num1", "First Number", choices=numbers1), # drag down box
            selectInput("num2", "Second Number", choices=numbers2) # NB choices comes from function
        )
    )
    server <- function(input, output, session) {
        observeEvent(input$done, { # care with {}
            num1 <- as.numeric(input$num1) # create num1/2 so easier to work with
            num2 <- as.numeric(input$num2)
            stopApp(num1 * num2)
        })
    }
    runGadget(ui, server) # need to have this
}

multiplyNumbers(1:10, 1:10)

# gadget 3
pickTrees <- function() {
    ui <- miniPage(
        gadgetTitleBar("Select Points by Dragging your Mouse"),
        miniContentPanel(
            plotOutput("plot", height = "100%", brush = "brush") # name of plot is plot, brush is brush
        )
    )
    server <- function(input, output, session) {
        output$plot <- renderPlot({ # note {}
            plot(trees$Girth, trees$Volume, main = "Trees!",
                 xlab = "Girth", ylab = "Volume")
        })
        observeEvent(input$done, {
            stopApp(brushedPoints(trees, input$brush, # stop after collecting brushed points
                                  xvar = "Girth", yvar = "Volume"))
        })
    }
    runGadget(ui, server)
}

trees_picked <- pickTrees()
trees_picked

### GOOGLEVIS

# Connects R to googles visualisation API


    
    
    

