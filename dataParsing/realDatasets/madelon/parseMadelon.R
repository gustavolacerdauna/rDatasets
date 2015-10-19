rm(list = ls())

library(rDatasets)

datasetPath <- file.path("dataParsing", "realDatasets",
                         "madelon", "rawData")

madelonTrainData   <- read.table(file.path(datasetPath, "madelon_train.data.txt"))
madelonTrainData <- apply(madelonTrainData, 2, as.numeric)
madelonTrainLabels <- read.table(file.path(datasetPath, "madelon_train.labels.txt"))
madelonTrainLabels <- madelonTrainLabels[, 1]

madelonTrain_ <- buildDataAbstraction(
  name = "Madelon_Train",
  data = madelonTrainData,
  labels = madelonTrainLabels)

madelonValidData   <- read.table(file.path(datasetPath, "madelon_valid.data.txt"))
madelonValidData <- apply(madelonValidData, 2, as.numeric)
madelonValidLabels <- read.table(file.path(datasetPath, "madelon_valid.labels.txt"))
madelonValidLabels <- madelonValidLabels[, 1]

madelonValid_ <- buildDataAbstraction(
  name = "Madelon_Valid",
  data = madelonValidData,
  labels = madelonValidLabels)

madelonMergedData = rbind(madelonTrainData,
                          madelonValidData)

madelonMergedLabels = c(madelonTrainLabels,
                        madelonValidLabels)

madelonMerged_ <- buildDataAbstraction(
  name = "Madelon_Merged",
  data = madelonMergedData,
  labels = madelonMergedLabels)

savePath <- file.path(
  "dataParsing", "realDatasets", "madelon")

save(madelonTrain_,
     file = file.path(
       savePath, "madelonTrain_.RData"))

save(madelonValid_,
     file = file.path(
       savePath, "madelonValid_.RData"))

save(madelonMerged_,
     file = file.path(
       savePath, "madelonMerged_.RData"))
