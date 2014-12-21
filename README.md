Getting-and-Cleaning-Data
=========================

run_analysis.R is a script that can be used to tidy data per the Getting and Cleaning Data Coursera assignment. 

**The data set folder "UCI HAR Dataset" must be downloaded from the Getting and Cleaning Data Coursera Course Project in your working directory for this script to work.


**The dplyr R packaged must be installed in your R system for this script to work.  The script will open the dplyr package.



The script will open the files from the UCI HAR Dataset folder saved in your working directory from the Coursera Course Project for Getting and Cleaning Data. Column names are added for analysis to the files. The files are combine the to work with. The mean and standard deviation of each of the 561 variables for the 30 participants performing 6 activities are gotten. Then descriptive labels and variables are added with an unique ID variable number that corresponds to the features.txt in the UIC HAR Dataset folder. This is in the data frame: DataSet5 in R if you want to look at it.


The 561 variables are then averaged over the 6 Activities with the sample of 30 subjects. This file is in the data frame: AveragePerActivity in R.


The tidy data set is then written into a text file into your working directory named AveragePerActivity2. 