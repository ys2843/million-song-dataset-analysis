--part-r-00001 is the version (artistname: "xxxxx").
Rate = LOAD 'MusicAnalysis/OutputFiles/ArtistRate/part-r-00001' USING PigStorage(',') as (Artistname: chararray, Rate: int);

Arti = LOAD 'MusicAnalysis/OutputFiles/ArtistAlbumCount/part-r-00000' USING PigStorage(',') as (Artistname: chararray, Coun: int);

ArtRat = Join Rate by Artistname, Arti by Artistname;

Artrate = FOREACH ArtRat GENERATE Rate::Artistname as Artistname, Rate::Rate as Rate;

Artirate = ORDER Artrate by Rate desc;

song = LOAD 'MusicAnalysis/OutputFiles/FullSongInfo/part-r-00000' USING PigStorage(',') as (SongID: chararray, TrackID: chararray, AlbumID: chararray, AlbumName: chararray, ArtistID: chararray, Artistname: chararray, ArtistLatitude: double, ArtistLongitude: double, ArtistLocation: chararray, Duration: double, KeySignature: int, Tempo: double, Title: chararray, Year: int, genre: chararray, track_id: chararray);

songinfo = FOREACH song GENERATE Artistname, genre;

Re = Join songinfo by Artistname, Artirate by Artistname;

Res = FOREACH Re GENERATE songinfo::genre as genre, Artirate::Artistname as Artistname, Artirate::Rate as Rate;

Resu = Group Res by (genre, Artistname);

Resul = FOREACH Resu GENERATE group.genre as genre, group.Artistname as Artistname, AVG(Res.Rate) as Rate;

Result = ORDER Resul by genre, Rate DESC;

store Result into 'MusicAnalysis/OutputFiles/GenreArtistRate' USING PigStorage(',');


--Resu: {group: (genre: chararray,Artistname: chararray),Res: {(genre: chararray,Artistname: chararray,Rate: int)}}

--store Result into 'MusicAnalysis/OutputFiles/ArtistRate' USING PigStorage(',');

