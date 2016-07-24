# Map of earthquakes in Turkey
# Data from Wikipedia: https://en.wikipedia.org/wiki/List_of_earthquakes_in_Turkey
# Code Inspiration:    http://www.r-bloggers.com/contour-and-density-layers-with-ggmap/
library(ggmap)

earthquakes_turkey <- read.delim("earthquakes_turkey.txt")

lon_center <- mean(earthquakes_turkey$Longitude, na.rm = TRUE)
lat_center <- mean(earthquakes_turkey$Latitude, na.rm = TRUE)

turkey     <- c(lon=lon_center, lat=lat_center)
turkey.map <- get_map(location = turkey, zoom = 5, color = "color")

ggmap(turkey.map, extent = "panel", maprange = TRUE) +
  geom_point(data = earthquakes_turkey, aes(x=Longitude, y=Latitude, size=as.numeric(Magnitude))) +
  geom_density2d(data = earthquakes_turkey, aes(x=Longitude, y=Latitude, size = 0.01, bins = 8, geom = 'polygon'))
