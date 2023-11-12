#' Check data.frame (or equivalent) for NAs
#'
#' Function to count the number of NAs in each column in a data.frame.
#'
#' @param dat A data.frame, data.table, or tibble
#'
#' @export
check_na <- function(dat) {
  checkmate::assert_data_frame(dat)
  sapply(dat, function(x) sum(is.na(x)))
}
