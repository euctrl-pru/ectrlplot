library(ggplot2)

palette <- c('#67001f','#b2182b','#d6604d','#f4a582','#fddbc7',
             '#d1e5f0','#92c5de','#4393c3','#2166ac','#053061')

# scatterplot
b <- ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point() +
  theme_pru() +
  scale_colour_manual(values = palette[c(1:4,7,9,10)]) +
  labs(title = 'My title',
       subtitle = 'My subtitle',
       x = 'x lab',
       y = 'y lab') +
  theme(axis.line.y = ggplot2::element_line(colour = "#D5D5D5",
                                            size = 1.2,
                                            linetype = "solid",
                                            lineend = "round"),
        panel.grid.major.y = ggplot2::element_blank())

# barplot
g <- ggplot(mpg[1:141,], aes(class)) +
  geom_bar(aes(fill = manufacturer)) +
  theme_pru() +
  scale_y_continuous(expand = c(0,0))  +
  scale_fill_manual("legend", values = palette) +
  #scale_fill_manual("legend", values = c('#92c5de','#4393c3','#2166ac')) +
  labs(title = 'My title',
       subtitle = 'My subtitle',
       x = 'x lab',
       y = 'y lab')

w <- ggplot(mpg, aes(displ, model, fill = class)) +
  geom_bar(stat = "identity") +
  theme_pru() +
  facet_grid(manufacturer ~ ., scales = "free", space = "free") +
  theme(strip.text.y = element_text(angle = 0),
        axis.line.y = ggplot2::element_line(colour = "#D5D5D5",
                                            size = 1.2,
                                            linetype = "solid",
                                            lineend = "round"),
        axis.line.x = ggplot2::element_blank(),
        panel.grid.major.y = ggplot2::element_blank())


add_logo(plot_name = g,
         source = "Source: ",
         save_filepath = "data/myplot.png",
         width_pixels = 640,
         height_pixels = 450)

#scale_fill_manual(values = c('#b2182b','#d6604d','#f4a582','#fddbc7','#d1e5f0','#92c5de','#4393c3'))
