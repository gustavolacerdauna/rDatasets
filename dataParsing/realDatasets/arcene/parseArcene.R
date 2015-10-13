rm(list = ls())

datasetPath <- file.path("dataParsing", "realDatasets",
                         "arcene", "rawData")

arceneTrainData   <- read.table(file.path(datasetPath, "arcene_train.data.txt"))
arceneTrainLabels <- read.table(file.path(datasetPath, "arcene_train.labels.txt"))
arceneTestData    <- read.table(file.path(datasetPath, "arcene_valid.data.txt"))
arceneTestLabels  <- read.table(file.path(datasetPath, "arcene_valid.labels.txt"))

is.nan.data.frame <- function(x)
  do.call(cbind, lapply(x, is.nan))

arcene.train <- as.data.frame(scale(arcene.train.data))
arcene.train[is.nan(arcene.train)] <- 0
arcene.train$label <- as.factor(arcene.train.labels[,1])

arcene.test <- as.data.frame(scale(arcene.test.data))
arcene.test$label <- as.factor(arcene.test.labels[,1])

rm(list =
     c("arcene.train.data",
     "arcene.train.labels",
     "arcene.test.data",
     "arcene.test.labels"))

save.image("arcene.RData")
