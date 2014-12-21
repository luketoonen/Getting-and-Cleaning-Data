Getting-and-Cleaning-Data
=========================

run_analysis.R is a script that can be used to tidy data per the Getting and Cleaning Data Coursera assignment. 

The data set folder "UCI HAR Dataset" must be downloaded from the Getting and Cleaning Data Coursera Course Project in your working directory for this script to work.

The dplyr R packaged must be installed in your R system for this script to work.  The script will open the dplyr package.


The script will open the files from the UCI HAR Dataset folder. Add column names for analysis to the files opened. Combine the files to work with. Get the mean and standard deviation of each of the 561 variables for the 30 participants performing 6 activites. And then add descriptive labels and variables.