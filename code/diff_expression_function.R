## This script is to perform differential expression analysis 


library(tidyverse)
library(limma)
library(here)

expr_mat <- read_csv(here("data/04_remove_underscores_average_replicates/04_SC_expression.csv"))
group_table <- read_csv(here("data/05_grouping_experiments/05_grouping_table.csv"))

# only keep non-duplicated IDs
group_table <- group_table[!duplicated(group_table$ID),]

# first column is gene name. save to its own vector and turn into rownames of 
# expression matrix
gene_symbols <- expr_mat$gene
expr_mat <- as.matrix(expr_mat[,colnames(expr_mat) != "gene"])
rownames(expr_mat) <- gene_symbols


checkGroupNames <- function(group1, group2) {
  ## This code will ensure that the submitted groups for comparison in limma 
  ## are valid. Groups cannot overlap in any manner, and "SI" cannot exist
  ## as a standalone group. Refer to group table for the acceptable group names.
  group1 <- group1[order(group1)]
  group2 <- group2[order(group2)]
  if (identical(group1, group2)) {
    stop("Groups must be unique")
  }
  if (group1 == "SI" || group2 == "SI") {
    stop("SI only has one sample, cannot use as group")
  }
  if (any(group1 %in% group2)) {
    stop("Groups cannot share any samples")
  }
}

matchSamples <- function(group1, group2) {
  ## Subset the samples to match the submitted groups
  groups <- c(group1, group2)
  matched_samples <- group_table %>% 
    filter(Group %in% groups) %>% 
    select(ID, Group)
}

getDiffExpressedResults <- function(group1, group2) {
  ## Assumes that the expression matrix and metadata table have already been defined.
  
  checkGroupNames(group1, group2)
  matched_samples <- matchSamples(group1, group2)
  
  subset_matrix <- expr_mat[, which(colnames(expr_mat) %in% matched_samples$ID)]
  design_mat <- model.matrix(~matched_samples$Group)
  lm_fit <- eBayes(lmFit(subset_matrix, design_mat))
  
  summary_table <- topTable(
    lm_fit,
    adjust = "fdr",
    sort.by = "B",
    number = Inf,
    genelist = gene_symbols
  )
}

plotVolcano <- function(results_table) {
  ## Expects the table returned by getDiffExpressedResults
  
  # Assign binary vector to determine if results are significant for coloring
  results_table$Color <- rep(0, nrow(results_table))
  for (i in 1:nrow(results_table)) {
    if (abs(results_table$logFC[i]) > 2 &&
        results_table$adj.P.Val[i] < 0.05) {
      results_table$Color[i] <- 1
    }
  }
  
  g <-
    ggplot(results_table, aes(
      x = logFC,
      y = -log10(adj.P.Val),
      color = as.factor(Color)
    )) +
    geom_point(alpha = 0.6, size = 0.8) +
    theme_classic() +
    geom_hline(yintercept = -log10(0.05), linetype = "dotted") +
    geom_vline(xintercept = 2, linetype = "dotted") +
    geom_vline(xintercept = -2, linetype = "dotted") +
    xlab("Log fold change") +
    ylab("Significance") +
    scale_color_manual(values = c("black", "red")) +
    theme(legend.position = "none",
          text = element_text(size=20))
  
  return (g)
}