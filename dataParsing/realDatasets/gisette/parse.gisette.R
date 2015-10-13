rm(list = ls())

setwd("C:\\Users\\rafael.ladeira\\Documents\\MEGA\\LITC-UFMG\\GRASP_Tabu\\DataSets\\real_datasets\\gisette")

gisette.train.data   <- read.table("raw_data\\gisette_train.data.txt")
gisette.train.labels <- read.table("raw_data\\gisette_train.labels.txt")
gisette.test.data    <- read.table("raw_data\\gisette_valid.data.txt")
gisette.test.labels  <- read.table("raw_data\\gisette_valid.labels.txt")

is.nan.data.frame <- function(x)
  do.call(cbind, lapply(x, is.nan))

gisette.train <- as.data.frame(scale(gisette.train.data))
gisette.train[is.nan(gisette.train)] <- 0
gisette.train$label <- as.factor(gisette.train.labels[,1])

gisette.test <- as.data.frame(scale(gisette.test.data))
gisette.test$label <- as.factor(gisette.test.labels[,1])

rm(list = 
     c("gisette.train.data",
     "gisette.train.labels",
     "gisette.test.data",
     "gisette.test.labels"))

save.image("gisette.RData")
