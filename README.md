# Transcriptomics in yeast
Yeasts (saccharomyces cerevisiae) are used in the production of some of our diet's most cherished choices such bread (not mentioning wine and beer). There are many other biotechnology applications that use yeast some of which include complex pharmaceuticals production. Yeasts are also great model organisms because of their simple and small genome consisting of approximately 6000 genes. Being single celled organisms also make them great for gene expression analyses as they are more homogenous.

### Data
The data in this project includes gene expression values for 92 yeast strains treated with various stimuli. RNA expression levels are normalized to TPM (transcripts per million), following a default normalization procedure. Data is stored in `data` folder.

### Data Source 
This project is inspired by the yeast-omics dataset shared as a kaggle competition, and the original data can be found [here](https://www.kaggle.com/costalaether/yeast-transcriptomics).

### Goal
The goal of this project is to unravel the genetic mechanisms involved in yeast stress adaptation through building an interactive visualization platform (e.g. shiny application or dashboard) that allows scientists to explore the data more easily. Some visualization suggestions are heatmaps, plots, taxonomy trees for yeast strains, etc.

The tasks we will complete through the duration of hackathon include:
- Estimate gene expression levels based for the normalized RNA-Seq data
- Filter and normalize gene expression
- Perform unsupervised clustering of expression data
- Perform differential expression analysis (DeSEQ)
- Perform gene set enrichment analyses (GSEA)
- Create common visualizations of results (heatmaps, etc.)
- Phylogenetic/Taxonomic trees for yeast strains


### Skills
You will need an introductory knowledge of R, RNA expression analysis workflows, design thinking, and coding skills. Coding in R (or Python) and basic knowledge of git/github is an asset. 

### Software
Please have the latest versions of R and R Bioconductor installed on your laptop prior to the workshop. RStudio (the free version) is highly recommended as well, since we will be teaching in this environment.

- [Install R](https://cran.r-project.org/)   
- [Install R Bioconductor](https://bioconductor.org/install/)   
- [Install RStudio](https://rstudio.com/products/rstudio/download/#download)   

### Suggested preparatory lessons
- [Introduction to Data Science with R](http://shop.oreilly.com/product/0636920034834.do)
- [RNAseq Analysis tutorials in R](https://bioinformatics-core-shared-training.github.io/RNAseq-R/) and [Differential expression Analysis](https://combine-australia.github.io/RNAseq-R/06-rnaseq-day1.html)
- [Data Manipulation and Visualization using R](http://bioinformatics-core-shared-training.github.io/r-intermediate/)
- [RNAseq data analysis workflow](https://github.com/griffithlab/rnaseq_tutorial) 
- [Setting up reproducible projects in R](https://nicercode.github.io/blog/2013-04-05-projects/) and [package management for reproducible R code](https://rviews.rstudio.com/2018/01/18/package-management-for-reproducible-r-code/) and [reproducibility good practices](https://github.com/karthik/rstudio2019)
- [Additional resources from UCSF Data Science Initiative](https://courses.ucsf.edu/course/index.php?categoryid=499)


### Hackathon Schedule

#### Friday, October 18, 2019

Time | Event | Location
-- | -- | --
8:30 AM | Coffee and snacks | LSI, UBC
9:00 AM | hackseq kickoff | LSI, UBC
9:30 AM | Team meet + hacking | LSI, UBC
11:30 AM | Intro to Git/Github Workshop (Optional) | room 1330
1:00 PM | Lunch | LSI, UBC
2:00 PM | Continue hacking | LSI, UBC
5:00 PM | Team Scrum + wrap-up | LSI, UBC
5:30 PM | Unofficial Evening Social | The Gallery, UBC

#### Saturday, October 19, 2019


Time | Event | Location
-- | -- | --
8:30 AM | Coffee and snacks | LSI, UBC
9:00 AM | Hacking! | LSI, UBC
12:00 PM | Lunch | LSI, UBC
2:00 PM | Hacking… | LSI, UBC
5:00 PM | Team Scrum + wrap-up | LSI, UBC
5:30 PM | hackseq Evening Social | BierCraft, UBC

#### Sunday, October 20, 2019

Time | Event | Location
-- | -- | --
8:30 AM | Coffee and snacks | LSI, UBC
9:00 AM | Red-eye hacking | LSI, UBC
12:00 PM | Lunch | LSI, UBC
2:00 PM | Desperate bug-fix time | LSI, UBC
3:30 PM | Team Project Presentations | LSI, UBC
4:30 PM | Coffee Break | LSI, UBC
4:30 PM | Abcellera talk | LSI, UBC
5:00 PM | hackseq19 wrap-up | LSI, UBC
