--song = LOAD 'MusicAnalysis/OutputFiles/FullSongInfo/part-r-00000' USING PigStorage(',') as (SongID: chararray, TrackID: chararray, AlbumID: chararray, AlbumName: chararray, ArtistID: chararray, ArtistName: chararray, ArtistLatitude: double, ArtistLongitude: double, ArtistLocation: chararray, Duration: double, KeySignature: int, Tempo: double, Title: chararray, Year: int, genre: chararray, track_id: chararray);
--songinfo = FOREACH song GENERATE SongID, TrackID, AlbumID, AlbumName, ArtistID, ArtistName, ArtistLatitude, ArtistLongitude, ArtistLocation, Duration, KeySignature, Tempo, Title, Year;


lyric = LOAD 'MusicAnalysis/MSD/musixMatch_lyric/flatoutput_train.txt.tmp' USING PigStorage(',') as (TrackID: chararray, MxMTrackID: chararray, wordIndex: int, Cout: int);

emotion = LOAD 'MusicAnalysis/OutputFiles/lyricWordEmo/part-r-00000' USING PigStorage(',') as (wordIn: int, word: chararray, emotion: chararray);

-- join lyric and emotion using the index of word
-- if a word in lyric doesn't have corresponding emotion, ignore it.
LE = JOIN lyric by wordIndex, emotion by wordIn;

LE1 = FOREACH LE GENERATE lyric::TrackID as TrackID, lyric::MxMTrackID as MxMTrackID, lyric::wordIndex as wordIndex, lyric::Cout as Cout, emotion::word as word, emotion::emotion as emotion;

store LE1 into 'MusicAnalysis/OutputFiles/TrackWordEmotion' USING PigStorage(',');

