rm(list = ls())

library(rDatasets)

datasetPath <- file.path("dataParsing", "realDatasets", "steelPlatesFaults")

steelData <- read.table(file.path(datasetPath, "Faults.NNA.txt"))
varNames <- readLines(file.path(datasetPath, "Faults27x7_var.txt"))

classData <- steelData[, 28:34]
steelData <- steelData[, -(28:34)]

classNames <- varNames[(28:34)]
colnames(classData) <- classNames
colnames(steelData) <- varNames[-(28:34)]

temp <- data.frame(class = rep(NA, nrow(steelData)))

for (className in classNames) {
  cData <- classData[, className]
  temp$class[which(cData == 1)] <- className
}

classVector <- as.factor(temp$class)

steelPlatesFaults_ <- buildDataAbstraction(
  name = "Steel_Plates_Faults",
  data = steelData,
  labels = classVector)

save(arceneTrain_,
     file = file.path(datasetPath, "steelPlatesFaults_.RData"))
