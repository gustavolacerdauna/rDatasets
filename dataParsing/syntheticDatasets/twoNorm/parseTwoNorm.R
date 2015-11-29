rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "twoNorm")

mlBenchTwoNorm <- mlbench.twonorm(1000, d=2)
plot(mlBenchTwoNorm)

twoNormData <- as.data.frame(mlBenchTwoNorm)

twoNormData <- data.frame(twoNormData[,1:2],
                           sapply(1:8, function(i) runif(1000)),
                           twoNormData[,3])
colnames(twoNormData) <- c(paste("F", 1:10, sep = ""), "class")


twoNorm_ <- buildDataAbstraction(
  name = "TwoNorm",
  data = twoNormData[, -11],
  labels = twoNormData[, 11])

save(twoNorm_,
     file = file.path(
       datasetPath, "twoNorm_.RData"))
