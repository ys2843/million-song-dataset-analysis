inputs1= load './mxm_dataset_word.txt' USING PigStorage(',') as (ranking: int, word: chararray); 
inputs2 = load './FullStateName1.txt' USING PigStorage(',') as (word: chararray); 
joiner = JOIN inputs1 by word, inputs2 by word;
STORE joiner INTO './Music_of_the_life/1_words_in_lyrics/' USING PigStorage('\t');
