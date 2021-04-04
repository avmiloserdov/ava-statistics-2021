library('openxlsx')
args <- commandArgs()
n <- as.numeric(args[7])
df <- openxlsx::read.xlsx(args[6], sheet = n)

for (i in df$SITEMOISTURE) {
  print(i)
}