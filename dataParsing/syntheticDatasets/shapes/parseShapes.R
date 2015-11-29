rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "shapes")

mlBenchShapes <- mlbench.shapes(1000)
plot(mlBenchShapes)

shapesData <- as.data.frame(mlBenchShapes)

shapesData <- data.frame(shapesData[,1:2],
                           sapply(1:8, function(i) runif(1000)),
                           shapesData[,3])
colnames(shapesData) <- c(paste("F", 1:10, sep = ""), "class")


shapes_ <- buildDataAbstraction(
  name = "Shapes",
  data = shapesData[, -11],
  labels = shapesData[, 11])

save(shapes_,
     file = file.path(
       datasetPath, "shapes_.RData"))
