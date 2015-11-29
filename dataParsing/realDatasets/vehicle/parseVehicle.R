rm(list = ls())

library(rDatasets)
library(mlbench)
library(caret)

data(Vehicle)
classColumn <- 19

Vehicle[,-classColumn] <- apply(Vehicle[,-classColumn], 2, as.numeric)

vehicle_ <- buildDataAbstraction(
  name = "Vehicle",
  data = Vehicle[,-classColumn],
  labels = Vehicle[,classColumn])

savePath <- file.path(
  "dataParsing", "realDatasets", "vehicle")

save(vehicle_,
     file = file.path(
       savePath, "vehicle_.RData"))
