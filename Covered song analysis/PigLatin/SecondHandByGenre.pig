Second = LOAD 'MusicAnalysis/MSD/SecondData.txt' USING PigStorage(',') as (TrackID: chararray, ArtistID: chararray, rate: int);

song = LOAD 'MusicAnalysis/OutputFiles/FullSongInfo/part-r-00000' USING PigStorage(',') as (SongID: chararray, TrackID: chararray, AlbumID: chararray, AlbumName: chararray, ArtistID: chararray, ArtistName: chararray, ArtistLatitude: double, ArtistLongitude: double, ArtistLocation: chararray, Duration: double, KeySignature: int, Tempo: double, Title: chararray, Year: int, genre: chararray, track_id: chararray);

songinfo = FOREACH song GENERATE SongID, TrackID, AlbumID, AlbumName, ArtistID, ArtistName, ArtistLatitude, ArtistLongitude, ArtistLocation, Duration, KeySignature, Tempo, Title, Year, genre;

Gen = Join Second by TrackID, songinfo by TrackID;

Genr = FOREACH Gen GENERATE songinfo::TrackID as TrackID, songinfo::ArtistName as ArtistName, songinfo::genre as genre;

Genre = Group Genr by genre;

res = FOREACH Genre GENERATE group, COUNT(Genr.TrackID) as COUN;

resu = ORDER res by COUN DESC;

store resu into 'MusicAnalysis/OutputFiles/SecondHandByGenre' USING PigStorage(',');



