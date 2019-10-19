#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("SC Data"),

    
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId="go_domain",
                        label = "GO domain",
                        c("Biological process", "Cellular component", "Molecular function"),
                        ),
            selectInput(inputId="strain_tag_type",
                        label = "Strain metadata",
                        c("primary","secondary", "additional_information"),
                        )
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput(outputId="heat")
        )
    )
))
