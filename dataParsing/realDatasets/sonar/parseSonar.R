rm(list = ls())

library(rDatasets)
library(mlbench)
library(caret)

data(Sonar)
classColumn <- 61

Sonar[,-classColumn] <- apply(Sonar[,-classColumn], 2, as.numeric)

sonar_ <- buildDataAbstraction(
  name = "Sonar",
  data = Sonar[,-classColumn],
  labels = Sonar[,classColumn])

savePath <- file.path(
  "dataParsing", "realDatasets", "sonar")

save(sonar_,
     file = file.path(
       savePath, "sonar_.RData"))
