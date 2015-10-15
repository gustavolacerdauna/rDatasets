rm(list = ls())

library(rDatasets)

data(iris)

iris_ <- buildDataAbstraction(
  name = "Iris",
  data = iris[, -5],
  labels = iris[, 5])

savePath <- file.path(
  "dataParsing", "realDatasets", "iris")

save(iris_,
     file = file.path(
       savePath, "iris_.RData"))



