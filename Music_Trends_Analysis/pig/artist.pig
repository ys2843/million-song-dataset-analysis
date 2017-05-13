songs_load = LOAD 'SongCSV.csv'  using org.apache.pig.piggybank.storage.CSVExcelStorage()
 as ( SongNumber: int,TrackId: chararray,SongID:chararray,AlbumID:int,AlbumName:chararray,
 ArtistID:chararray,ArtistLatitude:float,ArtistLocation:chararray,
 ArtistLongitude:float,ArtistName:chararray	,Danceability:int,Duration:float,
 KeySignature:int,KeySignatureConfidence:float,	Tempo:float,TimeSignature:int,
 TimeSignatureConfidence:float,	Title:chararray,Year:int);

songs = FOREACH songs_load GENERATE SongID, ArtistName,ArtistID;

songPlay_count = LOAD 'train_triplets.txt' using PigStorage() as (track:
chararray, SongID: chararray, counts:int);

song_count_1 = GROUP songPlay_count BY SongID;
song_count = FOREACH song_count_1 GENERATE FLATTEN(group) as SongID,COUNT(songPlay_count.track) as counts;

songAndcount = JOIN song_count by SongID, songs by SongID;
song_count = FOREACH songAndcount GENERATE ArtistID, ArtistName,counts;
song_count2 = ORDER song_count BY counts;

song_artist = GROUP song_count2 BY ArtistName;
song_artist2 =FOREACH song_artist GENERATE FLATTEN(group) as ArtistName, SUM(song_count2.counts) as counts;
song_artist3 = ORDER song_artist2 BY counts DESC;
song_output = LIMIT song_artist3 10;

STORE song_output INTO 'MSD_result_artist' using PigStorage('\t');
