# Transcriptomics in yeast

Yeasts (saccharomyces cerevisiae) are used in the production of some of the most cherished food choices such as beer, wine, and bread. There are many other biotechnology applications not limited to complex pharmaceuticals. Yeasts are great model organisms for their simple and small genome consisting of approximately 6000 genes. They are also single cell organisms making gene expression more homogenous.

### Data
The dataset in this project consists of gene expression levels for 92 yeast strains treated with various stimuli. RNA expression levels are normalized to TPM (transcripts per million), following a default normalization procedure. Data is stored in `data` folder.

### Data Source 
This project is inspired by the yeast-omics dataset shared as a kaggle competition, and the original data can be found [here](https://www.kaggle.com/costalaether/yeast-transcriptomics).

### Goal
The goal of this project is to unravel the genetic mechanisms involved in yeast stress adaptation through building an interactive visualization platform (e.g. shiny application or dashboard) that allows scientists to explore the data more easily. 

The tasks we will complete through the duration of hackathon include:
- Estimate gene expression levels based for the normalized RNA-Seq data
- Filter and normalize gene expression
- Perform unsupervised clustering of expression data
- Perform differential expression analysis (DeSEQ)
- Perform gene set enrichment analyses (GSEA)
- Create common visualizations of results (heatmaps, etc.)
- Phylogenetic/Taxonomic trees for yeast strains


### Skills
You will need an introductory knowledge of RNA expression analysis workflows, design thinking, and coding skills. Coding in R (or Python) and basic knowledge of git/github is an asset. 

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


### Tentative Schedule

#### **Day 1 - Firday October 18, 2019**

| Time  | Event            |
| ----- | ---------------- |
| 8:30  | Coffee & Snacks  |
| 9:00  | hackseq kickoff  |
| 9:30  | Team meet        |
| 10:00 | Introduction to the data, brainstorming, group-forming |
| 11:30 | Intro to Git/Github Workshop (optional) |
| 13:00 | Lunch |
| 14:00 | Assign tasks and start hacking |
| 17:00 | Team Scrum & wrap-up |
| 17:30 | Unofficial Evening Social |

#### **Day 2 - Saturday October 19, 2019**

| Time  | Event            |
| ----- | ---------------- |
| 8:30  | Coffee & Snacks  |
| 9:00  | Re-cap and planning meeting  |
| 9:30  | Hackity hacking        |
| 11:00 | check-in |
| 12:00 | Lunch |
| 14:00 | Hacking |
| 15:30 | check-in |
| 17:00 | Team Scrum & wrap-up |
| 17:30 | Evening Social |

#### **Day 3 - Sunday October 20, 2019**

| Time  | Event            |
| ----- | ---------------- |
| 8:30  | Coffee & Snacks  |
| 9:00  | Re-cap and planning meeting  |
| 9:30  | Last-minute hacking |
| 11:00 | check-in |
| 12:00 | Lunch |
| 14:00 | Finishing touches |
| 15:30 | Team Project Presentations |
| 16:30 | Coffee Break |
| 17:00 | HackSeq19 Wrap-up |



