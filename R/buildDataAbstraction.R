
#' @title
#' Dataset abstraction builder
#'
#' @description
#' Helper function to generate an abstraction for a
#' specific dataset, according to the interface
#' pattern used in \code{\link{rDatasets}} package.
#'
#' @param name a one element character vector containing the data object name.
#' @param data a matrix or data.frame containing the attributes data.
#' @param labels a vector or factor representing the labels of the dataset.
#'
#' @examples
#'
#' data(iris)
#'
#' iris_ = buildDataAbstraction(name = "Iris", data = iris[, -5], labels = iris[, 5])
#'
#' @export

buildDataAbstraction <- function(name, data, labels) {

  if (is.character(name) == FALSE)
    stop("name must have character class.")
  if (length(name) > 1)
    stop("name vector must have just one element.")
  if (is.matrix(data) == FALSE && is.data.frame(data) == FALSE)
    stop("data must be either a matrix or a data.frame.")
  if (is.data.frame(data) == FALSE)
    data <- as.data.frame(data)
  if (is.vector(labels) == FALSE && is.factor(labels) == FALSE)
    stop("labels must be either a vector or a factor")
  if (is.factor(labels) == FALSE)
    labels <- as.factor(labels)

  library(rUtils)

  data[is.nan(data)] <- 0
  data <- as.matrix(data)

  return( list(
    name = name,
    X = data,
    Y = labels,
    data = function() {
      return( data.frame(
        data,
        Y = labels))
    }))
}
