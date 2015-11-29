rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "circle")

mlBenchCircle <- mlbench.circle(1000, 2)
plot(mlBenchCircle)

circleData <- as.data.frame(mlBenchCircle)

circleData <- data.frame(circleData[,1:2],
                         sapply(1:8, function(i) runif(1000)),
                         circleData[,3])
colnames(circleData) <- c(paste("F", 1:10, sep = ""), "class")


circle_ <- buildDataAbstraction(
  name = "Circle",
  data = circleData[, -11],
  labels = circleData[, 11])

save(circle_,
     file = file.path(
       datasetPath, "circle_.RData"))
