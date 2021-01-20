library(readxl)
library(tibble)

#Preparing data

args <- commandArgs()
print(args)
n <- as.numeric(args[7])
data <- read_excel(args[6], sheet = n)
data <- column_to_rownames(data, var = colnames(data[2]))

#Первые 5 переменных - системные, 6-я -- название файла, 7-я номер листа, начиная с 8 - название столбцов

m <- 8 + as.numeric(args[8])
colum_names <- c()
for (i in 9:m) {
  colum_names <- append(colum_names,args[i])
}

data <- data[colum_names]

#Principal component analysis

data.pca <- prcomp(na.omit(data),scale=TRUE)
print(data.pca)
biplot(data.pca,scale=TRUE,xlim=c(-0.5,0.5))

