
parse.iris <- function(){

  data(iris)

  X <- as.matrix(iris[,-5])
  Y <- as.factor(iris[, 5])
  data <- NULL

  ml.iris <-
    list(X = X,
         Y = Y,
         data = function(){
            if(is.null(data)){
              data <<- data.frame(X, Y)
            }
            data
         },
         name = "Iris")

  class(ml.iris) <- append(class(ml.iris), "ml.dataset")

  save("ml.iris", file = file.path("data", "ml.iris.RData"))
}
