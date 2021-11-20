
<!-- README.md is generated from README.Rmd. Please edit that file -->

# missingDetect

<!-- badges: start -->
<!-- badges: end -->

The goal of missingDetect is to calculate the proportion of missing
values for each column,and output the result of columns having NA
existed.

## Installation

missingDetect is not yet on CRAN. But, you can download it from this
repository using the following R command:

``` r
devtools::install_github("Rpackage_MenghongHuang/missingDetect")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2021/Rpackage_MenghongHuang")
```

## Example

This is a basic example which shows you how to detect data missing
problems of a tibble dataset:

``` r
library(missingDetect)
missing_prop_detect(palmerpenguins::penguins)
#> # A tibble: 1 × 5
#>   bill_length_mm bill_depth_mm flipper_length_mm body_mass_g    sex
#>            <dbl>         <dbl>             <dbl>       <dbl>  <dbl>
#> 1        0.00581       0.00581           0.00581     0.00581 0.0320
```

This package is special because it also works on a input of dataframe:

``` r
df<- as.data.frame(palmerpenguins::penguins)
missing_prop_detect(df)
#>   bill_length_mm bill_depth_mm flipper_length_mm body_mass_g        sex
#> 1    0.005813953   0.005813953       0.005813953 0.005813953 0.03197674
```
