rm(list = ls())

library(rDatasets)

datasetPath <- file.path("dataParsing", "realDatasets",
                         "arcene", "rawData")

arceneTrainData   <- read.table(file.path(datasetPath, "arcene_train.data.txt"))
arceneTrainLabels <- read.table(file.path(datasetPath, "arcene_train.labels.txt"))
arceneTrainLabels <- arceneTrainLabels[, 1]

arceneTrain_ <- buildDataAbstraction(
  name = "Arcene_Train",
  data = arceneTrainData,
  labels = arceneTrainLabels)

arceneValidData   <- read.table(file.path(datasetPath, "arcene_valid.data.txt"))
arceneValidLabels <- read.table(file.path(datasetPath, "arcene_valid.labels.txt"))
arceneValidLabels <- arceneValidLabels[, 1]

arceneValid_ <- buildDataAbstraction(
  name = "Arcene_Valid",
  data = arceneValidData,
  labels = arceneValidLabels)

arceneMergedData = rbind(arceneTrainData,
                         arceneValidData)

arceneMergedLabels = c(arceneTrainLabels,
                       arceneValidLabels)

arceneMerged_ <- buildDataAbstraction(
  name = "Arcene_Merged",
  data = arceneMergedData,
  labels = arceneMergedLabels)

savePath <- file.path(
  "dataParsing", "realDatasets", "arcene")

save(arceneTrain_,
     file = file.path(
       savePath, "arceneTrain_.RData"))

save(arceneValid_,
     file = file.path(
       savePath, "arceneValid_.RData"))

save(arceneMerged_,
     file = file.path(
       savePath, "arceneMerged_.RData"))
