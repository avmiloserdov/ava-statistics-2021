library(readxl)
library(tibble)

#Preparing data

args <- commandArgs()
print(args)
n <- as.numeric(args[7])
data <- read_excel(args[6], sheet = n)
data <- column_to_rownames(data, var = colnames(data[2]))

#First 5 vars is trash, 6 file name, 7 sheet number, 8 - number of columns, 
#9 - column names

m <- 8 + as.numeric(args[8])
column_names <- c()
for (i in 9:m) {
  column_names <- append(column_names,args[i])
}

data <- data[column_names]

#Principal component analysis

data.pca <- prcomp(na.omit(data),scale=TRUE)
print(data.pca)
biplot(data.pca,scale=TRUE,xlim=c(-0.5,0.5))

