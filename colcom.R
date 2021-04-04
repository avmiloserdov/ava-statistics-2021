library('openxlsx')
args <- commandArgs()
n <- as.numeric(args[7])
df <- openxlsx::read.xlsx(args[6], sheet = n)

print(names(df))