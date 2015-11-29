rm(list = ls())

library(rDatasets)
library(mlbench)
library(caret)

data(Soybean)
classColumn <- 1

Soybean[,-classColumn] <- apply(Soybean[,-classColumn], 2, as.numeric)

soybeanBagImputation <- preProcess(Soybean, method = "bagImpute")
Soybean <- predict(soybeanBagImputation, Soybean)

Soybean[,-classColumn] <- apply(Soybean[,-classColumn], 2, round)

soybean_ <- buildDataAbstraction(
  name = "Soybean",
  data = Soybean[,-classColumn],
  labels = Soybean[,classColumn])

savePath <- file.path(
  "dataParsing", "realDatasets", "soybean")

save(soybean_,
     file = file.path(
       savePath, "soybean_.RData"))
