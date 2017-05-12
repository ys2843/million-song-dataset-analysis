inputs1 = load 'artistcord.txt' USING PigStorage('\t') as (id: chararray, lon: float, lat: float, name: chararray, city: chararray);
inputs2 = load 'msd_genre_dataset.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage() as (genre: chararray, track_id: chararray, artist_name: chararray, title: chararray);
grouper = GROUP inputs2 by (genre, artist_name);
flater = FOREACH grouper GENERATE FLATTEN (group) as (genre, artist_name), COUNT(inputs2);
joiner = JOIN inputs1 by name, flater by artist_name;
