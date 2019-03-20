theme_pru <- function() {
  font <- "sans"

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
                                          margin=ggplot2::margin(0,0,0,0)),
    plot.caption = ggplot2::element_blank(),
    #This leaves the caption text element empty, because it is set elsewhere in the finalise plot function

    #Legend format
    #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
    legend.position = "right",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    #legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family=font,
                                        size=10,
                                        color="#222222"),

    #Axis format
    #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
    axis.title.x = ggplot2::element_blank(),
    axis.title.y = ggplot2::element_text(family = font,
                                       size = 11,
                                       color = "#222222"),
    axis.text = ggplot2::element_text(family=font,
                                      size=10,
                                      color="#222222"),
    axis.text.x = ggplot2::element_text(vjust = -0.8),  #margin=ggplot2::margin(0,0,0,0),
    axis.ticks = ggplot2::element_blank(),
    axis.line.y = ggplot2::element_blank(),
    axis.line.x = ggplot2::element_line(colour = "#D5D5D5",
                                        size = 1.2,
                                       linetype = "solid",
                                       lineend = "round"),

    #Grid lines
    #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(color="#D5D5D5"),
    panel.grid.major.x = ggplot2::element_blank(),

    #Blank background
    #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
    panel.background = ggplot2::element_rect(fill = "#FFFFFF"), #"#deebf7" 	#FFFFFF #f7fbff

    #Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 22)
    strip.background = ggplot2::element_rect(fill="black"),
    strip.text = ggplot2::element_text(size  = 10,  hjust = 0)
  )
}

