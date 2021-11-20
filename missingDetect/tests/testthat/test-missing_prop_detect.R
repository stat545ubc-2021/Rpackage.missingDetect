empty_data <- dplyr::tibble(
  `A` = NULL,
  `B ` = NULL,
  `C` = NULL)

test_that("inapplicable input gives error", {
  expect_error(missing_prop_detect(c(0,"A",0)))
  expect_error(missing_prop_detect(1))
  expect_error(missing_prop_detect(empty_data), "empty tibble/dataframes!")
})

test_that("output value in the range (0.0,1.0] ",{
  expect_gt(min(missing_prop_detect(palmerpenguins::penguins)),0.0)
  expect_lte(max(missing_prop_detect(palmerpenguins::penguins)),1.0)
})

test_that("correct format and dimension in output",{
  expect_s3_class(missing_prop_detect(palmerpenguins::penguins),c("tbl","data.frame","spec_tbl_df", "tbl_df"))
  expect_setequal((dim(missing_prop_detect(palmerpenguins::penguins))),c(1,5))
  expect_setequal((dim(missing_prop_detect(gapminder::gapminder))),c(1,0))
}
)


NA_cols <- colnames(palmerpenguins::penguins[,3:7])
sex_NA_prop <-sum(is.na(palmerpenguins::penguins$sex))/(dim(palmerpenguins::penguins)[1])
test_that("correct detection and calculation",{
  expect_setequal(colnames(missing_prop_detect(palmerpenguins::penguins)),NA_cols)
  expect_equal(missing_prop_detect(palmerpenguins::penguins)$sex,sex_NA_prop)
})


