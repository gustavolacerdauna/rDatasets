rm(list = ls())

library(rDatasets)

datasetPath <- file.path("dataParsing", "realDatasets",
                         "Musk (Version 2)", "rawData")

isSubString <- function(str, substr){
  return(length(grep(substr, str)) > 0)
}

parseMusk2Data <- function(musk2Data){

  # Convert label column (the first one) to factors
  labelAsCharacter <-
    sapply(musk2Data[, 1],
           function(l) {
             ifelse(isSubString(l, "NON"),
                    "NON-MUSK",
                    "MUSK")
           })

  return(list(
    # eliminates useless columns
    data = as.data.frame(musk2Data[, c(-1,-2)]),
    label = as.factor(labelAsCharacter)
    ))
}

musk2Test  <- read.csv(file.path(datasetPath, "clean1.data"))
musk2Train <- read.csv(file.path(datasetPath, "clean2.data"))

musk2Test  <- parseMusk2Data(musk2Test)
musk2Train <- parseMusk2Data(musk2Train)

musk2Train_ <- buildDataAbstraction(
  name = "Musk_Version_2_Train",
  data = musk2Train$data,
  labels = musk2Train$label)

musk2Test_ <- buildDataAbstraction(
  name = "Musk_Version_2_Test",
  data = musk2Test$data,
  labels = musk2Test$label)

# Analisar porque nome das colunas não batem na descrição do UCI.
musk2MergedData <-
  rbind(musk2Train$data,
        musk2Test$data)

musk2MergedLabels <-
  c(musk2Train$label,
    musk2Test$label)

musk2Merged_ <- buildDataAbstraction(
  name = "Musk_Version_2_Merged",
  data = musk2MergedData,
  labels = musk2MergedLabels)




