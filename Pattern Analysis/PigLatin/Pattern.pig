song = LOAD 'MusicAnalysis/MSD/SongCSV22.csv' USING PigStorage(',') as (SongNumber: int,TrackID: chararray, SongID: chararray,AlbumID: chararray,AlbumName: chararray,ArtistID: chararray,ArtistLatitude: double,ArtistLocation: chararray,ArtistLongitude: double,ArtistName: chararray,Danceability: double,Duration: double,KeySignature: int,KeySignatureConfidence: double,Tempo: double,TimeSignature: int,TimeSignatureConfidence: double,Title: chararray,Year:int);

songinfo = FOREACH song GENERATE ArtistName, REPLACE(SongID, '"', '') as SongID;

Play = LOAD 'MusicAnalysis/MSD/EchoNest/train_triplets.txt' USING PigStorage('	') as ray, SongID: chararray, times: int);

Filt = Filter Play by (times>4);

Pa = JOIN Filt by SongID, songinfo by SongID;

Pat = FOREACH Pa GENERATE Filt:times as times, songinfo::ArtistName as ArtistName;

Patt = GROUP Pat by Name);

Patte = FOREACH Patt GENERATE groupArtistName as ArtistName, SUM(Pat.times) as SU;

Patter = GROUP Patte byrn = FOREACH Patter GENERATE Patte, COUNT(Patte.ArtistName) as COU;

Res = FILTER Pattern by (COU>9);
--only larger than 10 artists can be used to calculate patterns

Result = ORDER Res by COU desc;

store Result into 'MusicAnalysis/OutputFiles/Pattern' USING PigStorage(',');

--store Result into 'MusicAnalysis/OutputFiles/GenreArtistRate' USING PigStorage(',');


--Resu: {group: (genre: chararray,Artistname: chararray),Res: {(genre: chararray,Artistname: chararray,Rate: int)}}

--store Result into 'MusicAnalysis/OutputFiles/ArtistRate' USING PigStorage(',');

