## Load and explore the expression data and associated metadata

library(tidyverse)

# expression matrix, note that first column is gene names. coercing to rownames
# expect 6071x93
SC_expression <- read.csv("data/SC_expression.csv", row.names = 1)

# expect 92x4
condition_annotation <- read.csv("data/conditions_annotation.csv", stringsAsFactors = FALSE)

# expect 6071x3
labels_BP <- read.csv("data/labelsBP.csv", stringsAsFactors = FALSE)

# expect 6071x3
labels_CC <- read.csv("data/labelsCC.csv", stringsAsFactors = FALSE)

# expect 6071x3
labels_MF <- read.csv(
  "data/labelsMF.csv",
  stringsAsFactors = FALSE,
  header = FALSE,
  col.names = c("gene", "validation", "localization")
)

# metadata has 6072 rows instead of 6071. turns out there is an extra row
# with a gene called "gene." must remove
# table(labels_MF$gene %in% rownames(SC_expression))
# setdiff(labels_MF$gene, rownames(SC_expression))

labels_BP <- labels_BP[labels_BP$gene != "gene", ]
labels_CC <- labels_BP[labels_CC$gene != "gene", ]
labels_MF <- labels_BP[labels_MF$gene != "gene", ]

stopifnot(all(table(rownames(SC_expression) %in% labels_BP$gene)))
stopifnot(all(table(rownames(SC_expression) %in% labels_CC$gene)))
stopifnot(all(table(rownames(SC_expression) %in% labels_MF$gene)))
