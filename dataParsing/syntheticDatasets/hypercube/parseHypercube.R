rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "hypercube")

mlBenchHypercube <- mlbench.hypercube(n = 1000, sd = 0.3)
plot(mlBenchHypercube)

library(lattice)
cloud(x.3~x.1+x.2, groups=classes, data=as.data.frame(mlBenchHypercube))

hypercubeData <- as.data.frame(mlBenchHypercube)

hypercubeData <- data.frame(hypercubeData[,1:3],
                         sapply(1:7, function(i) runif(1000)),
                         hypercubeData[,4])
colnames(hypercubeData) <- c(paste("F", 1:10, sep = ""), "class")


hypercube_ <- buildDataAbstraction(
  name = "Hypercube",
  data = hypercubeData[, -11],
  labels = hypercubeData[, 11])

save(hypercube_,
     file = file.path(
       datasetPath, "hypercube_.RData"))
