# load package dependancy
library(tidyverse)
library(stringr)


# can download limma through the bioconductor:
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("limma")
library(limma)

# set time zone to proper location to make project reproducible across different Machines
options(readr.default_locale=readr::locale(tz="America/Vancouver"))


# Load data-files
conditions_annotation <- read_csv("data/00_raw/conditions_annotation.csv")
SC_expression <- read_csv("data/04_remove_underscores_average_replicates/04_SC_expression.csv")


View(conditions_annotation)


# Create group based on first to char in ID which we believe groups data from the same lab
conditions_annotation$Group <- NA
conditions_annotation$Group <- substr(conditions_annotation$ID, 1, 2)   

# convert everything in primary and secondary to lower case as currently mixed case
conditions_annotation$primary <- str_to_lower(conditions_annotation$primary, locale = "en")

conditions_annotation$secondary <- str_to_lower(conditions_annotation$secondary, locale = "en")

conditions_annotation$Ref <- NA

write.csv(conditions_annotation, here::here("data", "05_grouping_experiments", "05_grouping_table.csv"))

#------------------------------------------------------------------------------------------------

# Use of Limma for differential gene expression
# split out the SA group and merge in gene expression data

group_SA <- conditions_annotation[conditions_annotation$Group == "SA", ]

SA_expression <- SC_expression$gene

saa_subset <- group_SA %>% 
  pull(ID)

SA_expressiontemp <- SC_expression %>% 
  select(saa_subset)

SAtable <- cbind(SA_expression, SA_expressiontemp)
colnames(SAtable)[1] <- "Gene"

SAwildGalactose <- SAtable[,1:3]

rownames(SAwildGalactose) <- SAwildGalactose$Gene

SAwildGalactose$Gene <- NULL

# Limma fit
fit <- lmFit(SAwildGalactose)

SAwildGalactose$fold <- SAwildGalactose$SAASAQ/SAwildGalactose$SAABRQ
SAwildGalactose$pval <- fit$p.value # this doesn't run, no p.value in the data

df <- SAwildGalactose[is.finite(rowSums(SAwildGalactose)),]

# GGplot visualization of differentially expressed genes
g = ggplot(data=df, aes(x=log2(fold), y=-log10(pval))) +
  geom_point(alpha=0.4, size=5) +
  theme(legend.position = "none") +
  xlim(c(-5, 12)) + ylim(c(0, 5)) +
  xlab("log2 fold change") + ylab("-log10 p-value")  





