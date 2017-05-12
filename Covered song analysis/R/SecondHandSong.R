
SecondHandByArtist <- read_excel("~/Desktop/r/Bigdata/SecondHandByArtist.xlsx")
SecondHandByGenre <- read_excel("~/Desktop/r/Bigdata/SecondHandByGenre.xlsx")



q13 <- ggplot(SecondHandByGenre, aes(x = reorder(value1,-value2),y=value2)) + 
  geom_bar(stat = "identity",fill="#FF9999", colour="black") + labs(x = "Genre", y = "Second Hand Number", title = "Second Hand by Genre")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(q13)


SecondHandByArtist = subset(SecondHandByArtist, SecondHandByArtist$value2 > 7 )

q14 <- ggplot(SecondHandByArtist, aes(x = reorder(value1,-value2),y=value2)) + 
  geom_bar(stat = "identity",fill="#FF9999", colour="black") + labs(x = "Artist", y = "Second Hand Number", title = "Second Hand by Artist")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(q14)