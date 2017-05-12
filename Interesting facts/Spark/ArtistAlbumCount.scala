val gen = spark.read.csv("outputResult/ArtistAlbumCount.csv")
gen.registerTempTable("Artist")
gen.printSchema

%sql 
select _c0 as artistname, _c1 as AlbumnNum from Artist Limit 10