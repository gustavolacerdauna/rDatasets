
context("buildAbstraction")

test_that("buildAbstraction throws exception for bad input", {

  expect_that(buildAbstraction(list(), NULL, NULL),
              throws_error("name must have character class."))

  expect_that(buildAbstraction(c("a", "b"), NULL, NULL),
              throws_error("name vector must have just one element."))

  expect_that(buildAbstraction("teste", NULL, NULL),
              throws_error("data must be either a matrix or a data.frame."))

  expect_that(buildAbstraction("teste", matrix(), NULL),
              throws_error("labels must be either a vector or a factor"))

})

test_that("buildAbstraction should return a object which complies with the rDatasets data object interface", {

  data(iris)

  iris_ = buildAbstraction(
    name = "Iris",
    data = iris[, -5],
    labels = iris[, 5])

  expect_true(iris_$name == "Iris")
  expect_true(class(iris_$X) == "matrix")
  expect_true(class(iris_$Y) == "factor")
  expect_true(class(iris_$data()) == "data.frame")

})
