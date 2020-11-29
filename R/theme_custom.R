#' Apply custom ggplot2 theme
#'
#' Function containing a custom ggplot2 theme, modified from `theme_bw()`.
#'
#' @param base_size base font size
#' @param base_family base font family
#' @param base_line_size base line size
#' @param base-rect_size base rectangle size
#'
#' @export
theme_custom <- function (base_size = 12,
                          base_family = "",
                          base_line_size = base_size / 22,
                          base_rect_size = base_size / 22) {
  ggplot2::theme_grey(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size
  ) %+replace%

    ggplot2::theme(
      panel.background = ggplot2::element_rect(fill = "white", colour = NA),
      panel.border = ggplot2::element_rect(fill = NA, colour = "grey20"),
      panel.grid = ggplot2::element_line(colour = "grey92"),
      panel.grid.minor = ggplot2::element_line(size = rel(0.5)),
      strip.background = ggplot2::element_rect(fill = "grey85", colour = "grey20"),
      legend.key = ggplot2::element_rect(fill = "white", colour = NA),
      complete = TRUE
    ) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(face = "bold"),
      plot.subtitle = ggplot2::element_text(face = "italic"),
      axis.title.x = ggplot2::element_text(margin = ggplot2::margin(7, 0, 0, 0)),
      axis.title.y = ggplot2::element_text(margin = ggplot2::margin(0, 7, 0, 7)),
      legend.position = "bottom"
    )
}
