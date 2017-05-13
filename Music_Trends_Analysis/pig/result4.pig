songs_load = LOAD 'SongCSV.csv'  using org.apache.pig.piggybank.storage.CSVExcelStorage()
 as ( SongNumber: int,TrackId: chararray,SongID:chararray,AlbumID:int,AlbumName:chararray,
 ArtistID:chararray,ArtistLatitude:float,ArtistLocation:chararray,
 ArtistLongitude:float,ArtistName:chararray	,Danceability:int,Duration:float,
 KeySignature:int,KeySignatureConfidence:float,	Tempo:float,TimeSignature:int,
 TimeSignatureConfidence:float,	Title:chararray,Year:int);

songs = FOREACH songs_load GENERATE TrackId,SongID, AlbumID, AlbumName,ArtistID,
ArtistLocation,ArtistName,Duration,Title,Year;

songPlay_count = LOAD 'train_triplets.txt' using PigStorage() as (track:
chararray, SongID: chararray, counts:int);

song_count_1 = GROUP songPlay_count BY SongID;
song_count = FOREACH song_count_1 GENERATE FLATTEN(group) as SongID, SUM(songPlay_count.counts) as counts;

song_most_play = JOIN song_count by SongID, songs by SongID;
song_most_play2 = FOREACH song_most_play GENERATE TrackId ,Title, counts;
song_output = ORDER song_most_play2 BY counts;

STORE song_output INTO 'MSD_result4' using PigStorage('\t');
