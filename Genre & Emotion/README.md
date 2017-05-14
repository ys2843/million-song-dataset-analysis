# Genre & Emotion
## Purpose
Genre & Emotion focus on analyzing the relation between genre and emotion by analyzing data cross three datasets - (genre datasets, MSD and NRC emotion datasets).
## What is included under this folder
1. Folder **Outputfiles**:
	*genreSummary.csv* counts the emotion score for every genre.
	*WordSummary.csv* lists the word appearance by DESC order for each genre.
2. Folder **PigLatin**:
	Code under this folder is used for generating the the two results files above. 
	I separate the code to five steps, which makes it easier for debugging and understanding. Each step generates an output file for further using. And *4genreSummary.pig* and *5WordSummary.pig* generate the two output files mentioned above.
3. Folder **Python**:
	*flatten.py* is used for flatten the lyric word from file *`mxm_dataset_train.txt`*, using format `[index, word]`.
	*trans to json.py* is used for transfer *`mxm_dataset_train.txt`* into valid json format (if needed). However, we can also use python to flatten the dataset.
4. Folder **R**:
	*genreSummary.R* is used for generating the statistical diagram for the output files.
5. Floder **Spark**:
	*WordSummary.scala* is the script used for present statistical result for *WordSummary.csv* in Zeppelin.
