# heatmap shiny app

library(shiny)
library(tidyverse)
library(here)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    

    
    # Heatmap of RNA expression data for different strains of yeast
    # with requested GO domain
    
    output$heat <- renderPlot({
        # load plot data
        rel_expr <- read_csv(fs::path(here::here(),"app","data","rel_expr.csv"))
        strain_meta <- read_csv(fs::path(here::here(),"app","data","strain_meta.csv"))
        go_annotation <- read_csv(fs::path(here::here(),"app","data","go_annotation.csv"))
        
        # filter based on ui input
        my_go_domain <- go_annotation %>% 
            filter(go_domain == input$go_domain) # "Biological process"
        my_strain_type <- strain_meta %>%
            filter(strain_tag_type == input$strain_tag_type) # "primary"

                      
        # compare RNA expression of strains with go_tag1 and go_tag2
        heatmap_by_GO <- rel_expr %>% 
            left_join(my_go_domain, by="gene_name") %>%
            left_join(my_strain_type, by="culture_treatment") %>%
            group_by(go_annotation, strain_tag) %>% 
            summarise(rel_expr = mean(rel_expr)) %>% 
            ungroup()
        
        
        ggplot(heatmap_by_GO, aes(x=strain_tag %>% fct_reorder(-rel_expr), y= go_annotation %>% fct_reorder(-rel_expr))) +
            geom_tile(aes(fill=rel_expr)) +
            scale_fill_viridis_c() +
            ggtitle("Mean transcript abundance") +
            theme(axis.text.x = element_text(angle = 90, hjust=0.99, vjust=0.5)) +
            ylab(input$go_domain) +
            xlab(input$strain_tag_type) +
            labs(fill="Norm. rel. expr.")

    })

})

