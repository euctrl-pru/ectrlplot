pru_palette <- c("#92D24A", "#FBC294", "#e6b8b7", "#C0504E", "#2E5D8C", "#BFBFBF")

#' A diverging, colorblind safe color palette
#'
#' @importFrom scales manual_pal
#' @export
#' @examples
#' library(scales)
#' show_col(pru_pal()(6))
pru_pal <- function() { manual_pal(pru_palette) }

#' Discrete color & fill scales based on the PRU palette
#'
#' See [pru_pal]().
#'
#' @md
#' @inheritDotParams ggplot2::discrete_scale -expand -position
#' @rdname scale_pru
#' @importFrom ggplot2 discrete_scale expand_scale
#' @export
#' @examples
#' library(ggplot2)
#' library(scales)
#'
#' g <- ggplot(mpg[1:48,], aes(displ, hwy, colour = class)) +
#'     geom_point()
#' g + scale_color_pru()
#'
#' p <- ggplot(mpg[1:108,], aes(class)) +
#'     geom_bar(aes(fill = manufacturer))
#' p + scale_fill_pru()

scale_colour_pru <- function(...) { discrete_scale("colour", "pru", pru_pal(), ...) }

#' @export
#' @rdname scale_pru
scale_color_pru <- scale_colour_pru

#' @export
#' @rdname scale_pru
scale_fill_pru <- function(...) { discrete_scale("fill", "pru", pru_pal(), ...) }
