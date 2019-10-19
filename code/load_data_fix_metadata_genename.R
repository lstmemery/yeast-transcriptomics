## Load the expression matrix and associated metadata. Fix inconsistency between.
# Resave the cleaned tables.

library(tidyverse)
library(here)

# expression matrix, note that first column is gene names. coercing to rownames
# expect 6071x93
SC_expression <- read.csv(here("data", "00_raw", "SC_expression.csv"))
colnames(SC_expression)[colnames(SC_expression) == "X"] <- "gene"

# expect 92x4
condition_annotation <- read.csv(here("data", "00_raw", "conditions_annotation.csv"), stringsAsFactors = FALSE)

# expect 6071x3
labels_BP <- read.csv(here("data", "01_fixlabels", "labelsBP.csv"), stringsAsFactors = FALSE)

# expect 6071x3
labels_CC <- read.csv(here("data", "01_fixlabels", "labelsCC.csv"), stringsAsFactors = FALSE)

# expect 6071x3
labels_MF <- read.csv(here(
  "data", "01_fixlabels", "labelsMF.csv"),
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


stopifnot(all(table(SC_expression$gene %in% labels_BP$gene)))
stopifnot(all(table(SC_expression$gene %in% labels_CC$gene)))
stopifnot(all(table(SC_expression$gene %in% labels_MF$gene)))


table.names <- c("01_condition_annotation.csv", 
                 "01_labelsBP.csv",
                 "01_labelsCC.csv",
                 "01_labelsMF.csv", 
                 "01_SC_expression.csv")

tables <- list(condition_annotation,
            labels_BP,
            labels_CC,
            labels_MF,
            SC_expression)


for (i in 1:length(tables)) {
  write.table(tables[i], 
              sep = ",",
              quote = FALSE,
              row.names = FALSE,
              paste0(here("data"), table.names[i]))
}
