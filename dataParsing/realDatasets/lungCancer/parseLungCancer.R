rm(list = ls())

library(rDatasets)
library(caret)

datasetPath <- file.path("dataParsing", "realDatasets", "lungCancer")

lungCancerData <- read.table(file.path(datasetPath, "lung-cancer.data.txt"), sep = ",")
varNames <- readLines(file.path(datasetPath, "lung-cancer.names.txt"))

lungCancerData <- apply(
  lungCancerData, 2,
  function(col) {
    nUnknown <- sum(col == "?")
    if (nUnknown == 0)
      return(as.numeric(col))

    col[col == "?"] <- NA
    return(as.numeric(col))
  })

bImput <- preProcess(lungCancerData, method = "bagImpute")
lungCancerData <- predict(bImput, lungCancerData)
lungCancerData <- apply(lungCancerData, 2, round)

lungCancer_ <- buildDataAbstraction(
  name = "Lung_Cancer",
  data = lungCancerData[, -1],
  labels = lungCancerData[, 1])

save(lungCancer_,
     file = file.path(datasetPath, "lungCancer_.RData"))
