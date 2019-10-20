## This script is to perform differential expression analysis 

library(tidyverse)
library(limma)
library(here)

expr_mat <- read_csv(here("data/04_remove_underscores_average_replicates/04_SC_expression.csv"))
group_table <- read_csv(here("data/05_grouping_experiments/05_grouping_table"))

# first column is gene name. save to its own vector and turn into rownames of 
# expression matrix

gene_symbols <- expr_mat$gene
expr_mat <- as.matrix(expr_mat[,colnames(expr_mat) != "gene"])
rownames(expr_mat) <- gene_symbols

# testing: arbitrary group comparison

groups <- c(group1 = "QN",
            group2 = "AF")

matched_samples <- group_table %>% 
  filter(Group %in% groups) %>% 
  select(ID, Group)

subset_matrix <- expr_mat[, colnames(expr_mat) %in% matched_samples$ID]

# build the design matrix

design_mat <- model.matrix(~matched_samples$Group)

lm.fit <- eBayes(lmFit(subset_matrix, design_mat))

summary.table <- topTable(lm.fit, 
                          adjust= "fdr", 
                          sort.by= "B",
                          number = Inf, 
                          genelist = gene_symbols,
                          p.value = 0.05)

head(summary.table)

subset_matrix[rownames(subset_matrix) == "YOR303W", ]

filtered_results <- summary.table %>% 
  filter(adj.P.Val < 0.05 & abs(logFC) > 1.5)

# 5279 diff expressed genes is highly suspect
nrow(filtered_results)

# g = ggplot(data=summary.table, aes(x=logFC, y=-log10(adj.P.Val))) +
#   geom_point(alpha=0.4, size=5) +
#   theme(legend.position = "none") +
#   xlim(c(-5, 12)) + ylim(c(0, 5)) +
#   xlab("logFC") + ylab("-log10 p-value")
# 
# g
