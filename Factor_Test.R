library(RInSp)
x <- Stickleback[,3:8]
round(cor(x), 2)
is.data.frame(x)
stick.fa = factanal(na.omit(x), factors = 2, method = "mls", scores = "regression")
stick.fa
