rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "xor")

mlBenchXor <- mlbench.xor(1000)
xorData <- as.data.frame(mlBenchXor)

xorData <- data.frame(xorData[,1:2],
                      sapply(1:8, function(i) runif(1000)),
                      xorData[,3])
colnames(xorData) <- c(paste("F", 1:10, sep = ""), "class")


xorDataSet_ <- buildDataAbstraction(
  name = "Xor",
  data = xorData[, -11],
  labels = xorData[, 11])

save(xorDataSet_,
     file = file.path(
       datasetPath, "xorDataSet_.RData"))
