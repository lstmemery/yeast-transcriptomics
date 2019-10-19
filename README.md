Link to the work-in-progress dashboard cna be found here: https://lstmemery.shinyapps.io/yeastomics/


# Transcriptomics in yeast
Yeasts (Saccharomyces cerevisiae) are used in the production of some of the most cherished choices of our diet, such as bread (not mentioning wine and beer). There are many other biotechnology applications that use yeast, some of which include complex pharmaceuticals production. Yeasts are also great model organisms because of their simple and small genome consisting of approximately 6000 genes. Being single celled organisms also make them great for transcriptome analyses as gene expression is homogenous. As part of our Vancouver-based hackathon (hackseq19) project we will be examining a yeast transcriptome dataset. The dataset consists of gene expression changes from yeast strains that have been treated with various stimuli such as heat, phenol lysis, ethanol treatment, etc. It is not entirely clear from the metadata why certain strains or mutants were picked or how the stimuli differ for some experiments. It is, however, known that the data has been [scraped](https://github.com/rtwillett/yeastract_spider/) off of the web from various sources, aggregated and made accessible through the Kaggle competition site. We are also provided with gene expression data, normalized to Transcript Per Million (TPM). As a team, our aim is to clean, analyze, and communicate the results of our explorations through clear documentation of procedures and an interactive application.

### Data
The data in this project includes gene expression values for 92 yeast strains treated with various stimuli. RNA expression levels are normalized to TPM (transcripts per million), following a default normalization procedure. Data is stored in `data` folder.
- The `SC_expression.csv` file contains gene expression of yeast strains in the experiments.
- The `labels.csv` files pertain to gene validation status and molecular function (MF), cellular component (CC), and biological processes (BP) of those genes. 
- The `conditions_annotation.csv` file explain the yeast strains and experimental conditions.

### Data Source 
This project is inspired by the yeast-omics dataset shared as a Kaggle competition, and the original data can be found [here](https://www.kaggle.com/costalaether/yeast-transcriptomics).

### Goal
The goal of this project is to unravel the genetic mechanisms involved in yeast stress adaptation through building a visualization platform (e.g. shiny application) that allows scientists to explore the data interactively. The tasks we will attempt in the hackathon include:
- Perform unsupervised and supervised clustering of experimental conditions based on gene expression 
- Perform gene set enrichment analyses (GSEA, ReactomePA)
- Create visualizations of gene expression (heatmaps, barplots, etc.)
- Phylogenetic/Taxonomic trees for yeast strains


### Software
- [Install R](https://cran.r-project.org/)   
- [Install R Bioconductor](https://bioconductor.org/install/)   
- [Install RStudio](https://rstudio.com/products/rstudio/download/#download)   

### Suggested preparatory resources
- [Introduction to Data Science with R](http://shop.oreilly.com/product/0636920034834.do)
- [RNAseq Analysis tutorials in R](https://bioinformatics-core-shared-training.github.io/RNAseq-R/) and [Differential expression Analysis](https://combine-australia.github.io/RNAseq-R/06-rnaseq-day1.html)
- [Mastering Shiny](https://mastering-shiny.org/)
- [Data Manipulation and Visualization using R](http://bioinformatics-core-shared-training.github.io/r-intermediate/)
- [RNAseq data analysis workflow](https://github.com/griffithlab/rnaseq_tutorial) 
- [Setting up reproducible projects in R](https://nicercode.github.io/blog/2013-04-05-projects/) and [package management for reproducible R code](https://rviews.rstudio.com/2018/01/18/package-management-for-reproducible-r-code/) and [reproducibility good practices](https://github.com/karthik/rstudio2019)
- [Yeast pathway analysis in R](https://bioconductor.org/packages/release/bioc/vignettes/ReactomePA/inst/doc/ReactomePA.html)   
- [Additional resources from UCSF Data Science Initiative](https://courses.ucsf.edu/course/index.php?categoryid=499)
- [Package development, maintenance, documentation, and peer-review](https://devguide.ropensci.org/building.html#documentation)
- [Shiny Apps for Transcriptome Visualizations](https://academic.oup.com/bioinformatics/article/33/3/447/2525724)
- [RNAseq Shiny app options](https://www.rna-seqblog.com/tag/shiny/)


### Team Members
Noushin Nabavi, Matthew Emery, Alex Morin, Zuhaib Ahmed, Casey Engstrom, Sedat Demiriz, Shinta Thio, Saelin Bjornson, Siddharth Raghuvanshi, Chris Rider 

### Team Channel
Team collaborations in #p02-yeast channel in [slack](hackseq19.slack.com)
