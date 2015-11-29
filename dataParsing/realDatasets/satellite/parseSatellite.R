rm(list = ls())

library(rDatasets)
library(mlbench)
library(caret)

data(Satellite)
classColumn <- 37

Satellite[,-classColumn] <- apply(Satellite[,-classColumn], 2, as.numeric)

satellite_ <- buildDataAbstraction(
  name = "Satellite",
  data = Satellite[,-classColumn],
  labels = Satellite[,classColumn])

savePath <- file.path(
  "dataParsing", "realDatasets", "satellite")

save(satellite_,
     file = file.path(
       savePath, "satellite_.RData"))
