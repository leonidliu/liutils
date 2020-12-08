#' Cross Tabulation and Table Creation
#'
#' Equivalent of base::table(), except where useNA = "always" by default. See
#' documentation for base::table() for more information.
#'
#' @export
table2 <- function(...,
                   exclude = if (useNA == "no")
                     c(NA, NaN),
                   useNA = "always",
                   dnn = list.names(...),
                   deparse.level = 1) {
  list.names <- function(...) {
    l <- as.list(substitute(list(...)))[-1L]
    nm <- names(l)
    fixup <- if (is.null(nm))
      seq_along(l)
    else
      nm == ""
    dep <- vapply(l[fixup], function(x)
      switch(
        deparse.level +
          1,
        "",
        if (is.symbol(x))
          as.character(x)
        else
          "",
        deparse(x, nlines = 1)[1L]
      ), "")
    if (is.null(nm))
      dep
    else {
      nm[fixup] <- dep
      nm
    }
  }
  miss.use <- missing(useNA)
  miss.exc <- missing(exclude)
  useNA <- if (miss.use && !miss.exc && !match(NA, exclude,
                                               nomatch = 0L))
    "ifany"
  else
    match.arg(useNA)
  doNA <- useNA != "no"
  if (!miss.use && !miss.exc && doNA && match(NA, exclude,
                                              nomatch = 0L))
    warning("'exclude' containing NA and 'useNA' != \"no\"' are a bit contradicting")
  args <- list(...)
  if (!length(args))
    stop("nothing to tabulate")
  if (length(args) == 1L && is.list(args[[1L]])) {
    args <- args[[1L]]
    if (length(dnn) != length(args))
      dnn <- if (!is.null(argn <- names(args)))
        argn
    else
      paste(dnn[1L], seq_along(args), sep = ".")
  }
  bin <- 0L
  lens <- NULL
  dims <- integer()
  pd <- 1L
  dn <- NULL
  for (a in args) {
    if (is.null(lens))
      lens <- length(a)
    else if (length(a) != lens)
      stop("all arguments must have the same length")
    fact.a <- is.factor(a)
    if (doNA)
      aNA <- anyNA(a)
    if (!fact.a) {
      a0 <- a
      a <- factor(a, exclude = exclude)
    }
    add.na <- doNA
    if (add.na) {
      ifany <- (useNA == "ifany")
      anNAc <- anyNA(a)
      add.na <- if (!ifany || anNAc) {
        ll <- levels(a)
        if (add.ll <- !anyNA(ll)) {
          ll <- c(ll, NA)
          TRUE
        }
        else if (!ifany && !anNAc)
          FALSE
        else
          TRUE
      }
      else
        FALSE
    }
    if (add.na)
      a <- factor(a, levels = ll, exclude = NULL)
    else
      ll <- levels(a)
    a <- as.integer(a)
    if (fact.a && !miss.exc) {
      ll <- ll[keep <- which(match(ll, exclude, nomatch = 0L) ==
                               0L)]
      a <- match(a, keep)
    }
    else if (!fact.a && add.na) {
      if (ifany && !aNA && add.ll) {
        ll <- ll[!is.na(ll)]
        is.na(a) <- match(a0, c(exclude, NA), nomatch = 0L) >
          0L
      }
      else {
        is.na(a) <- match(a0, exclude, nomatch = 0L) >
          0L
      }
    }
    nl <- length(ll)
    dims <- c(dims, nl)
    if (prod(dims) > .Machine$integer.max)
      stop("attempt to make a table with >= 2^31 elements")
    dn <- c(dn, list(ll))
    bin <- bin + pd * (a - 1L)
    pd <- pd * nl
  }
  names(dn) <- dnn
  bin <- bin[!is.na(bin)]
  if (length(bin))
    bin <- bin + 1L
  y <- array(tabulate(bin, pd), dims, dimnames = dn)
  class(y) <- "table"
  y
}
