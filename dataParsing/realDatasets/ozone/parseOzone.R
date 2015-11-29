rm(list = ls())

library(rDatasets)
library(mlbench)
library(caret)

data(Ozone)
classColumn <- 4

Ozone[,-classColumn] <- apply(Ozone[,-classColumn], 2, as.numeric)

ozoneBagImputation <- preProcess(Ozone, method = "bagImpute")
Ozone <- predict(ozoneBagImputation, Ozone)

ozone_ <- buildDataAbstraction(
  name = "Ozone",
  data = Ozone[,-classColumn],
  labels = Ozone[,classColumn])

savePath <- file.path(
  "dataParsing", "realDatasets", "ozone")

save(ozone_,
     file = file.path(
       savePath, "ozone_.RData"))
