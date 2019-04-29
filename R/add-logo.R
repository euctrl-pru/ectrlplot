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
  footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(2, "npc"),
                                           gp = grid::gpar(col = "#969696", lwd = 1.5)),
                           grid::textGrob(source_name,
                                          x = 0.1, hjust = 0,
                                          y = 1.3,
                                          gp = grid::gpar(family = "Arial Narrow",
                                                          fontsize = 9)),
                           grid::rasterGrob(png::readPNG(logo_image_path), x = 0.866, y = 1.3))

  return(footer)

}

#' Add PRU logo and save ggplot chart
#'
#' Running this function will add the PRU logo in your plot and save it to your specified location.
#' @param plot_name The variable name of the plot you have created that you want to format and save
#' @param source_name The text you want to come after the text 'Source:' in the bottom left hand side of your side
#' @param save_filepath Exact filepath that you want the plot to be saved to
#' @param width_pixels Width in pixels that you want to save your chart to - defaults to 640
#' @param height_pixels Height in pixels that you want to save your chart to - defaults to 450
#' @param logo_image_path File path for the logo image you want to use in the right hand side of your chart,
#'  which needs to be a PNG file - defaults to PRU logo that sits within the data folder of your package
#' @return (Invisibly) an updated ggplot object.

#' @keywords add_logo
#' @examples
#' library(ggplot2)
#'
#' myplot <- ggplot(mpg, aes(displ, hwy, colour = class)) +
#' geom_point() +
#' theme_pru()
#'
#' add_logo(plot_name = myplot,
#' source = "The source for my data",
#' save_filepath = "filename_that_my_plot_should_be_saved_to-nc.png",
#' width_pixels = 640,
#' height_pixels = 450,
#' logo_image_path = "data/ectl-logo.png"
#' )
#'
#' @export

add_logo <- function(plot_name,
                     source_name,
                     save_filepath=file.path(Sys.getenv("TMPDIR"), "tmp-nc.png"),
                     width_pixels=640,
                     height_pixels=450,
                     logo_image_path = "data/ectl-logo.png") {

  footer <- create_footer(source_name, logo_image_path)

  #Draw your left-aligned grid
  plot_left_aligned <- left_align(plot_name, c("subtitle", "title", "caption"))
  plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer,
                                 ncol = 1, nrow = 2,
                                 heights = c(1, 0.045/(height_pixels/450)))
  ## print(paste("Saving to", save_filepath))
  save_plot(plot_grid, width_pixels, height_pixels, save_filepath)
  ## Return (invisibly) a copy of the graph. Can be assigned to a
  ## variable or silently ignored.
  invisible(plot_grid)
}
