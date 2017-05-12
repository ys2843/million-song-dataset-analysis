
genreSummary <- read_excel("~/Desktop/r/Bigdata/genreSummary.xlsx")


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
