statescord <- read.table('stateNameInLyrics.csv', header = TRUE, fill=TRUE, sep=',')
ggmap(map) + geom_point(data=statescord, aes(x=lat, y=lon,  size=sqrt(5000 - no)), color="orange", alpha=0.5) + ggtitle("Mentioned States Top 5") +scale_size(range = c(10, 30))
