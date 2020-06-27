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
