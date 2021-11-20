#' Detect the missing value proportion in columns
#'
#' This function calculate the proportion of missing values for each column,
#' and give the result of those columns with NA values.
#'
#' @param x The dataset with tibble or dataframe format for missing detection
#' @return A tibble/dataframe indicating which columns have NA values and its proportion; empty if no column have NA values.
#' @examples
#' missing_prop_detect(palmerpenguins::penguins)
#' missing_prop_detect(gapminder::gapminder)
#' @export


missing_prop_detect <- function(x) {
  #where <- utils::globalVariables("where")
  if(!(any(class(x) %in% c("tbl","data.frame","spec_tbl_df", "tbl_df")))) {
    stop('sorry, this function only works for tibbles and dataframes!\n',
         'You have provided an object of class: ', class(x))}
  if(0 %in% dim(x)) {
    stop('empty tibble/dataframes!\n')}
  NA_counts <- dplyr::summarise(x,dplyr::across(dplyr::everything(), ~ sum(is.na(.x))/length(.x)))
  dplyr::select(NA_counts,tidyselect::vars_select_helpers$where(~. != 0))
}
