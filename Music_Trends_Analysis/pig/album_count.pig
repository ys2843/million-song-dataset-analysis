songs_load = LOAD 'SongCSV.csv'  using org.apache.pig.piggybank.storage.CSVExcelStorage()
 as ( SongNumber: int,TrackId: chararray,SongID:chararray,AlbumID:int,AlbumName:chararray,
 ArtistID:chararray,ArtistLatitude:float,ArtistLocation:chararray,
 ArtistLongitude:float,ArtistName:chararray	,Danceability:int,Duration:float,
 KeySignature:int,KeySignatureConfidence:float,	Tempo:float,TimeSignature:int,
 TimeSignatureConfidence:float,	Title:chararray,Year:int);

songs = FOREACH songs_load GENERATE AlbumID,Year;
songs_2 = GROUP songs BY AlbumID;
songs_3 = FOREACH songs_2 {
      top_rec = LIMIT songs 1;
      GENERATE FLATTEN(top_rec) as (AlbumID, Year);
};
songs_4 = GROUP songs_3 BY Year;
songs_5 = FOREACH songs_4 GENERATE FLATTEN(group) as Year, COUNT(songs_3.AlbumID);

STORE songs_5 INTO 'MSD_album' USING PigStorage('\t') ;
