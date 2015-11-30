rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "threeNorm")

mlBenchThreeNorm <- mlbench.threenorm(1000, d=2)
plot(mlBenchThreeNorm)

threeNormData <- as.data.frame(mlBenchThreeNorm)

threeNormData <- data.frame(threeNormData[,1:2],
                           sapply(1:8, function(i) runif(1000)),
                           threeNormData[,3])
colnames(threeNormData) <- c(paste("F", 1:10, sep = ""), "class")


threeNorm_ <- buildDataAbstraction(
  name = "Three_Norm",
  data = threeNormData[, -11],
  labels = threeNormData[, 11])

save(threeNorm_,
     file = file.path(
       datasetPath, "threeNorm_.RData"))
