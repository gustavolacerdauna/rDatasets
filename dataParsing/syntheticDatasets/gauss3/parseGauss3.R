rm(list = ls())

library(rDatasets)
library(R.matlab)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "gauss3")

gauss3 <- readMat(file.path(datasetPath, "gauss3.mat"))

gauss3_ <- buildDataAbstraction(
  name = "Gauss3",
  data = gauss3$Xo,
  labels = gauss3$Yo[,1])

save(gauss3_,
     file = file.path(
       datasetPath, "gauss3_.RData"))
