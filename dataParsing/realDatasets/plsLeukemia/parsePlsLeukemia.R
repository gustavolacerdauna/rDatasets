rm(list = ls())

library(rDatasets)
library(plsgenomics)

data(leukemia)

plsLeukemia_ <- buildDataAbstraction(
  name = "plsgenomics_Leukemia",
  data = leukemia$X,
  labels = leukemia$Y)

savePath <- file.path(
  "dataParsing", "realDatasets", "plsLeukemia")

save(plsLeukemia_,
     file = file.path(
       savePath, "plsLeukemia_.RData"))
