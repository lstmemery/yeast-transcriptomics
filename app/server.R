#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    sc <- read_csv("data/SC_expression.csv")
    
    output$distPlot <- renderPlot({
        
        
        # generate bins based on input$bins from ui.R
        print("What's going on")
        # draw the histogram with the specified number of bins
        
        
        ggplot(sc, aes_string(x = input$experiment)) +
            geom_histogram()

    })

})
