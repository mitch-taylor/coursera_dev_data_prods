library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    x    <- faithful[, 2] 
    hist(x, col = 'darkgray', border = 'white')
    
  })
  dummy_weights <- data.frame(
      date = seq(as.Date("2017/1/1"), Sys.Date() - 1, "days"), 
      weight = 180)
  
  output$view <- renderTable({
    data <- dummy_weights
  })
})
