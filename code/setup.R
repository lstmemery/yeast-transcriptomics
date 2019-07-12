### SCRIPT TO LOAD PROJECT DEPENDENDIES ###

# install/load packages and dependencies

packages <- c("here", "data.table", "tidyverse", "tabplot", "RColorBrewer", "MASS", "pheatmap",
              "leaflet", "rgdal", "ggridges", "plotly", "ggplot2", "lubridate",  "bcdata",
              "shiny", "lattice", "mapview", "htmltools", "DT", "sf", "bcmaps", "DESeq2")

lapply(packages, library, character.only = TRUE)
