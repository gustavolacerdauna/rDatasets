rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "smiley")

mlBenchSmiley <- mlbench.smiley(1000, sd1 = 0.3, sd2 = 0.3)
plot(mlBenchSmiley)

smileyData <- as.data.frame(mlBenchSmiley)

smileyData <- data.frame(smileyData[,1:2],
                           sapply(1:8, function(i) runif(1000)),
                           smileyData[,3])
colnames(smileyData) <- c(paste("F", 1:10, sep = ""), "class")


smiley_ <- buildDataAbstraction(
  name = "Smiley",
  data = smileyData[, -11],
  labels = smileyData[, 11])

save(smiley_,
     file = file.path(
       datasetPath, "smiley_.RData"))
