#' Check data.frame (or equivalent) for NAs
#'
#' Function to count the number of NAs in each column in a data.frame.
#'
#' @param dat A data.frame, data.table, or tibble
#'
#' @export
check_na <- function(dat) {
  if (!(class(dat) %in% c("data.frame", "data.table", "tbl", "tbl_df", "spec_tbl_df"))) {
    stop("argument 'dataframe' not of class data.frame, data.table, tbl, or tbl_df")
  }
  sapply(dat, function(x) sum(is.na(x)))
}
