 #' Add PRU theme to ggplot chart
 #'
 #' This function allows you to add the pru theme to your ggplot graphics.
 #' @keywords theme_pru
 #' @export
 #' @examples
 #' library(ggplot2)
 #'
 #' p1 <- ggplot(mpg, aes(displ, hwy)) +
 #'  geom_point() +
 #'  labs(title = 'Scatterplot example in ggplot2',
 #'       subtitle = 'A plot that is only useful for demonstration purposes')
 #' p1 + theme_pru()
 #'
 #' p2 <- ggplot(mpg[1:108,], aes(class)) +
 #'  geom_bar(aes(fill = manufacturer)) +
 #'  labs(title = 'Barplot example in ggplot2',
 #'       subtitle = 'A plot that is only useful for demonstration purposes')
 #' p2 + theme_pru()

 theme_pru <- function() {
    font <- "sans"
    #font <- "Arial Narrow"

    list(
    ggplot2::theme(

      #Text format:
      #This sets the font, size, type and colour of text for the chart's title
      plot.title = ggplot2::element_text(family=font,
                                         size=12,
                                         face="bold",
                                         color="#222222"),
      #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
      plot.subtitle = ggplot2::element_text(family=font,
                                            size=11,
                                            color="#222222",
                                            margin=ggplot2::margin(0, 0, 0.5, 0, "cm")),
      plot.caption = ggplot2::element_blank(),
      #This leaves the caption text element empty, because it is set elsewhere in the add logo function
      plot.margin = grid::unit(c(0,0,0.8,0),"cm"),
      #Legend format
      #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
      legend.position = "right",
      legend.text.align = 0,
      legend.background = ggplot2::element_blank(),
      legend.title = ggplot2::element_blank(),
      legend.key = ggplot2::element_blank(),
      legend.text = ggplot2::element_text(family=font,
                                          size=10,
                                          color="#222222"),

      #Axis format
      #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_text(family = font,
                                           size = 11,
                                           color = "#000000"),
      #axis.text = ggplot2::element_text(family=font,
      #                                  size=10,
      #                                  color="#222222"),
      axis.text.x = ggplot2::element_text(vjust = -0.8,
                                          size = 10,
                                          color = "#222222"),
      axis.text.y = ggplot2::element_text(hjust = 1,
                                          size = 10,
                                          color = "#222222"),
      # axis.ticks = ggplot2::element_blank(),
      axis.line.y = ggplot2::element_blank(),
      axis.line.x = ggplot2::element_line(color = "#D5D5D5",
                                          size = 1.2,
                                          linetype = "solid",
                                          lineend = "round"),

      #Grid lines
      #This removes all minor gridlines and adds major y gridlines.
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_line(color="#D5D5D5"),
      panel.grid.major.x = ggplot2::element_blank(),

      #Blank background
      #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
      panel.background = ggplot2::element_rect(fill = "#FFFFFF"), #"#deebf7" 	#FFFFFF #f7fbff

      #Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 22)
      strip.background = ggplot2::element_rect(fill="#D5D5D5"),
      strip.text = ggplot2::element_text(size  = 10,  hjust = 0)
    ),
    ggplot2::scale_y_continuous(expand = expand_scale(mult = c(0, .1)))
    )
  }


