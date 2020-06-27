This CodeBook describes the variables and data and discusses how the data were transformed from download to tidy.

SOURCE DATA

The source data are from the Human Activity Recognition Using Smartphones Data Set, a study done by the Center for Machine Learning at UC Irvine. A description is available at : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
The data for the project were obtained at this link as a zipped file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


R SCRIPT

The script in this repo entitled "run_analysis.R" does the following steps:
1) Retrieves the file from the above link
2) Sets up a directory, unzips the downloaded file
3) Reads in the training and testing tables
4) Reads in features and activity labels tabless
5) Merges training and testing files into one table

6) The main merged file is parsed to include only variables that are mean or standard deviation
7) Activity labels are assigned to all instances

8) In a new dataframe (tidy1), a mean for each subject's mean and standard deviation columns is calculated for each different activity.  This is done with a recursive loop.
The new dataframe, tidy1, is rearranged and cleaned up.

9) tidy1 is written to "TidyData.txt"

VARIABLES

xtrain, ytrain, xtest, ytest, subject_train and subject_test contain data from the downloaded files.
features is downloaded data containing the column names of xtest and xtrain tables
activityLabels is downloaded and is an index file giving a description of each activityId number

MergeTrain, MergeTest and MergeAll are created by the script and contain the analysis data
OnlyMeanSD is a dataframe containing only the mean and standard deviations variables
