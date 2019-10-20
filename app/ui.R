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
shinyUI(
    fluidPage(
    
    # Application title
    titlePanel(HTML("<em>S. cervisiae</em> RNA expression")),
    
    hr(),
    
    tabsetPanel(
        tabPanel("Heatmap",
                 br(),
                 fluidRow(
                     
                     # Sidebar with a slider input for number of bins
                     sidebarLayout(
                         position = "left",
                         sidebarPanel(
                             width = 3,
                                 selectInput(inputId="go_domain_heatmap",
                                             label = "GO domain",
                                             choices = list("Biological process",
                                                            "Cellular component", 
                                                            "Molecular function"),
                                             selected = "Biological process"
                                 ),
                                 selectInput(inputId="strain_tag_type_heatmap",
                                             label = "Strain metadata",
                                             choices = list("primary",
                                                            "secondary", 
                                                            "additional_information"),
                                             selected = "primary"
                             ),
                             selectInput(inputId="order_by_heatmap",
                                         label = "Order GO by:",
                                         choices = c()
                             ),
                             checkboxGroupInput(inputId = "inCheckboxGroup_heatmap", 
                                                label = "Input checkbox",
                                                c())
                         ),
                         
                         # Show a plot of the generated distribution
                         mainPanel(br(), plotOutput(outputId="heat", height = 600))
                     )
                 )),
        tabPanel("Gene Clustering",
                 br(),
                 fluidRow(
                     sidebarLayout(
                         position = "left",
                         sidebarPanel(
                             width =3, 
                             selectInput(inputId="go_domain_UMAP",
                                         label = "GO domain to visualise",
                                         choices = list("Biological process",
                                                        "Cellular component", 
                                                        "Molecular function"),
                                         selected = "Biological process"
                             ),
                             selectInput(inputId = "goTag", 
                                         label = "Go Tag",
                                         c())
                         ),
                         mainPanel(
                             column(12,
                                    offset = 1, 
                                    plotOutput(outputId="umap"),
                                    helpText(paste("This plot shows how gene-wise transcription profiles cluster.",
                                    "Data points can be colored by GO expression.",
                                    "This plot was generated using Uniform Manifold Approximation and Projection (UMAP).", sep = "\n")
                                    )
                                    )
                     )
        ))),
        tabPanel("LIMMA"),
        tabPanel("Condition Clustering",
                 fluidRow(
                     
                     # make a perplexity slider
                     sidebarLayout(
                         position = "left",
                         sidebarPanel(
                             width = 3,
                             sliderInput("perplexity_slider", h3("Perplexity"),
                                         min = 1, max = 28, value = 10)
                         ),
                         
                         # add the plot
                         mainPanel(br(),plotOutput(outputId="tsne", height = 600))
                     )
    )             )
    )))
