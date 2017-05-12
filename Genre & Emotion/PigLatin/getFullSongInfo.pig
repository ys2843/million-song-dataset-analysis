/*get those important information from SongCSV*/
song = LOAD '/user/pg1534/MusicAnalysis/MSD/SongCSV22.csv' USING PigStorage(',') as (SongNumber: int,TrackID: chararray, SongID: chararray,AlbumID: chararray,AlbumName: chararray,ArtistID: chararray,ArtistLatitude: double,ArtistLocation: chararray,ArtistLongitude: double,ArtistName: chararray,Danceability: double,Duration: double,KeySignature: int,KeySignatureConfidence: double,Tempo: double,TimeSignature: int,TimeSignatureConfidence: double,Title: chararray,Year:int);
songinfo = FOREACH song GENERATE SongID, TrackID, AlbumID, AlbumName, ArtistID, ArtistName, ArtistLatitude, ArtistLongitude, ArtistLocation, Duration, KeySignature, Tempo, Title, Year;


/*read genre file*/
geninfo = LOAD '/user/pg1534/MusicAnalysis/MSD/msd_genre_dataset.txt' USING PigStorage(',') as (genre:chararray ,track_id: chararray, artist_name: chararray, title: chararray,loudness: double, tempo: double, time_signature: int, key: int,mode: int,duration,avg_timbre1: double,avg_timbre2: double,avg_timbre3: double,avg_timbre4: double,avg_timbre5: double,avg_timbre6: double,avg_timbre7: double,avg_timbre8: double,avg_timbre9: double,avg_timbre10: double,avg_timbre11: double,avg_timbre12: double,var_timbre1: double,var_timbre2: double,var_timbre3: double,var_timbre4: double,var_timbre5: double,var_timbre6: double,var_timbre7: double,var_timbre8: double,var_timbre9: double,var_timbre10: double,var_timbre11: double,var_timbre12: double);
genre = FOREACH geninfo GENERATE genre, track_id;

-- join all genres and their corresponding songs.
fullinfo  = JOIN songinfo BY TrackID, genre BY track_id;
store fullinfo into '/user/pg1534/MusicAnalysis/OutputFiles/FullSongInfo' USING PigStorage(',');

