rm(list = ls())

library(rDatasets)
library(mlbench)

data(DNA)
classColumn <- 181

DNA[,-classColumn] <- apply(DNA[,-classColumn], 2, as.numeric)

dna_ <- buildDataAbstraction(
  name = "DNA",
  data = DNA[,-classColumn],
  labels = DNA[,classColumn])

savePath <- file.path(
  "dataParsing", "realDatasets", "dna")

save(dna_,
     file = file.path(
       savePath, "dna_.RData"))
