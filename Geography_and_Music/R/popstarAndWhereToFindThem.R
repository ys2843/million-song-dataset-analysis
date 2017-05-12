popstarCord <- read.table('popstarCord.txt', header = TRUE, fill=TRUE, sep='\t')
ggmap(map) + geom_point(data=artistscord, aes(x=latitude, y=longtitude), size=1, color="blue", alpha=0.5) + geom_point(data=popstarCord, aes(x=lat, y=long), size=2, color="green", alpha=0.8)
