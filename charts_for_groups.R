library(readxl)
library(tibble)
library(ggplot2)
library(gtools)

speciesRichness <- read_excel('datasets_with_species_richness.xlsx')
speciesRichnessSorted <- speciesRichness[order(as.integer(speciesRichness$Vascular),decreasing = FALSE), ]
speciesRichness$Dataset_name <- factor(speciesRichness$Dataset_name, levels = speciesRichness$Dataset_name[order(speciesRichness$Vascular)])

ggplot(data = speciesRichness,
       mapping = aes(y = Vascular,
                     x = Dataset_name)) +
  geom_point(size=2.5) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

str(speciesRichnessSorted)
