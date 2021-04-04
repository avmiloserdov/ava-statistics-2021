
library('openxlsx')
library('xtable')
args <- commandArgs()
print(args)
n <- as.numeric(args[7])
df <- openxlsx::read.xlsx(args[6], sheet = n)
t <-  Filter(function(x)!all(is.na(x)), df)
a <- cor.test(x=t[[args[8]]], y=t[[args[9]]])
print(a)





