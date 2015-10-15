
context("dataObjects")

test_that("data objects are formatted correctly", {

  library(randomForest)

  dataFileNames <- list.files(path = "data")

  for (dataObjectName in dataFileNames) {
    load(file.path("data", dataObjectName))
  }

  dataObjectNames <- ls(pattern = "*_")
  datasets_ <- list()
  e <- environment()

  for (dataObjectName in dataObjectNames) {
    evalExpression("dataObject <- e[[dataObjectName]]; datasets_[[dataObjectName]] <- dataObject")
  }

  accuracies <-
    sapply(datasets_,
           function (d) {
             print(paste("predicting over", d$name))

             train <- sample(nrow(d$X), 0.7*nrow(d$X))

             model <- randomForest(d$X[train,], d$Y[train])

             pred <- predict(model, d$X[-train,])
             return(mean(pred == d$Y[-train]))
           })

  expect_true(is.numeric(accs))
})
