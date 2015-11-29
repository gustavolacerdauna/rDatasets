rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "cassini")

mlBenchXor <- mlbench.cassini(5000, relsize = c(4.5,4.5,1))
cassiniData <- as.data.frame(mlBenchXor)

cassiniData <- data.frame(cassiniData[,1:2],
                          sapply(1:8, function(i) runif(5000)),
                          cassiniData[,3])
colnames(cassiniData) <- c(paste("F", 1:10, sep = ""), "class")


cassini_ <- buildDataAbstraction(
  name = "Cassini",
  data = cassiniData[, -11],
  labels = cassiniData[, 11])

save(cassini_,
     file = file.path(
       datasetPath, "cassini_.RData"))
