#' Disable scientific notation
#'
#' Function to disable scientific notation.
#'
#' @references
#' Uses the following Stack Overflow
#' [solution](https://stackoverflow.com/questions/25946047/how-to-prevent-scientific-notation-in-r).
#'
#' @export

no_scientific <- function() {
  options(scipen=999)
}
