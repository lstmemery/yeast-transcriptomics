library(GO.db)

#here("data")

#Get files
labelsCC <- read.csv("03_labelsCC.csv", header = T, row.names = 1)
labelsBP <- read.csv("03_labelsBP.csv", header = T, row.names = 1)
labelsMF <- read.csv("03_labelsMF.csv", header = T, row.names = 1)

# Get the unique list of terms used in the labels files.
termsMF <- names(table(unlist(strsplit(as.character(labelsMF[,2]), ";"))))
termsBP <- names(table(unlist(strsplit(as.character(labelsBP[,2]), ";"))))
termsCC <- names(table(unlist(strsplit(as.character(labelsCC[,2]), ";"))))
# Consolidate all unique terms used
allTerms <- c(termsCC, termsBP, termsMF)

# We want to combine them into one file. Ensure that the gene names are all in the same order
length(which(row.names(labelsBP) == row.names(labelsMF)))
length(which(row.names(labelsBP) == row.names(labelsCC)))
length(which(row.names(labelsCC) == row.names(labelsMF)))

# They seem to be in the same order. So we can combine them 
labels <- cbind(as.character(labelsCC[,2]), as.character(labelsBP[,2]), as.character(labelsMF[,2]))
labels <- paste(labels[,1], labels[,2], labels[,3], sep = ";")
labels <- data.frame(gene = row.names(labelsCC), terms = labels)

# Now we get the GO terms with their IDs, and store in a list 
lst <- as.list(GOTERM)
goTerms <- lapply(lst, function(x) {
  return(slot(x, "Term"))
})
# Retreive the ancestors for all the GO terms (i.e. all nodes from the given term to the root)
BPancestors <- as.list(GOBPANCESTOR)
CCancestors <- as.list(GOCCANCESTOR)
MFancestors <- as.list(GOMFANCESTOR)
ancestors <- c(BPancestors, CCancestors, MFancestors)

# Takes a string and queries all GO terms for that word. It then traces each of those terms back to the root
# and decides which terms are representitive of query results by looking at which terms appeared most in the
# traceback to the root.
# Exampe: "transporter" is an ambiguous term that corresponds to 617 terms in GO (e.g. high-affinity zinc transmembrane transporter activity,
# transporter complex, etc...). So the function taks all 617 terms, and sees which terms occur most in the ancestors of the terms. These
# are taken to be representitive of the 617 terms.
getGoTerms <- function(query) {
  relevantGOTerms <- names(goTerms)[grep(query, goTerms, ignore.case = T)]
  tbl <- sort(table(unlist(ancestors[relevantGOTerms])), decreasing = T)
  retVec <- which(tbl >= quantile(tbl, 0.95))
  if (length(retVec) > 20) {
    return(as.character(goTerms[names(tbl)[1:10]]))
  } else {
    return(as.character(goTerms[names(tbl)[retVec]]))
  }
}

# Gets all the specific representitive terms for each of the ambiguous terms given.
newTerms <- lapply(gsub("_", " ", allTerms), function(x) {
  return(getGoTerms(x))
})
names(newTerms) <- allTerms
newTerms <- newTerms[-which(names(newTerms) == "biological_process")]
newTerms <- newTerms[-which(names(newTerms) == "cellular_component")]
newTerms <- newTerms[-which(names(newTerms) == "molecular_function")]


# Consolidates all the newTerms into one comprehensive list. These words will be ascribed to
# the yeast genes, and given to the user.
keywords <- sort(unique(unlist(newTerms)))

# Adds a column for the new terms.
newLabels <- apply(labels, 1, function(x) {
  oldTags <- strsplit(x[2], ";")[[1]]
  newTags <- paste(unique(unlist(lapply(oldTags, function(y) {
    if (!(y %in% names(newTerms))) {
      if (y == "") {
        return(NULL)
      } else {
        return(y)
      }
    } else {
      return(newTerms[y])
    }
  }))), collapse = ";")
})
names(newLabels) <- labels[,1]
labels$newTerms <- newLabels

write.csv(labels, "05_newLabels.csv", row.names = F)
