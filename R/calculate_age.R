#' Calculate age
#'
#' Function to calculate age.
#'
#' @param from date of birth
#' @param to date at which age should be calculated
#'
#' @references
#' Contributed by Jim to this [StackOverflow thread](https://stackoverflow.com/questions/3611314/calculate-ages-in-r/25450756#25450756).
#'
#' @export
calculate_age <- function(from, to) {
  from_lt = as.POSIXlt(from)
  to_lt = as.POSIXlt(to)

  age = to_lt$year - from_lt$year

  ifelse(to_lt$mon < from_lt$mon |
           (to_lt$mon == from_lt$mon & to_lt$mday < from_lt$mday),
         age - 1, age)
}
