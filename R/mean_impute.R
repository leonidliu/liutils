#' Simple mean-imputation
#'
#' Mean-impute a variable.
#'
#' @param x a variable that may contain missing values
#'
#' @export
mean_impute <- function(x) dplyr::coalesce(x, mean(x, na.rm = T))
