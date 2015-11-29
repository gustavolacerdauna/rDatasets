rm(list = ls())

library(rDatasets)

datasetPath <- file.path("dataParsing", "realDatasets", "ionosphere")

ionosphereData <- read.table(file.path(datasetPath, "ionosphere.data.txt"), sep = ",")

ionosphere_ <- buildDataAbstraction(
  name = "Ionosphere",
  data = apply(ionosphereData[, -35], 2, as.numeric),
  labels = as.factor(ionosphereData[, 35]))

save(ionosphere_,
     file = file.path(datasetPath, "ionosphere_.RData"))
