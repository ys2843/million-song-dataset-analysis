library(readxl)
library(ggplot2)
library(reshape2)
top5artist <- read_excel("~/Desktop/r/Bigdata/top5artist.xlsx")
rap <- read_excel("~/Desktop/r/Bigdata/rap.xlsx")
country <- read_excel("~/Desktop/r/Bigdata/country.xlsx")
pop <- read_excel("~/Desktop/r/Bigdata/pop.xlsx")
rock <- read_excel("~/Desktop/r/Bigdata/rock.xlsx")
elect <- read_excel("~/Desktop/r/Bigdata/elect.xlsx")
song_count <- read_excel("~/Desktop/r/Bigdata/song_count.xlsx")
tag_count <- read_excel("~/Desktop/r/Bigdata/tag_count.xlsx")
album <- read_excel('~/Desktop/r/Bigdata/album.xlsx')
artist <- read_excel("~/Desktop/r/Bigdata/artist.xlsx")
genre <- read_excel("~/Desktop/r/Bigdata/genre.xlsx")

genreSummary <- read_excel("~/Desktop/r/Bigdata/genreSummary.xlsx")
SecondHandByArtist <- read_excel("~/Desktop/r/Bigdata/SecondHandByArtist.xlsx")
SecondHandByGenre <- read_excel("~/Desktop/r/Bigdata/SecondHandByGenre.xlsx")

q <- ggplot(album,aes(year,count)) + geom_bar(stat = "identity",fill="#FF9999", colour="black") + labs(x = "Year", y = "#Album issued",title = "Albums issued per year")
print(q)

q2 <- ggplot(tag_count, aes(x = reorder(tag,-count),y=count)) + 
  geom_bar(stat = "identity",fill="#FF9999", colour="black") + labs(x = "Style", y = "Popularity",title="Popularity of style")
print(q2)

q3 = ggplot(elect, aes(year, count)) + ggtitle("Electronic")+geom_line(stat = "identity")+ labs(x = "Year", y = "Popularity")
print(q3)
q4 = ggplot(rock, aes(year, count)) + ggtitle("Rock")+geom_line(stat = "identity")+ labs(x = "Year", y = "Popularity")
print(q4)
q5 = ggplot(rap, aes(year, count)) + ggtitle("rap")+geom_line(stat = "identity")+ labs(x = "Year", y = "Popularity")
print(q5)
q6 = ggplot(pop, aes(year, count)) + ggtitle("Pop")+geom_line(stat = "identity")+ labs(x = "Year", y = "Popularity")
print(q6)
q7 = ggplot(country, aes(year, count)) + ggtitle("Country")+geom_line(stat = "identity")+ labs(x = "Year", y = "Popularity")
print(q7)

q8 <- ggplot(artist,aes(reorder(artist,count),count))  + ggtitle("Top 10 popular artist")
q8 + geom_bar(stat="identity",fill="#FF9999", colour="black")+ coord_flip() + labs(x = "ArtistName", y = "Popularity")

genre <- melt(genre, id.vars=c("Month"))
top5artist <- melt(top5artist, id.vars=c("Month"))

q9 <- ggplot(genre,aes(Month,value,group = variable, color = variable)) + geom_line(stat = "identity")+ scale_x_discrete(name = "Time", breaks=1)
print(q9)

q10 <- ggplot(top5artist,aes(Month,value,group = variable, color = variable)) + geom_line(stat = "identity")+ scale_x_discrete(name = "Time", breaks=1)
print(q10)

genredata = subset(genreSummary, value2 == "positive" | value2 == "negative")
for (i in c("folk", "classic pop and rock", "classical", "dance and electronica", "hip-hop", "jazz and blues","metal","pop","punk","soul and reggae")) {
  subdata = subset(genredata, value1 == i)
  myLabel = as.vector(subdata$value2)
  myLabel = paste(myLabel, "(", round(subdata$value3 / sum(subdata$value3) * 100, 2), "%)        ", sep = "")   
   q11<- ggplot(subdata,aes(x = "", value3,fill = value2)) + geom_bar(stat = 'identity',width = 1) + coord_polar(theta = "y") + labs(x = "", y = "Percentage",fill = "motion",title = subdata$value1) +scale_fill_discrete(breaks = subdata$value2, labels = myLabel)
  print(q11)
   }

genredata2 = subset(genreSummary, value2 != "positive" & value2 != "negative")
genredata2
for (i in c("folk", "classic pop and rock", "classical", "dance and electronica", "hip-hop", "jazz and blues","metal","pop","punk","soul and reggae")) {
  subdata = subset(genredata2, value1 == i)
  myLabel = as.vector(subdata$value2)
  myLabel = paste(myLabel, "(", round(subdata$value3 / sum(subdata$value3) * 100, 2), "%)        ", sep = "")   
  q12<- ggplot(subdata,aes(x = "", value3,fill = value2)) + geom_bar(stat = 'identity',width = 1) + coord_polar(theta = "y") + labs(x = "", y = "Percentage",fill = "motion",title = subdata$value1) +scale_fill_discrete(breaks = subdata$value2, labels = myLabel)
  print(q12)
}

q13 <- ggplot(SecondHandByGenre, aes(x = reorder(value1,-value2),y=value2)) + 
  geom_bar(stat = "identity",fill="#FF9999", colour="black") + labs(x = "Genre", y = "Second Hand Number", title = "Second Hand by Genre")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(q13)

SecondHandByArtist = subset(SecondHandByArtist, SecondHandByArtist$value2 > 7 )

q14 <- ggplot(SecondHandByArtist, aes(x = reorder(value1,-value2),y=value2)) + 
  geom_bar(stat = "identity",fill="#FF9999", colour="black") + labs(x = "Artist", y = "Second Hand Number", title = "Second Hand by Artist")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(q14)
