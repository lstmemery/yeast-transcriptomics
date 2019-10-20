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
                                             label = "Select GO domain",
                                             choices = list("Biological process",
                                                            "Cellular component", 
                                                            "Molecular function"),
                                             selected = "Biological process"
                                 ),
                                 helpText('Which gene onthology domain data to use'),
                                 selectInput(inputId="strain_tag_type_heatmap",
                                             label = "Select strain metadata",
                                             choices = list("primary",
                                                            "secondary", 
                                                            "additional_information"),
                                             selected = "primary"
                                 ),
                                 helpText('What strain metadata tag to display as the columns'),
                                 selectInput(inputId="order_by_heatmap",
                                             label = "Order GO by:",
                                             choices = c()
                                 ),
                                 helpText('Sort columns based on their relative expression values in that row'),
                                 checkboxGroupInput(inputId = "inCheckboxGroup_heatmap", 
                                             label = "Input checkbox",
                                             c()),
                                 helpText('Select what responses to display')
                                 ),
                         # Show a plot of the generated distribution
                         mainPanel(br(), plotOutput(outputId="heat", height = 600))
                     )
                 )),
        tabPanel("UMAP",
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
                             column(12, offset = 1, plotOutput(outputId="umap")))
                     )
                 )
        ),
        tabPanel("PCA"),
        tabPanel("LIMMA",
                 br(),
                 fluidRow(
                   sidebarLayout(
                     position = "left",
                     sidebarPanel(
                       width = 3,
                       selectInput(
                         inputId = "group1",
                         label = "Select first group for comparison",
                         choices = list(
                           "AF",
                           "FA",
                           "FF",
                           "IA",
                           "IF",
                           "IN",
                           "QC",
                           "QN",
                           "SA"
                         ),
                         selected = "AF"),
                       selectInput(
                         inputId = "group2",
                         label = "Select second group for comparison",
                         choices = list(
                           "AF",
                           "FA",
                           "FF",
                           "IA",
                           "IF",
                           "IN",
                           "QC",
                           "QN",
                           "SA"
                         ),
                         selected = "FA")
                     ),
                     mainPanel(br(), 
                               plotOutput(outputId = "limma", height = 600)
                     )
                       )
                     # Show a plot of the generated distribution
                     
                   )
                   
        ),
        tabPanel("TSNE")
    )
    )
)
