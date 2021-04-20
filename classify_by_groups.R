library(readxl)

# read tables

args <- commandArgs()
print(args)
n <- as.numeric(args[7])
sppTable <- read_excel(args[6], sheet = n)

vascularPlants <- read_excel("SPECIES_1_VASCULAR_PLANT.xlsx")
mossPlants <- read_excel("SPECIES_2_MOSS.xlsx")
liverwortPlants <- read_excel("SPECIES_3_LIVERWORT.xlsx")
lichenPlants <- read_excel("SPECIES_4_LICHEN.xlsx")
unknowPlants <- read_excel("SPECIES_5_Unknow.xlsx")

# create vectors

plantsFromSppTable <- sppTable$`PASL TAXON SCIENTIFIC NAME NO AUTHOR(S)`
vascular <- vascularPlants$ABBREVIAT
moss <- mossPlants$ABBREVIAT
liverwort <- liverwortPlants$ABBREVIAT
lichen <- lichenPlants$ABBREVIAT
unknow <- unknowPlants$ABBREVIAT

# count number of plants by groups

numOfVascular = 0
numOfMoss = 0
numOfLiverwort = 0
numOfLichen = 0
numOfUnknow = 0

for (i in 1:length(plantsFromSppTable)) {
if (plantsFromSppTable[i] %in% vascular == T) numOfVascular = numOfVascular + 1
  else if (plantsFromSppTable[i] %in% moss == T) numOfMoss = numOfMoss + 1
    else if (plantsFromSppTable[i] %in% liverwort == T) numOfLiverwort = numOfLiverwort + 1
     else if (plantsFromSppTable[i] %in% lichen == T) numOfLichen = numOfLichen + 1
      else numOfUnknow = numOfUnknow + 1
  i = i + 1
}

cat(length(plantsFromSppTable), 
    "\n", numOfVascular, 
    "\n", numOfMoss, 
    "\n", numOfLiverwort,
    "\n", numOfLichen,
    "\n", numOfUnknow)

total <- numOfVascular+numOfMoss+numOfLiverwort+numOfLichen+numOfUnknow

if (total == length(plantsFromSppTable)) {
  cat("\nAll plants classifed")
  } else cat("Some plants not classifed")

