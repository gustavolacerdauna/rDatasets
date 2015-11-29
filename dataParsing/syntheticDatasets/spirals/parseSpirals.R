rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "spirals")

mlBenchSpirals <- mlbench.spirals(1000, cycles = 2, sd=0)
plot(mlBenchSpirals)

spiralsData <- as.data.frame(mlBenchSpirals)

spiralsData <- data.frame(spiralsData[,1:2],
                           sapply(1:8, function(i) runif(1000)),
                           spiralsData[,3])
colnames(spiralsData) <- c(paste("F", 1:10, sep = ""), "class")


spirals_ <- buildDataAbstraction(
  name = "Spirals",
  data = spiralsData[, -11],
  labels = spiralsData[, 11])

save(spirals_,
     file = file.path(
       datasetPath, "spirals_.RData"))
