rm(list = ls())

library(rDatasets)
library(caret)

datasetPath <- file.path("dataParsing", "realDatasets", "arrhythmia")

arrhythmiaData <- read.table(file.path(datasetPath, "arrhythmia.data.txt"), sep = ",")

arrhythmiaData <- apply(
  arrhythmiaData, 2,
  function(col) {
    nUnknown <- sum(col == "?")
    if (nUnknown == 0)
      return(as.numeric(col))

    col[col == "?"] <- NA
    return(as.numeric(col))
  })

bImput <- preProcess(arrhythmiaData, method = "bagImpute")
arrhythmiaData <- predict(bImput, arrhythmiaData)
arrhythmiaData <- apply(arrhythmiaData, 2, round)

arrhythmia_ <- buildDataAbstraction(
  name = "Lung_Cancer",
  data = arrhythmiaData[, -1],
  labels = arrhythmiaData[, 1])

save(arrhythmia_,
     file = file.path(datasetPath, "arrhythmia_.RData"))
