rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "simplex")

mlBenchSimplex <- mlbench.simplex(n = 1000, sd = 0.3)
plot(mlBenchSimplex)

library(lattice)
cloud(x.3~x.1+x.2, groups=classes, data=as.data.frame(mlBenchSimplex))

simplexData <- as.data.frame(mlBenchSimplex)

simplexData <- data.frame(simplexData[,1:3],
                         sapply(1:7, function(i) runif(1000)),
                         simplexData[,4])
colnames(simplexData) <- c(paste("F", 1:10, sep = ""), "class")


simplex_ <- buildDataAbstraction(
  name = "Simplex",
  data = simplexData[, -11],
  labels = simplexData[, 11])

save(simplex_,
     file = file.path(
       datasetPath, "simplex_.RData"))
