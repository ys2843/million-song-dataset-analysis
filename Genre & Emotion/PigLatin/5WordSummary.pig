W = LOAD 'MusicAnalysis/OutputFiles/TrackWordEmotion/part-r-00000' USING PigStorage(',') as (TrackID: chararray, MxMTrackID: chararray, wordIndex: int, Cout: int, word: chararray, emotion: chararray);

WT = GROUP W by (TrackID, word);

WT1 = FOREACH WT GENERATE group.TrackID as TrackID, group.word as word, SUM(W.Cout) as Cout;

song = LOAD 'MusicAnalysis/OutputFiles/FullSongInfo/part-r-00000' USING PigStorage(',') as (SongID: chararray, TrackID: chararray, AlbumID: chararray, AlbumName: chararray, ArtistID: chararray, ArtistName: chararray, ArtistLatitude: double, ArtistLongitude: double, ArtistLocation: chararray, Duration: double, KeySignature: int, Tempo: double, Title: chararray, Year: int, genre: chararray, track_id: chararray);
--songinfo = FOREACH song GENERATE SongID, TrackID, AlbumID, AlbumName, ArtistID, ArtistName, ArtistLatitude, ArtistLongitude, ArtistLocation, Duration, KeySignature, Tempo, Title, Year;

Res = JOIN song by TrackID, WT1 by TrackID;

Resu = GROUP Res by (genre, word);

Resul = FOREACH Resu GENERATE group.genre as genre, group.word, SUM(Res.WT1::Cout) as Cout;

Result = Order Resul by genre, Cout DESC;

store Result into 'MusicAnalysis/OutputFiles/WordSummary' USING PigStorage(',');


