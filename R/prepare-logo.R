library(magick)
library(rsvg)

logo <- image_read_svg("http://ansperformance.eu/nvctr/reference/figures/euctrl-logo-wide.svg", width = 400)
print(logo)

ectl_logo <- image_scale(logo, "80")
print(ectl_logo)

image_write(ectl_logo, path = "data/ectl-logo.png", format = "png")
