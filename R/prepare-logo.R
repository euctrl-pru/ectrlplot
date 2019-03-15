library(magick)
library(rsvg)

logo <- image_read_svg("https://upload.wikimedia.org/wikipedia/commons/b/b2/Eurocontrol_logo_2010.svg", width = 400)
print(logo)

ectl_logo <- image_scale(logo, "80")
print(ectl_logo)

image_write(ectl_logo, path = "data/ectl_logo.png", format = "png")
