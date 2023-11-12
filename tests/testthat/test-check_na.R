test_that("common classes that aren't data.frame produce error", {
  expect_error(check_na())
  expect_error(check_na(1))
  expect_error(check_na("x"))
})

test_that("correct NA count", {
  expect_equal(check_na(data.frame(x = NA)), c("x" = 1))
})
