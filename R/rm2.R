#' Remove all objects
#'
#' Function to remove all objects from the current environment.
#'
#' @export

rm2 <- function() {
  rm(list = ls())
}
