
context("buildDataAbstraction")

test_that("buildDataAbstraction throws exception for bad input", {

  expect_that(buildDataAbstraction(list(), NULL, NULL),
              throws_error("name must have character class."))

  expect_that(buildDataAbstraction(c("a", "b"), NULL, NULL),
              throws_error("name vector must have just one element."))

  expect_that(buildDataAbstraction("teste", NULL, NULL),
              throws_error("data must be either a matrix or a data.frame."))

  expect_that(buildDataAbstraction("teste", matrix(), NULL),
              throws_error("labels must be either a vector or a factor"))

})

test_that("buildDataAbstraction should return a object which complies with the rDatasets data object interface", {

  data(iris)

  iris_ = buildDataAbstraction(
    name = "Iris",
    data = iris[, -5],
    labels = iris[, 5])

  expect_true(iris_$name == "Iris")
  expect_true(class(iris_$X) == "matrix")
  expect_true(class(iris_$Y) == "factor")
  expect_true(class(iris_$data()) == "data.frame")

})
