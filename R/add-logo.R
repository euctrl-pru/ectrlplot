save_plot <- function (plot_grid, width, height, save_filepath) {
  grid::grid.draw(plot_grid)
  #save it
  ggplot2::ggsave(filename = save_filepath,
                  plot=plot_grid,
                  width=(width/72),
                  height=(height/72))
}

#Left align text
left_align <- function(plot_name, pieces){
  grob <- ggplot2::ggplotGrob(plot_name)
  n <- length(pieces)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}

create_footer <- function (source_name, logo_image_path) {
  #Make the footer
  footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.3, "npc"),
                                           gp = grid::gpar(col = "#969696", lwd = 1)),
                           grid::textGrob(source_name,
                                          x = 0.01, hjust = 0,
                                          y = 0.56,
                                          gp = grid::gpar(family = "sans",
                                                          fontsize = 9)),
                           grid::rasterGrob(png::readPNG(logo_image_path), x = 0.930, y = 0.57))

  return(footer)

}

#' Add Eurocontrol logo and save ggplot chart
#'
#' Running this function will add the Eurocontrol logo in your plot and save it to your specified location.
#' @param plot_name The variable name of the plot you have created that you want to format and save
#' @param source_name The text you want to come after the text 'Source:' in the bottom left hand side of your chart
#' @param save_filepath The exact filepath that you want your plot to be saved to
#' @param width_pixels Width in pixels that you want to save your chart to - defaults to 640
#' @param height_pixels Height in pixels that you want to save your chart to - defaults to 450
#' @param logo_image_path File path for the logo image you want to use in the right hand side of your chart,
#'  which needs to be a PNG file - defaults to Eurocontrol logo that sits within the extdata folder of your package
#' @keywords add_logo
#' @examples
#' library(ggplot2)
#'
#' myplot <- ggplot(mpg, aes(displ, hwy)) +
#' geom_point() +
#' theme_pru()
#'
#' add_logo(plot_name = myplot,
#' source = "Source: The source of my data",
#' width_pixels = 640,
#' height_pixels = 450,
#' save_filepath = "path-name.png")
#'
#' # If you want to use your own logo image,
#' # change the path in the logo-image-path argument
#'
#' \dontrun{
#' add_logo(plot_name = myplot,
#' source = "Source: The source of my data",
#' save_filepath = "path-name.png",
#' width_pixels = 640,
#' height_pixels = 450,
#' logo_image_path = "use-your-logo-image-path")
#' }
#' @export

add_logo <- function(plot_name,
                     source_name,
                     save_filepath=file.path(Sys.getenv("TMPDIR"), "tmp-nc.png"),
                     width_pixels=640,
                     height_pixels=450,
                     logo_image_path = system.file("extdata", "euctrl-logo-wide.png", package = "ectrlplot")) {

  footer <- create_footer(source_name, logo_image_path)

  #Draw your left-aligned grid
  plot_left_aligned <- left_align(plot_name, c("subtitle", "title", "caption"))
  plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer,
                                 ncol = 1, nrow = 2,
                                 heights = c(1, 0.045/(height_pixels/450)))
  save_plot(plot_grid, width_pixels, height_pixels, save_filepath)
  #invisible(plot_grid)
}
