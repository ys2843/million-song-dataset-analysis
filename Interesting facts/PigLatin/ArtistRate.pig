Ra = LOAD 'MusicAnalysis/MSD/yahoo_artist_rating/ydata-ymusicratings-v1_0.txt.tmp' USING PigStorage('	') as tistID: chararray, Rate: long);

Artist = LOAD 'MusicAnalysis/MSD/yahoo_artist_rating/ydata-ymusic-artist-names-v1_0.txt' USING PigStorage('	') as (ArtistID: chararray, Artistname: chararray);

Rate = FILTER Ra by (Rate <= 100) and (Rate >= 0);

J = JOIN Artist by ArtistID, Rate by ArtistID;

Re = FOREACH J GENERATE Artist::ArtistID as ArtistID, Artist::Artistname as Artistname, Rate::Rate as Rate;

Res = GROUP Re by (ArtistID, Artistname);

Resu = FOREACH Res GENERATE group.Artistname, AVG(Re.Rate) as R;

Result = ORDER Resu by R Desc;

store Result into 'MusicAnalysis/OutputFiles/ArtistRate' USING PigStorage(',');

