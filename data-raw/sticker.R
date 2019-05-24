library(hexSticker)
library(magick)

imgurl <- "inst/extdata/ectl-logo-symbol.svg"
svg <- image_read_svg(imgurl)
img <- image_write(svg, path = "inst/extdata/ectrl-logo.png", format = "png")

hexSticker::sticker(img,
                    package = "ectrlplot",
                    p_size = 24,
                    p_color = "#00426c",
                    p_x = 1,
                    p_y = 0.6,
                    s_x = 1,
                    s_y = 1.1,
                    s_width = 0.6,
                    asp = 150 / 160,
                    #url = "https://ansperformance.eu",
                    #u_size = 5.1,
                    #u_color = "#008dbb",
                    h_fill="#f7f7f7",
                    h_color = "#00426c",
                    filename = "inst/extdata/sticker.png")

magick::image_read("inst/extdata/sticker.png") %>%
  magick::image_convert(format = "svg") %>%
  magick::image_write(path = here::here("man", "figures", "logo.svg"))
