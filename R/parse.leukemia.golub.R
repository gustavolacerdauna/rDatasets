
parse.leukemia.golub.train <- function(){

  library(SIS)
  data(leukemia.train)

  X <- as.matrix(leukemia.train[, -7130])
  Y <- as.factor(leukemia.train[, 7130])
  data <- NULL

  ml.golub.leukemia.train <-
    list(X = X,
         Y = Y,
         data = function(){
           if(is.null(data)){
             data <<- data.frame(X, Y)
           }
           data
         },
         name = "train data for golub leukemia")


  class(ml.golub.leukemia.train) <- append(class(ml.golub.leukemia.train), "ml.dataset")
  save("ml.golub.leukemia.train", file = file.path("data", "ml.golub.leukemia.train.RData"))
}

parse.leukemia.golub.test <- function(){

  library(SIS)
  data(leukemia.test)

  X <- as.matrix(leukemia.test[, -7130])
  Y <- as.factor(leukemia.test[, 7130])
  data <- NULL

  ml.golub.leukemia.test <-
    list(X = X,
         Y = Y,
         data = function(){
           if(is.null(data)){
             data <<- data.frame(X, Y)
           }
           data
         },
         name = "test data for golub leukemia")


  class(ml.golub.leukemia.test) <- append(class(ml.golub.leukemia.test), "ml.dataset")
  save("ml.golub.leukemia.test", file = file.path("data", "ml.golub.leukemia.test.RData"))
}
