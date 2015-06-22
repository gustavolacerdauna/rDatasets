
parse.plsgenomics.leukemia <- function(){

  library(plsgenomics)
  data(leukemia)

  X <- as.matrix(leukemia$X)
  Y <- as.factor(leukemia$Y)
  data <- NULL

  ml.plsgenomics.leukemia <-
    list(X = X,
         Y = Y,
         data = function(){
           if(is.null(data)){
             data <<- data.frame(X, Y)
           }
           data
         },
         name = "plsgenomics leukemia")


  class(ml.plsgenomics.leukemia) <- append(class(ml.plsgenomics.leukemia), "ml.dataset")

  save("ml.plsgenomics.leukemia", file = file.path("data", "ml.plsgenomics.leukemia.RData"))

}
