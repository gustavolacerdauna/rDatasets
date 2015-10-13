rm(list = ls())

setwd("C:\\Users\\rafael.ladeira\\Documents\\MEGA\\LITC-UFMG\\GRASP_Tabu\\DataSets\\real_datasets\\Musk (Version 2)")

is.substr <- function(str, substr){
  length(grep(substr, str)) > 0
}

parse.musk.data <- function(musk.data){
   
  # Convert label column (the first one) to factors
  labels.as.characters <- sapply(musk.data[, 1],
                                 function(l){
                                   ifelse(is.substr(l, "NON"), "NON-MUSK", "MUSK")
                                 })
  
  # eliminates useless columns and scales the data
  musk.data <- as.data.frame(scale(musk.data[, c(-1,-2)]))
  musk.data$label <- as.factor(labels.as.characters)
  musk.data
}


musk2.test <- parse.musk.data(read.csv("raw_data\\clean1.data"))
musk2.train <- parse.musk.data(read.csv("raw_data\\clean2.data"))

rm(list = 
     c("is.substr",
       "parse.musk.data"))

save.image("musk2.RData")
