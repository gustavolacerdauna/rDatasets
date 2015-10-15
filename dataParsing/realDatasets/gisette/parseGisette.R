rm(list = ls())

library(rDatasets)

datasetPath <- file.path("dataParsing", "realDatasets",
                         "gisette", "rawData")

gisetteTrainData   <- read.table(file.path(datasetPath, "gisette_train.data.txt"))
gisetteTrainLabels <- read.table(file.path(datasetPath, "gisette_train.labels.txt"))
gisetteTrainLabels <- gisetteTrainLabels[, 1]

gisetteTrain_ <- buildDataAbstraction(
  name = "Gisette_Train",
  data = gisetteTrainData,
  labels = gisetteTrainLabels)

gisetteValidData   <- read.table(file.path(datasetPath, "gisette_valid.data.txt"))
gisetteValidLabels <- read.table(file.path(datasetPath, "gisette_valid.labels.txt"))
gisetteValidLabels <- gisetteValidLabels[, 1]

gisetteValid_ <- buildDataAbstraction(
  name = "Gisette_Valid",
  data = gisetteValidData,
  labels = gisetteValidLabels)

gisetteMergedData = rbind(gisetteTrainData,
                         gisetteValidData)

gisetteMergedLabels = c(gisetteTrainLabels,
                       gisetteValidLabels)

gisetteMerged_ <- buildDataAbstraction(
  name = "Gisette_Merged",
  data = gisetteMergedData,
  labels = gisetteMergedLabels)

savePath <- file.path(
  "dataParsing", "realDatasets", "gisette")

save(gisetteTrain_,
     file = file.path(
       savePath, "gisetteTrain_.RData"))

save(gisetteValid_,
     file = file.path(
       savePath, "gisetteValid_.RData"))

save(gisetteMerged_,
     file = file.path(
       savePath, "gisetteMerged_.RData"))
