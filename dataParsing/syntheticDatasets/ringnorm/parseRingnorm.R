rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "ringnorm")

mlBenchRingnorm <- mlbench.ringnorm(1000, d=2)
plot(mlBenchRingnorm)

ringnormData <- as.data.frame(mlBenchRingnorm)

ringnormData <- data.frame(ringnormData[,1:2],
                           sapply(1:8, function(i) runif(1000)),
                           ringnormData[,3])
colnames(ringnormData) <- c(paste("F", 1:10, sep = ""), "class")


ringnorm_ <- buildDataAbstraction(
  name = "Ringnorm",
  data = ringnormData[, -11],
  labels = ringnormData[, 11])

save(ringnorm_,
     file = file.path(
       datasetPath, "ringnorm_.RData"))
