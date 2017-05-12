song = LOAD 'MusicAnalysis/OutputFiles/FullSongInfo/part-r-00000' USING PigStorage(',') as (SongID: chararray, TrackID: chararray, AlbumID: chararray, AlbumName: chararray, ArtistID: chararray, ArtistName: chararray, ArtistLatitude: double, ArtistLongitude: double, ArtistLocation: chararray, Duration: double, KeySignature: int, Tempo: double, Title: chararray, Year: int, genre: chararray, track_id: chararray);
songinfo = FOREACH song GENERATE SongID, TrackID, AlbumID, AlbumName, ArtistID, ArtistName, ArtistLatitude, ArtistLongitude, ArtistLocation, Duration, KeySignature, Tempo, Title, Year;


LE = LOAD 'MusicAnalysis/OutputFiles/TrackWordEmotion/part-r-00000' USING PigStorage(',') as (TrackID: chararray, MxMTrackID: chararray, wordIndex: int, Cout: int, word: chararray, emotion: chararray);

LE1 = GROUP LE by (TrackID, emotion);


-- LE2 is every trackid, it's emotion and the count of this emotion
LE2 = FOREACH LE1 GENERATE group.TrackID as TrackID, group.emotion as emotion, SUM(LE.Cout) as EmoCoun;

Gen = JOIN song by TrackID, LE2 by TrackID;

Genr = GROUP Gen by (genre, emotion);

--describe Genr;
Genre = FOREACH Genr GENERATE group.genre as genre, group.emotion, SUM(Gen.LE2::EmoCoun) as EmoCoun;

Result = Order Genre by genre, EmoCoun;

store Result into 'MusicAnalysis/OutputFiles/genreSummary' USING PigStorage(',');


--store LE1 into 'MusicAnalysis/OutputFiles/TrackWordEmotion' USING PigStorage(',');
--LE1: {group: (TrackID: chararray,emotion: chararray),LE: {(TrackID: chararray,MxMTrackID: chararray,wordIndex: int,Cout: int,word: chararray,emotion: chararray)}}