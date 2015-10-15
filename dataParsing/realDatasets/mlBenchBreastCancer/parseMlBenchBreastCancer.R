rm(list = ls())

library(rDatasets)
library(mlbench)

data(BreastCancer)

data <- BreastCancer[complete.cases(BreastCancer),]
data$Class <- as.integer(data$Class)
data$Class[ data$Class == 1] <- 1
data$Class[ data$Class == 2] <- 2
for(i in 2:10){
  data[, i] <- as.numeric(data[, i])
}

mlBenchBreastCancer_ <- buildDataAbstraction(
  name = "mlbench_BreastCancer",
  data = data[,2:10],
  labels = data[,11])

savePath <- file.path(
  "dataParsing", "realDatasets", "mlBenchBreastCancer")

save(mlBenchBreastCancer_,
     file = file.path(
       savePath, "mlBenchBreastCancer_.RData"))
