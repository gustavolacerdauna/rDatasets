rm(list = ls())

library(rDatasets)
library(mlbench)
library(caret)

data(BreastCancer)

BreastCancer[,-11] <- apply(BreastCancer[,-11], 2, as.numeric)

bcBagImputation <- preProcess(BreastCancer, method = "bagImpute")
BreastCancer <- predict(bcBagImputation, BreastCancer)
BreastCancer[,-11] <- apply(BreastCancer[,-11], 2, round)

breastCancer_ <- buildDataAbstraction(
  name = "BreastCancer",
  data = BreastCancer[,-11],
  labels = BreastCancer[,11])

savePath <- file.path(
  "dataParsing", "realDatasets", "breastCancer")

save(breastCancer_,
     file = file.path(
       savePath, "breastCancer_.RData"))
