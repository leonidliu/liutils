#' Cross Tabulation and Table Creation
#'
#' Equivalent of base::table(), except where useNA = "always" by default. See
#' documentation for base::table() for more information.
#'
#' @param ... one or more objects which can be interpreted as factors
#' @param useNA by default set to 'always'
#'
#' @export
table2 <- function(...,
                   useNA = "always") {
  table(..., useNA = "always")
}
