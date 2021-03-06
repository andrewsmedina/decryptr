context("print")

test_that("printing works", {

  # File system on appveyor isn't unix-like
  skip_on_appveyor()

  # Choose directory
  path <- ifelse(dir.exists("sample-captchas/"), "sample-captchas/",
                 "./tests/testthat/sample-captchas/")

  # Setup
  files <- list.files(path, pattern = "_", full.names = TRUE)

  # Read objects we want to print
  cap <- read_captcha(files)

  # Expectations
  expect_output(print(cap), "A list of 10.+01\\. \\\".*sample-captchas//captcha")
  expect_output(print(cap[[1]]), "A captcha.+\\\".*sample-captchas//captcha")
  expect_equal(class(plot(cap[[2]])), "raster")
})
