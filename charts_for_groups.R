library(readxl)
library(tibble)
library(ggplot2)

args <- commandArgs()
print(args)
n <- as.numeric(args[7])
speciesRichness <- read_excel(args[6], sheet = n)


speciesRichnessSorted <- speciesRichness[order(as.integer(speciesRichness[[args[8]]]),decreasing = FALSE), ]
speciesRichness$Dataset_name <- factor(speciesRichness$Dataset_name, 
                                       levels = speciesRichness$Dataset_name[order(speciesRichness[args[8]])])

ggplot(data = speciesRichness,
       mapping = aes(y = speciesRichness[[args[8]]],
                     x = Dataset_name)) +
  geom_point(size=2.5) +
  ylab(args[8]) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
str(speciesRichnessSorted)
