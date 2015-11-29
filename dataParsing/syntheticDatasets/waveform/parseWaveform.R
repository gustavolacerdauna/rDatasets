rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "waveform")

mlBenchWaveform <- mlbench.waveform(1000)

waveformData <- as.data.frame(mlBenchWaveform)

waveformData <- data.frame(waveformData[,-22],
                           sapply(1:29, function(i) runif(1000)),
                           waveformData[,22])
colnames(waveformData) <- c(paste("F", 1:50, sep = ""), "class")


waveform_ <- buildDataAbstraction(
  name = "Waveform",
  data = waveformData[, -51],
  labels = waveformData[, 51])

save(waveform_,
     file = file.path(
       datasetPath, "waveform_.RData"))
