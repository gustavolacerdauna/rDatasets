rm(list = ls())

library(rDatasets)
library(titanic)
library(caret)

data(titanic_train)

parseData <- function(titanicData) {

  titanicData$Name <- as.numeric(as.factor(titanicData$Name))
  titanicData$PassengerId <- as.numeric(titanicData$PassengerId)
  titanicData$Survived <- as.numeric(titanicData$Survived)
  titanicData$Pclass <- as.numeric(titanicData$Pclass)
  titanicData$Sex <- as.numeric(as.factor(titanicData$Sex))
  titanicData$SibSp <- as.numeric(titanicData$SibSp)
  titanicData$Parch <- as.numeric(titanicData$Parch)
  titanicData$Ticket <- as.numeric(as.factor(titanicData$Ticket))
  titanicData$Cabin <- as.numeric(as.factor(titanicData$Cabin))
  titanicData$Embarked <- as.numeric(as.factor(titanicData$Embarked))

  titanicData$Age <- as.numeric(titanicData$Age)
  agePreProcess <- preProcess(data.frame(titanicData$Age), method = "medianImpute")
  titanicData$Age <- (predict(agePreProcess, data.frame(titanicData$Age)))[,1]

  return(titanicData)
}

titanic_train <- parseData(titanic_train)

titanic_ <- buildDataAbstraction(
  name = "Titanic",
  data = titanic_train[, -5],
  labels = as.factor(titanic_train[, 5]))

savePath <- file.path(
  "dataParsing", "realDatasets", "titanic")

save(titanic_,
     file = file.path(
       savePath, "titanic_.RData"))



