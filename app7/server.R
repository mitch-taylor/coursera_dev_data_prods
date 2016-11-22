library(shiny)
shinyServer(function(input, output) {
    model <- reactive({ # note model is reactive to data, also note {}
        brushed_data <- brushedPoints(trees, input$brush1, # input from trees data and brush1
                                      xvar = "Girth", yvar = "Volume") # NB creates a dataframe
        if(nrow(brushed_data) < 2){
            return(NULL)
        }
        lm(Volume ~ Girth, data = brushed_data) # fit linear model to brushed data
    })
    output$slopeOut <- renderText({ # grab slope term
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][2]
        }
    })
    output$intOut <- renderText({ # grab intercept term
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][1]
        }
    })
    output$plot1 <- renderPlot({ # output plot, not reactive notation of {}
        plot(trees$Girth, trees$Volume, xlab = "Girth",
             ylab = "Volume", main = "Tree Measurements",
             cex = 1.5, pch = 16, bty = "n")
        if(!is.null(model())){
            abline(model(), col = "blue", lwd = 2) # uses model from brush data
        }
    })
})