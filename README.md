Link to the work-in-progress dashboard cna be found here: https://lstmemery.shinyapps.io/yeastomics/


# Transcriptomics in yeast
Yeasts (Saccharomyces cerevisiae) are used in the production of some of the most cherished food choices (e.g. bakery, wine making, and beer brewing). There are many other biotechnology applications that use yeast such as pharmaceutical and biomass production. 

Yeasts are great model organisms because of their simple and small genome consisting of approximately 6000 genes. As single celled organisms, they also make great models for transcriptome analyses as gene expression is homogenous. 

As part of our Vancouver-based hackathon (hackseq19) project examined  yeast transcriptome data scraped off of the [web](https://github.com/rtwillett/yeastract_spider/). The data consists of gene expression changes from yeast strains that have been treated with various stimuli such as heat, phenol lysis, ethanol treatment, etc.  Gene expression was normalized to Transcript Per Million (TPM). As a team, we cleaned, analyzed, and communicated the results of our explorations through development of an interactive dashboard and blog to present our methodologies and code snippets.

### Data
The data in this project includes gene expression values for 92 yeast strains treated with various stimuli. RNA expression levels are normalized to TPM (transcripts per million), following a default normalization procedure. Data is stored in `data` folder.
- The `SC_expression.csv` file contains gene expression of yeast strains in the experiments.
- The `labels.csv` files pertain to gene validation status and molecular function (MF), cellular component (CC), and biological processes (BP) of those genes. 
- The `conditions_annotation.csv` file explain the yeast strains and experimental conditions.

### Data Source 
This project is inspired by the open source yeast-omics dataset shared as a Kaggle competition. The original data can be found [here](https://www.kaggle.com/costalaether/yeast-transcriptomics) and scraped off from [here](https://github.com/rtwillett/yeastract_spider/).


### Methodology
To unravel the genetic mechanisms involved in yeast stress adaptation, we built a visualization platform that allows scientists to explore transcriptome data interactively. The methods implemented to visualize data include dimensionality reduction strategies (Unsupervised and supervised clustering of transcriptome across all experimental conditions. 



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
- [Limma/Glimma/edgeR analyses](https://www.bioconductor.org/packages/devel/workflows/vignettes/RNAseq123/inst/doc/limmaWorkflow.html)
- [Bioinformatics data skills](http://2.droppdf.com/files/5aTvl/bioinformatics-data-skills.pdf)


### Team Members
Noushin Nabavi, Matthew Emery, Alexander Morin, Zuhaib Ahmed, Casey Engstrom, Sedat Demiriz, Shinta Thio, Saelin Bjornson, Siddharth Raghuvanshi, Chris Rider 

### Team Channel
Team collaborations in #p02-yeast channel in [slack](hackseq19.slack.com)
