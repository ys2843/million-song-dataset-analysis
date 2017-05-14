# Covered song analysis
## Purpose
This part of project basically analysis the data from Secondhand dataset and MSD, figure out which music genre is most likely to be covered by other people or artists, and whose songs are popular to be covered by others.
## What is included under this folder
1. Folder **Outputfiles**:
	There are two files under this folder, *SecondHandByArtist* and *SecondHandByGenre*, which are the output files we got after analyzing the source datasets. This two files rank Artists and Genres based the covered songs number. Using this two file, we can do some further statistical analysis and visualization.
2. Folder **PigLatin**:
	*SecondHandByArtist.pig* and *SecondHandByGenre.pig* are the two pig scripts which generate the two output files mentioned above.
3. Folder **Python**:
	*filter.py* is used for picking out all the original song (covered by other songs) from the train secondhand song dataset.
4. Folder **R**:
	*SecondHandSong.R* is used for generating the statistical diagram.