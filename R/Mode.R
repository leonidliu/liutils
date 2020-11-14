#' Mode
#'
#' Function to compute the mode. Supports numeric, character,
#' and factor variables.
#'
#' @param x An R object. Currently supports numeric, character, and factor vectors.
#' @param na.rm a logical value indicating whether NA values should be stripped before the computation proceeds.
#'
#' @references
#' This solution was written by
#' [Ken Williams](https://stackoverflow.com/users/169947/ken-williams) and
#' adapted by [Gregor Thomas](https://stackoverflow.com/users/903061/gregor-thomas).
#' It comes from [this](https://stackoverflow.com/questions/2547402/how-to-find-the-statistical-mode)
#' post on Stack Overflow.
#'
#' @export
Mode <- function(x, na.rm = FALSE) {
  if(na.rm){
    x = x[!is.na(x)]
  }

  ux <- unique(x)
  return(ux[which.max(tabulate(match(x, ux)))])
}
