rm(list = ls())

setwd("C:\\Users\\rafael.ladeira\\Documents\\MEGA\\LITC-UFMG\\GRASP_Tabu\\DataSets\\real_datasets\\madelon")

madelon.train.data   <- read.table("raw_data\\madelon_train.data.txt")
madelon.train.labels <- read.table("raw_data\\madelon_train.labels.txt")
madelon.test.data    <- read.table("raw_data\\madelon_valid.data.txt")
madelon.test.labels  <- read.table("raw_data\\madelon_valid.labels.txt")

is.nan.data.frame <- function(x)
  do.call(cbind, lapply(x, is.nan))

madelon.train <- as.data.frame(scale(madelon.train.data))
madelon.train[is.nan(madelon.train)] <- 0
madelon.train$label <- as.factor(madelon.train.labels[,1])

madelon.test <- as.data.frame(scale(madelon.test.data))
madelon.test$label <- as.factor(madelon.test.labels[,1])

rm(list = 
     c("madelon.train.data",
     "madelon.train.labels",
     "madelon.test.data",
     "madelon.test.labels"))

save.image("madelon.RData")
