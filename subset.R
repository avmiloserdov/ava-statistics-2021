library('openxlsx')
args <- commandArgs()

m <- 10 + as.numeric(args[8])
l <- c()
for (i in 10:m) {
  l <- append(l,args[i])
}
k <- as.numeric(args[7])
df <- openxlsx::read.xlsx(args[6], sheet = k)

df_1 <- subset(df, df[[args[9]]] %in% l)

print(df_1)
write.xlsx(df_1, file = "subset.xlsx")
