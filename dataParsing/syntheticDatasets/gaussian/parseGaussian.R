rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "gaussian")

mlBenchgaussian <- mlbench.2dnormals(1000)
plot(mlBenchgaussian)

gaussianData <- as.data.frame(mlBenchgaussian)

gaussianData <- data.frame(gaussianData[,1:2],
                      sapply(1:8, function(i) runif(1000)),
                      gaussianData[,3])
colnames(gaussianData) <- c(paste("F", 1:10, sep = ""), "class")


gaussian_ <- buildDataAbstraction(
  name = "gaussian",
  data = gaussianData[, -11],
  labels = gaussianData[, 11])

save(gaussian_,
     file = file.path(
       datasetPath, "gaussian_.RData"))
