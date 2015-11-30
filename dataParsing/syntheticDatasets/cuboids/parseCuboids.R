rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "cuboids")

mlBenchCuboids <- mlbench.cuboids(1000, relsize=c(3,3,3,1))
plot(mlBenchCuboids)

cuboidsData <- as.data.frame(mlBenchCuboids)

cuboidsData <- data.frame(cuboidsData[,1:3],
                         sapply(1:7, function(i) runif(1000)),
                         cuboidsData[,4])
colnames(cuboidsData) <- c(paste("F", 1:10, sep = ""), "class")


cuboids_ <- buildDataAbstraction(
  name = "Cuboids",
  data = cuboidsData[, -11],
  labels = cuboidsData[, 11])

save(cuboids_,
     file = file.path(
       datasetPath, "cuboids_.RData"))
