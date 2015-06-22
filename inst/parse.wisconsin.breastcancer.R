
parse.wisconsin.breastcancer <- function(){

  library(mlbench)
  data(BreastCancer)

  wisconsin.breastcancer <- BreastCancer[complete.cases(BreastCancer),]

  for(i in 2:10){
    wisconsin.breastcancer[, i] <- as.numeric(wisconsin.breastcancer[, i])
  }

  X <- as.matrix(wisconsin.breastcancer[,2:10])
  Y <- as.factor(wisconsin.breastcancer[,11])
  data <- NULL

  ml.wisconsin.breastcancer <-
    list(X = X,
         Y = Y,
         data = function(){
           if(is.null(data)){
             data <<- data.frame(X, Y)
           }
           data
         },
         name = "Wisconsin BreastCancer")

  class(ml.wisconsin.breastcancer) <- append(class(ml.wisconsin.breastcancer), "ml.dataset")

  save("ml.wisconsin.breastcancer", file = file.path("data", "ml.wisconsin.breastcancer.RData"))
}
