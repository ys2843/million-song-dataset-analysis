mreviews = FOREACH A GENERATE (chararray)meta#'reviewerID' as revID, (chararray)meta#'asin' as productasin, (chararray)meta#'reviewText' as revText, (chararray)meta#'summary' as summary; 
texts = FOREACH mreviews GENERATE revText; 
STORE texts INTO './Music_of_the_life/review_wordcount_pre' USING PigStorage('\t');

inputs1 = load './Music_of_the_life/review_wordcount_pre/part-m-00000' USING PigStorage(',') as (line: chararray); 
inputs2 = load './Music_of_the_life/review_wordcount_pre/part-m-00001' USING PigStorage(',') as (line: chararray);
inputs3 = load './Music_of_the_life/review_wordcount_pre/part-m-00002' USING PigStorage(',') as (line: chararray);
inputs4 = load './Music_of_the_life/review_wordcount_pre/part-m-00003' USING PigStorage(',') as (line: chararray);
u = UNION inputs1, inputs2, inputs3, inputs4;
words = FOREACH u GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(words);

locations = load './statename' USING PigStorage(',') as (name: chararray); 
joiner = JOIN words by word, locations by name;
