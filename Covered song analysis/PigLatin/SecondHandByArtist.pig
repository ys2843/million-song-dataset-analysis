Second = LOAD 'MusicAnalysis/MSD/SecondData.txt' USING PigStorage(',') as (TrackID: chararray, ArtistID: chararray, rate: int);

song = LOAD 'MusicAnalysis/MSD/SongCSV22.csv' USING PigStorage(',') as (SongNumber: int,TrackID: chararray, SongID: chararray,AlbumID: chararray,AlbumName: chararray,ArtistID: chararray,ArtistLatitude: double,ArtistLocation: chararray,ArtistLongitude: double,ArtistName: chararray,Danceability: double,Duration: double,KeySignature: int,KeySignatureConfidence: double,Tempo: double,TimeSignature: int,TimeSignatureConfidence: double,Title: chararray,Year:int);

songinfo = FOREACH song GENERATE SongID, TrackID, AlbumID, AlbumName, ArtistID, ArtistName, ArtistLatitude, ArtistLongitude, ArtistLocation, Duration, KeySignature, Tempo, Title, Year;

Gen = Join Second by TrackID, songinfo by TrackID;

Genr = FOREACH Gen GENERATE songinfo::TrackID as TrackID, songinfo::ArtistName as ArtistName;

Genre = Group Genr by ArtistName;

res = FOREACH Genre GENERATE group, COUNT(Genr.TrackID) as COUN;

resu = ORDER res by COUN DESC;


store resu into 'MusicAnalysis/OutputFiles/SecondHandByArtist' USING PigStorage(',');



