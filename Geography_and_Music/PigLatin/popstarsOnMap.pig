inputs1 = load 'artistcord.txt' USING PigStorage('\t') as (id: chararray, long: float, lat: float, name: chararray, city: chararray);
inputs2 = load 'popstarnames.txt'  USING PigStorage(',') as (name: chararray);
joiner = JOIN artistcord by name, popstarnames by name;
