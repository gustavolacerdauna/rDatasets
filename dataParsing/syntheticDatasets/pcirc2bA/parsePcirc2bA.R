rm(list = ls())

library(rDatasets)
library(R.matlab)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "pcirc2bA")

pcirc2bA <- readMat(file.path(datasetPath, "pcirc2bA.mat"))

colnames(pcirc2bA$Xo) <- paste("F", 1:10, sep = "")

pcirc2bA_ <- buildDataAbstraction(
  name = "Pcirc2bA",
  data = pcirc2bA$Xo,
  labels = pcirc2bA$Yo[,1])

save(pcirc2bA_,
     file = file.path(
       datasetPath, "pcirc2bA_.RData"))
