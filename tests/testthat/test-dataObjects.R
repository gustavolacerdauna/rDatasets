
context("dataObjects")

test_that("data objects are formatted correctly", {

  library(randomForest)

  dataPath <- "../../data"

  dataFileNames <- list.files(path = dataPath)

  for (dataObjectName in dataFileNames) {
    load(file.path(dataPath, dataObjectName))
  }

  dataObjectNames <- ls(pattern = "*_")
  datasets_ <- list()
  e <- environment()

  expect_true(length(dataObjectNames) == length(dataFileNames))

  for (dataObjectName in dataObjectNames) {
    evalExpression("dataObject <- e[[dataObjectName]]; datasets_[[dataObjectName]] <- dataObject")
  }

  cat("\n")

  accuracies <-
    sapply(datasets_,
           function (d) {
             cat("predicting over", d$name)

             train <- sample(nrow(d$X), 0.7*nrow(d$X))

             model <- randomForest(d$X[train,], d$Y[train])

             pred <- predict(model, d$X[-train,])
             acc <- mean(pred == d$Y[-train])

             cat(" | achieved accuracy:", acc, "\n")

             return(acc)
           })

  expect_true(is.numeric(accuracies))
})
