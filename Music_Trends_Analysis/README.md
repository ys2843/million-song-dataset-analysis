Goal:
1.Show the trends of music development
Nowadays, music industry is a growing and prosperity field which has huge profit for investing. There are thousands of albums issued every year. We want to show the trends of music industry development by analysing million songs dataset. Our result, the graph of the number of albums issued per year since 1920 reflects the market growth of music industry.
2. Analyze which music genre has higher business value
We try to figure out a best solution for artist, investors to get more profit in music industry.  We find out that different music genre has different business value and some certain genre is much more popular than others and can also make artist more popular. We compare the top 5 popular genre by play count and search heat from google and we find the most profitable genre of all time.

The trend of music development:
Brief introduction: 
In this part, our goal is to find the relation between popularity of songs, artist, genre and time. By dig into the trends of music industry development, genre influence on popularity of songs and artists and search heat of artist and genre according to time, we find the genre which has the most business value, the trends of albums selling and search heat of an artist etc.
In this part, MSD and google trends api are used as main source of research. Pig is used as the tool for analysing the dataset. 

Preparing work:
1. Data from google trends was downloaded by queries using api
2. MSD dataset, train_triplet dataset(play count of each song by user)
3. All the data are uploaded to http://babar.es.its.nyu.edu/. 
4. MSD dataset is get from HPC. While originally it is in .h5 format, we use python code from https://github.com/amgreenstreet/Million-Song-Dataset-HDF5-to-CSV to extract the data to a csv file. 

Implementation with pig
First, to prove the music industry is a profitable and fast-growing market. We shows the trends of music industry development by the number of album issued per year. We did this by grouping the album ID and year and output the count of the distinct tuples, and order the result by year. Then we can see clearly the number of albums issued from 1920 till now according to year.

Then, to find the genre with most business value,  we group the million songs by their genre to output the total number of songs in each genre, and find out the popular genres of all time. The result is ordered by number in desc. Now we know the top five popular genre which has most business value. The next step we are going to analyze top 5 genre one by one.

We analyze each of the top 5 popular genre individually. First we group MSD with user play count record and then filter the result by each genre. By add the play count together, we can get the total play count of a genre according to year.

To find out the effect of music genre on an artist, we calculated a rank according to total song play count  of artist. This rank can reflect the popularity of artist which then compared to google trends result 



