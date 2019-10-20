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
                        position = "right",
                        sidebarPanel(
                            selectInput(inputId="go_domain",
                                        label = "GO domain",
                                        choices = list("Biological process",
                                                   "Cellular component", 
                                                   "Molecular function"),
                                        selected = "Biological process"
                                        ),
                            selectInput(inputId="strain_tag_type",
                                        label = "Strain metadata",
                                        choices = list("primary",
                                                       "secondary", 
                                                       "additional_information"),
                                        selected = "primary"
                                        ),
                            checkboxGroupInput(inputId = "inCheckboxGroup", 
                                               label = "Input checkbox",
                                               c())
                        ),
                
                        # Show a plot of the generated distribution
                        mainPanel(plotOutput(outputId="heat"))
                    )
                )),
                tabPanel("UMAP",
                         fluidRow(
                         sidebarLayout(
                         position = "right",
                         sidebarPanel(
                             selectInput(inputId="go_domain",
                                         label = "GO domain",
                                         choices = list("Biological process",
                                                        "Cellular component", 
                                                        "Molecular function"),
                                         selected = "Biological process"
                             ),
                             selectInput(inputId = "goTag", 
                                                label = "Go Tag",
                                                c())
                         ),
                         mainPanel(plotOutput(outputId="umap"))
                         )
                         )
                         ),
                tabPanel("PCA")
                )
    )
)
