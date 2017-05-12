val gen = spark.read.csv("outputResult/GenreArtistRate.csv")

gen.registerTempTable("GenreArtist")

val gene = spark.sql("select * from GenreArtist")

val newname = Seq("Genre", "Artistname", "rate")

val newGenre = gene.toDF(newname:_*)

newGenre.registerTempTable("GA")

newGenre.printSchema


%sql
select Artistname, rate from GA where Genre = "classic pop and rock" limit 10

%sql
select Artistname, rate from GA where Genre = "dance and electronica" limit 10

%sql
select Artistname, rate from GA where Genre = "folk" limit 10

%sql
select Artistname, rate from GA where Genre = "hip-hop" limit 10

%sql
select Artistname, rate from GA where Genre = "jazz and blues" limit 10

%sql
select Artistname, rate from GA where Genre = "metal" limit 10

%sql
select Artistname, rate from GA where Genre ="pop" limit 10

%sql
select Artistname, rate from GA where Genre ="punk" limit 10

%sql
select Artistname, rate from GA where Genre ="soul and reggae" limit 10



%sql
select Genre, avg(rate) as AvgRate from GA group by Genre order by AvgRate DESC