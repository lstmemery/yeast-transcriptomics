here::here()
# Get file
expression <- read.csv("02_expression.csv", header = T, row.names = 1)

# See which rows have all zeros
zeros <- apply(expression, 1, function(x) return(length(which(x == 0))))

# Generate new data frame
newExpression <- expression[which(zeros != ncol(expression)),]

# Write to file
write.csv(newExpression, "03_SC_expression.csv", row.names = T)
