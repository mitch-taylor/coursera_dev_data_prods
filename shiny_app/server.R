library(shiny); library(rpart); library(rpart.plot);

data("ptitanic")

# Define server logic
shinyServer(function(input, output) {
    fit <- reactive({
        # create CART model with user input max tree depth
        rpart(survived~., method="class", data=ptitanic, maxdepth = input$depth)
    })

    output$distPlot <- renderPlot({
        # plot fitted tree
        prp(fit())
  })
})
