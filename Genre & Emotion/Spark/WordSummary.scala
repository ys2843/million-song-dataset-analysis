val W = spark.read.csv("outputResult/WordSummary.csv")

W.registerTempTable("word")

val WORD = spark.sql("select * from word")

val newname = Seq("Genre", "word", "count")

val newWord = WORD.toDF(newname:_*)

newWord.registerTempTable("WordSummary")

newWord.printSchema

%sql
select word, count from WordSummary where Genre = "classic pop and rock" limit 10

%sql
select word, count from WordSummary where Genre = "dance and electronica" limit 10

%sql
select word, count from WordSummary where Genre = "folk" limit 10

%sql
select word, count from WordSummary where Genre = "hip-hop" limit 10

%sql
select word, count from WordSummary where Genre = "jazz and blues" limit 10

%sql
select word, count from WordSummary where Genre = "metal" limit 10

%sql
select word, count from WordSummary where Genre = "pop" limit 10

%sql
select word, count from WordSummary where Genre = "punk" limit 10

%sql
select word, count from WordSummary where Genre = "soul and reggae" limit 10

%sql
select word, count from WordSummary where Genre = "classical" limit 10

