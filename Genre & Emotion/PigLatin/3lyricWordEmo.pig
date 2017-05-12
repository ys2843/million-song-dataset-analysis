-- filter the word, word & it's emotion

Emo = LOAD 'MusicAnalysis/MSD/Lexicons/NRC-Emotion-Lexicon-Wordlevel-v0.92.txt' USING PigStorage('	') as (Eword: chararray, emotion: chararray, yes: int);
Emot = FILTER Emo BY (yes == 1);


-- join word list with emotion
W = LOAD 'MusicAnalysis/MSD/musixMatch_lyric/mxm_dataset_word.txt' USING PigStorage(',') as (index: int, word: chararray);

WE = JOIN Emot BY Eword, W BY word;

WEoutput = FOREACH WE GENERATE Emot::Eword, Emot::emotion;

--store WEoutput into 'MusicAnalysis/OutputFiles/wordEmotion' USING PigStorage(',');

Word = LOAD 'MusicAnalysis/MSD/musixMatch_lyric/mxm_dataset_word.txt' USING PigStorage(',') as (index: int, word: chararray);

Res = JOIN WE by Emot::Eword, Word by word;

Resu = FOREACH Res GENERATE WE::W::index, WE::W::word, WE::Emot::emotion;

Resul = ORDER Resu by WE::W::index;

store Resul into 'MusicAnalysis/OutputFiles/lyricWordEmo' USING PigStorage(',');

