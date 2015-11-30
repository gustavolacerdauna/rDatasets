rm(list = ls())

library(rDatasets)
library(mlbench)

data(HouseVotes84)
classColumn <- 1

HouseVotes84[, classColumn] <- as.factor(HouseVotes84[, classColumn])

HouseVotes84 <- apply(
  HouseVotes84, 1:2,
  function (element) {
    if (is.na(element)) return("NA")
    else return(element)
  })

HouseVotes84 <- as.data.frame(HouseVotes84)

HouseVotes84[,-classColumn] <- apply(
  HouseVotes84[,-classColumn], 2,
  function(col) as.numeric(as.factor(col)))

houseVotes84_ <- buildDataAbstraction(
  name = "HouseVotes84",
  data = HouseVotes84[,-classColumn],
  labels = HouseVotes84[,classColumn])

savePath <- file.path(
  "dataParsing", "realDatasets", "houseVotes")

save(houseVotes84_,
     file = file.path(
       savePath, "houseVotes84_.RData"))
