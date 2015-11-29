rm(list = ls())

library(rDatasets)
library(mlbench)

data(Glass)

Glass[,-10] <- apply(Glass[,-10], 2, as.numeric)

glass_ <- buildDataAbstraction(
  name = "Glass",
  data = Glass[,-10],
  labels = Glass[,10])

savePath <- file.path(
  "dataParsing", "realDatasets", "glass")

save(glass_,
     file = file.path(
       savePath, "glass_.RData"))
