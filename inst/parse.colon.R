
parse.colon <- function(){

  library(plsgenomics)
  data(Colon)

  X <- as.matrix(Colon$X)
  Y <- as.factor(Colon$Y)
  data <- NULL

  ml.colon <-
    list(X = X,
         Y = Y,
         data = function(){
           if(is.null(data)){
             data <<- data.frame(X, Y)
           }
           data
         },
         name = "Colon")


  class(ml.colon) <- append(class(ml.colon), "ml.dataset")

  save("ml.colon", file = file.path("data", "ml.colon.RData"))

}
