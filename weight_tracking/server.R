library(shiny); library(rpart); library(rpart.plot); library(rattle)

data("ptitanic")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    fit <- reactive({
        rpart(survived~., method="class", data=ptitanic, maxdepth = input$depth) 
    }) 
   
    output$distPlot <- renderPlot({
        fancyRpartPlot(fit())
  })
})
