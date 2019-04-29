pru_palette <- c('#67001f','#b2182b','#d6604d','#f4a582','#fddbc7', '#92c5de','#4393c3','#2166ac','#053061')

#' A muted, qualitative color palette
#'
#' @export
#' @examples
#' library(scales)
#' scales::show_col(pru_pal()(9))
pru_pal <- function() { manual_pal(pru_palette) }

#' Discrete color & fill scales based on the pru palette
#'
#' See [pru_pal]().
#'
#' @md
#' @inheritDotParams ggplot2::discrete_scale -expand -position
#' @rdname scale_pru
#' @export
scale_colour_pru <- function(...) { discrete_scale("colour", "pru", pru_pal(), ...) }

#' @export
#' @rdname scale_pru
scale_color_pru <- scale_colour_pru

#' @export
#' @rdname scale_pru
scale_fill_pru <- function(...) { discrete_scale("fill", "pru", pru_pal(), ...) }