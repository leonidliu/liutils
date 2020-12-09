#' Simple mean-imputation
#'
#' Mean-impute a variable.
#'
#' @param x a variable that may contain missing values
#'
#' @export
impute <- function(x) dplyr::coalesce(x, mean(x, na.rm = T))
