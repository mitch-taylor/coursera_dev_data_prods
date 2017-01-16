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

# Connects R to googles visualisation API - interactive graphics

# example - note geared to embed chart in html document
# motion chart
suppressPackageStartupMessages(library(googleVis))
M <- gvisMotionChart(Fruits, "Fruit", "Year",
                     options=list(width=600, height=400))
plot(M)
print(M) # print relevant html page / javascript

# plots on maps
G <- gvisGeoChart(Exports, locationvar="Country",
                  colorvar="Profit",options=list(width=600, height=400))
plot(G)

# specifying a region
G2 <- gvisGeoChart(Exports, locationvar="Country",
                   colorvar="Profit",options=list(width=600, height=400,region="150"))
plot(G2)
    
# setting more options
df <- data.frame(label=c("US", "GB", "BR"), val1=c(1,3,4), val2=c(23,12,32))
Line <- gvisLineChart(df, xvar="label", yvar=c("val1","val2"),
                      options=list(title="Hello World", legend="bottom",
                                   titleTextStyle="{color:'red', fontSize:18}",                         
                                   vAxis="{gridlines:{color:'red', count:3}}",
                                   hAxis="{title:'My Label', titleTextStyle:{color:'blue'}}",
                                   series="[{color:'green', targetAxisIndex: 0}, 
                                   {color: 'blue',targetAxisIndex:1}]",
                                   vAxes="[{title:'Value 1 (%)', format:'##,######%'}, 
                                   {title:'Value 2 (\U00A3)'}]",                          
                                   curveType="function", width=500, height=300                         
                      ))
plot(Line)

# combining plots
G <- gvisGeoChart(Exports, "Country", "Profit",options=list(width=200, height=100))
T1 <- gvisTable(Exports,options=list(width=200, height=270))
M <- gvisMotionChart(Fruits, "Fruit", "Year", options=list(width=400, height=370))
GT <- gvisMerge(G,T1, horizontal=FALSE)
GTM <- gvisMerge(GT, M, horizontal=TRUE,tableOptions="bgcolor=\"#CCCCCC\" cellspacing=10")
plot(GTM)

# in R markdown documents set results = asis for it to work

### PLOTLY

# plotly is a web application for creating and sharing visualisations - works
# on R, matlab, python, etc.
library(plotly)
plot_ly(mtcars, x = ~wt, y = ~mpg, mode = "markers") # markers = scatter
# note interactive graphic is knitted into html
plot_ly(mtcars, x = ~wt, y = ~mpg, mode = "markers", color = ~factor(cyl))
# use cylinder to colour
plot_ly(mtcars, x = ~wt, y = ~mpg, mode = "markers", color = ~disp)
# colour and size based on variables
plot_ly(mtcars, x = ~wt, y = ~mpg, mode = "markers", 
        color = ~factor(cyl), size = ~hp)

# 3D scatter plot
set.seed(2016-07-21)
temp <- rnorm(100, mean = 30, sd = 5)
pressue <- rnorm(100)
dtime <- 1:100
plot_ly(x = ~temp, y = ~pressue, z = ~dtime,
        type = "scatter3d", color = ~temp)

# line graph (timeseries)
data("airmiles")
plot_ly(x = ~time(airmiles), y = ~airmiles, type = "scatter", mode = "lines")

library(tidyr);library(dplyr)
data("EuStockMarkets")

stocks <- as.data.frame(EuStockMarkets) %>% # convert time series to df
    gather(index, price) %>%
    mutate(time = rep(time(EuStockMarkets), 4))
# note how we had to change data structure to be long rather than wide
# this was done with gather (tidyr)
plot_ly(stocks, x = ~time, y = ~price, color = ~index, type = "scatter", mode = "lines")

# histogram
plot_ly(x = ~precip, type = "histogram")
# boxplot
plot_ly(iris, y = ~Petal.Length, color = ~Species, type = "box")
# heatmap
terrain1 <- matrix(rnorm(100*100), nrow = 100, ncol = 100)
plot_ly(z = ~terrain1, type = "heatmap") # z is a matrix
# surface
terrain2 <- matrix(sort(rnorm(100*100)), nrow = 100, ncol = 100)
plot_ly(z = ~terrain2, type = "surface") # z is intensity, x and y are given

#Choropleth maps
# Create data frame
state_pop <- data.frame(State = state.abb, Pop = as.vector(state.x77[,1]))
# Create hover text
state_pop$hover <- with(state_pop, paste(State, '<br>', "Population:", Pop))
# Make state borders white
borders <- list(color = toRGB("red"))
# Set up some mapping options
map_options <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showlakes = TRUE,
    lakecolor = toRGB('white')
)

plot_ly(z = ~state_pop$Pop, text = ~state_pop$hover, locations = ~state_pop$State, 
        type = 'choropleth', locationmode = 'USA-states', 
        color = state_pop$Pop, colors = 'Blues', marker = list(line = borders)) %>%
    layout(title = 'US Population in 1975', geo = map_options)

# Note can convert ggplot2 to plotly