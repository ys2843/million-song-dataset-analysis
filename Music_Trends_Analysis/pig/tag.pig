songs_load = LOAD 'SongCSV.csv'  using org.apache.pig.piggybank.storage.CSVExcelStorage()
 as ( SongNumber: int,TrackId: chararray,SongID:chararray,AlbumID:int,AlbumName:chararray,
 ArtistID:chararray,ArtistLatitude:float,ArtistLocation:chararray,
 ArtistLongitude:float,ArtistName:chararray	,Danceability:int,Duration:float,
 KeySignature:int,KeySignatureConfidence:float,	Tempo:float,TimeSignature:int,
 TimeSignatureConfidence:float,	Title:chararray,Year:int);

songs = FOREACH songs_load GENERATE TrackId,SongID, AlbumID, AlbumName,ArtistID,
ArtistLocation,ArtistName,Duration,Title,Year;

song_tag = LOAD 'song_tag.json' USING PigStorage() as (TrackID:chararray, tag:chararray);
song_tag_join = join song_tag by TrackID, songs by TrackId;
song_tag_id = foreach song_tag_join generate SongID, AlbumName, ArtistName,Title,Year,tag;

songPlay_count = LOAD 'train_triplets.txt' using PigStorage() as (track:
chararray, SongID: chararray, counts:int);

song_count_1 = GROUP songPlay_count BY SongID;
song_count = FOREACH song_count_1 GENERATE FLATTEN(group) as SongID, SUM(songPlay_count.counts) as counts;


songAndcount = JOIN song_count by SongID, song_tag_id by SongID;
genreCount = GROUP songAndcount BY tag;
genreCount2 = FOREACH genreCount GENERATE FLATTEN(group) as tag, SUM(songAndcount.counts) as counts;
genreCount3 = ORDER genreCount2 BY counts;

STORE genreCount3 INTO 'MSD_result_tag' using PigStorage('\t');
