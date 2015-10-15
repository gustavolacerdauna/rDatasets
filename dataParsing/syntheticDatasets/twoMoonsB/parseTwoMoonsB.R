rm(list = ls())

library(rDatasets)
library(R.matlab)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "twoMoonsB")

twoMoonsB <- readMat(file.path(datasetPath, "twoMoonsB.mat"))

twoMoonsB_ <- buildDataAbstraction(
  name = "TwoMoonsB",
  data = twoMoonsB$Xo,
  labels = twoMoonsB$Yo[,1])

save(twoMoonsB_,
     file = file.path(
       datasetPath, "twoMoonsB_.RData"))
