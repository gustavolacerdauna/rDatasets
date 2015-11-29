rm(list = ls())

library(rDatasets)

datasetPath <- file.path("dataParsing", "realDatasets", "spamBase", "rawData")

spamBaseData <- read.table(file.path(datasetPath, "spambase.data"), sep = ",")
spamBaseData <- apply(spamBaseData, 2, as.numeric)

spamBase_ <- buildDataAbstraction(
  name = "Spam_Base",
  data = spamBaseData[, -58],
  labels = spamBaseData[, 58])

savePath <-file.path("dataParsing", "realDatasets", "spamBase")

save(spamBase_,
     file = file.path(
       savePath, "spamBase_.RData"))
