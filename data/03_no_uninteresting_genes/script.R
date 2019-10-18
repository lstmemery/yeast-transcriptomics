setwd("/home/zuhaib/Desktop/yeastVisualization/yeast-transcriptomics/data")
# Load the epxression data
expression <- read.csv("SC_expression.csv", header = T, row.names = 1)
# conditions <- read.csv("newConditionsAnnotations.csv", header = T)
# labelsBP <- read.csv("labelsBP.csv", header = T)
# labelsMF <- read.csv("labelsMF.csv", header = T)
# labelsCC <- read.csv("labelsCC.csv", header = T)

# Filter 
filteredExpression <- expression[which(filterByExpr(as.matrix(expression))),]
normFilteredExpression <- as.data.frame(normalize.quantiles(as.matrix(filteredExpression)))

# Do a quantile normalization on the columns so that the numbers are comparable
normExpression <- as.data.frame(normalize.quantiles(as.matrix(expression)))
row.names(normExpression) <- row.names(expression)
names(normExpression) <- names(expression)
# logNormExpression <- log(normExpression + 0.1)

#heatmap(as.matrix(expression))
#heatmap(as.matrix(filteredExpression))

# Calculate the standard deviation per row, to see which genes will most likely be uninteresting.
geneSDs <- apply(normExpression, 1, sd)
# To make an educated guess at the threshold at which to remove genes, calculate some summary stats
meanGeneSDs <- mean(geneSDs)
minGeneSDs <- min(geneSDs)
p25GeneSDs <- quantile(geneSDs, 0.25)
medianGeneSDs <- median(geneSDs)
p75GeneSDs <- quantile(geneSDs, 0.75)
maxGeneSDs <- max(geneSDs)
length(which(geneSDs >= 15))

# It seems that a standard deviation of 15 is reasonable. It rid of almost half the genes that aren't too variable across the board.
newExpression <- expression[which(geneSDs >= 15),]
write.csv(newExpression, "03_SC_expression.csv", row.names = T)
