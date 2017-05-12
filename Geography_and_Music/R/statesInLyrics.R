ReviewStatesCord <- read.table('statenameCordinate', header = TRUE)
ggmap(map) + geom_point(data=dfcord, aes(x=lat, y=lon, size=4*sqrt(psize)), color="red", alpha=0.5)+scale_size(range = c(5, 20)) + ggtitle("10 States mentioned most in the music reviews")

