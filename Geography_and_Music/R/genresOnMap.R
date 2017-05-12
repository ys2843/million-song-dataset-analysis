genreCord <- read.table('artistCordGenre.txt', header = TRUE, fill=TRUE, sep='\t')
ggmap(map) + geom_point(data=genreCord, aes(x=lat, y=lon, color=genre), size=15, alpha=0.8) + ggtitle("Location of artists in different genre")
