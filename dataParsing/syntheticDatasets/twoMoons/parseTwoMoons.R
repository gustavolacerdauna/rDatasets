rm(list = ls())

library(rDatasets)
library(R.matlab)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "twoMoons")

twoMoons <- readMat(file.path(datasetPath, "twoMoons.mat"))

colnames(twoMoons$Xo) <- paste("F", 1:7, sep = "")

twoMoons_ <- buildDataAbstraction(
  name = "twoMoons",
  data = twoMoons$Xo,
  labels = twoMoons$Yo[,1])

save(twoMoons_,
     file = file.path(
       datasetPath, "twoMoons_.RData"))
