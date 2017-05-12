Introduction: 
We believe that to some extent, music has relationship with its origin place. This is why we started to analyze the connection between music and geography. This part has two focuses: 1. The location mentioned in lyrics and reviews; 2. The location of different kind of artists.
Preparing work:
Collect the databases:
Amazon Music Reviews:  With reviews of the music, we can analyse the words that comes from it. 
MusiXmatch dataset: It has a lyric words appearance ranking Top 5000 subset.
Artists Location Dataset: It has coordinate of the artists.
Location Names: States names are used.
Pop Star names: Got from Wikipedia
Set up dumbo or other environment to run Pig. We used pig via cloudera.
Set up environment for R using Rstudio. Load map library and load the U.S. map.
library(ggmap)  
map<-get_map(location='united states', zoom=4, maptype = "terrain", source='google',color='color')
And the codes are mainly in two parts: dealing database with Pig, and present results using RStudio.
