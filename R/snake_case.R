#' Snake case
#'
#' Function to convert string or vector of strings to snake case
#' (e.g., snake_case).
#'
#' @param input A string or vector of strings
#'
#' @export
snake_case <- function(input) {
  checkmate::assert_character()
  input <- tolower(input)
  input <- gsub(" ", "_", input)
  input
}
