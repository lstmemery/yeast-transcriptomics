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
    titlePanel(h1("Visualize Yeast Transcriptome Data")),

    hr(),
    
    tabsetPanel(
        tabPanel("Heatmap",
                fluidRow(

                    # Sidebar with a slider input for number of bins
                    sidebarLayout(
                        position = "left",
                        sidebarPanel(
                            fluidRow(
                                column(5,
                                    selectInput(inputId="go_domain",
                                                label = "GO domain",
                                                choices = list("Biological process",
                                                           "Cellular component", 
                                                           "Molecular function"),
                                                selected = "Biological process"
                                                ),
                                ),
                                column(5,
                                    selectInput(inputId="strain_tag_type",
                                                label = "Strain metadata",
                                                choices = list("primary",
                                                               "secondary", 
                                                               "additional_information"),
                                                selected = "primary"
                                                ),
                                )
                            ),
                            fluidRow(
                                column(5,
                            checkboxGroupInput(inputId = "inCheckboxGroup", 
                                               label = "Input checkbox",
                                               c())
                            
                                )
                            )
                        ),
                
                        # Show a plot of the generated distribution
                        mainPanel(br(),plotOutput(outputId="heat",height = 600))
                    )
                )),
                tabPanel("UMAP"),
                tabPanel("PCA")
                )
    )
)
