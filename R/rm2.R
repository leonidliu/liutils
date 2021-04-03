#' Remove all objects
#'
#' Function to remove all objects from the current environment.
#'
#' @export

rm2 <- function() {
  ENV <- globalenv()
  ll <- ls(envir = ENV)
  rm(list = ll, envir = ENV)
}
