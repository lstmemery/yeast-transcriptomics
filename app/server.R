# heatmap shiny app

library(shiny)
library(tidyverse)
library(here)
library(ggthemes)

go_annotation <- read.csv("data/goTerms.csv")
go_terms <- unique(unlist(strsplit(as.character(go_annotation[,3]), ";")))

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
    
    # load plot data
    rel_expr <- read_csv("data/rel_expr.csv")
    strain_meta <- read_csv("data/strain_meta.csv")
    umap_df <- read_csv("data/umap.csv")
    
    
    #Find the GO domain selected and change the options on the response checkboxes for the Heatmap Panel
    observe({
        # domain_outputs <- go_annotation %>% 
        #     filter(go_domain == input$go_domain_heatmap) # "Biological process" # 
        # 
        # responses <- domain_outputs %>% 
        #     distinct(go_annotation) %>% 
        #     pull(go_annotation)
        # 
        # # Can use character(0) to remove all choices
        # if (is.null(responses))
        #     responses <- character(0)
        # 
        # # Can also set the label and select items
        # updateCheckboxGroupInput(session, "inCheckboxGroup_heatmap",
        #                          label = paste("Select which responses to visualise"),
        #                          choices = responses,
        #                          selected = responses
        # )
        # 
        # 
        # # populate the "Order by:" dropdown based on GO domain selected by user
        # domain2_outputs <- go_annotation %>%
        #     filter(go_domain == input$go_domain_heatmap) # e.g. "Biological process" input$inCheckboxGroup
        # 
        # dropdown_responses <- domain2_outputs %>%
        #     distinct(go_annotation) %>%
        #     pull(go_annotation)
        # 
        # updateSelectInput(session, "order_by_heatmap",
        #                   choices = dropdown_responses,
        #                   selected = dropdown_responses
        # )
        
        # #Find the GO domain selected and change the options on the response checkboxes for the UMAP Panel
        # domain_outputs <- go_annotation %>% 
        #     filter(go_domain == input$go_domain_UMAP) # "Biological process" # 
        # 
        # responses <- domain_outputs %>% 
        #     distinct(go_annotation) %>% 
        #     pull(go_annotation)
        # 
        # # Can use character(0) to remove all choices
        # if (is.null(responses))
        #     responses <- character(0)
        # 
        # updateSelectInput(
        #     session, 
        #     "goTag",
        #     label = "Select GO tag to mark",
        #     choices = responses
        # )
        # Can also set the label and select items
        updateSelectInput(session, "response_UMAP",
                                 label = paste("Select which response to visualise"),
                                 choices = responses,
                                 selected = responses
        )
    })
    
    
    # Heatmap of RNA expression data for different strains of yeast
    # with requested GO domain
    
    # output$heat <- renderPlot({
    #     
    #     # filter based on ui input
    #     my_go_domain <- go_annotation %>% 
    #         filter(go_domain == input$go_domain_heatmap) # "Biological process"
    #     my_strain_type <- strain_meta %>%
    #         filter(strain_tag_type == input$strain_tag_type_heatmap) # "primary"
    #     
    #     # compare RNA expression of strains with go_annotation1 and go_annotation2
    #     heatmap_by_GO <- rel_expr %>% 
    #         left_join(my_go_domain, by="gene_name") %>%
    #         left_join(my_strain_type, by="culture_treatment") %>%
    #         group_by(go_annotation, strain_tag) %>% 
    #         summarise(rel_expr = mean(rel_expr)) %>% 
    #         ungroup()
    #     
    #     # filter the heatmap based on UI checkboxes
    #     user_filtered_heatmap <- heatmap_by_GO %>% 
    #         filter(go_annotation %in% input$inCheckboxGroup_heatmap) 
    #     
    #     # specify how to reorder the heatmap based on UI dropdown selection
    #     heatmap_order <- heatmap_by_GO %>%
    #         filter(go_annotation == input$order_by_heatmap) %>%
    #         mutate(strain_tag = fct_reorder(strain_tag, -rel_expr)) %>%
    #         distinct(strain_tag) %>%
    #         pull() %>%
    #         sort() %>%
    #         as.character()
    #     
    #     ggplot(user_filtered_heatmap, aes(x=strain_tag %>% fct_relevel(heatmap_order), y= go_annotation )) + 
    #         geom_tile(aes(fill=rel_expr)) +
    #         scale_fill_viridis_c() +
    #         ggtitle("Mean transcript abundance") +
    #         theme_few() +
    #         theme(plot.title = element_text(size = 20, hjust = 0.5, lineheight = 4)) + 
    #         theme(axis.text.x = element_text(angle = 90, hjust=0.99, vjust=0.5)) +
    #         theme(axis.title = element_text(size = 16)) +
    #         ylab(input$go_domain_heatmap) +
    #         xlab(input$strain_tag_type_heatmap) +
    #         labs(fill="Norm. rel. expr.")
    #     
    # })
    # 
    output$umap <- renderPlot({

        filter_query <- input$goTag
        # filtered_values <- go_annotation %>%
        #     filter(go_annotation == {{ filter_query }}) %>%
        #     pull(gene_name)
        filtered_values <- go_annotation[grep(filter_query, go_annotation[,3]),1]

        column_name <- str_replace(filter_query, " ", "_")

        filter_df <- umap_df %>%
            mutate({{ column_name }} := map_lgl(gene, function(x) x %in% filtered_values))

        ggplot(filter_df, aes_string("UMAP1", "UMAP2", color = column_name)) +
            geom_point(size = 0.5) +
            theme_few() +
            #scale_color_few() +
            ggtitle("UMAP Cluster Projection") +
            theme(plot.title = element_text(size = 20, hjust = 0.5, lineheight = 4)) +
            theme(axis.title = element_text(size = 16)) +
            labs(fill=str_to_title(column_name))

    })

})