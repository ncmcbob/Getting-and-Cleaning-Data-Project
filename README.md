# Getting-and-Cleaning-Data-Project
Final_project_for_class

REPO for final project

CodeBook.md gives a description of the process used, the variables, data and the work done to clean up the data.

run_analysis.R contains all the code to perform the analyses described in the 5 steps. The code was written in RStudio v 1.3.959, in MacOSX 10.14.6

It should be noted that using this OS and Safari, the file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip downloaded UNZIPPED, this that step was not necessary in the code.  The individual files were in some subfolders, the the download was not zipped.  This is evident in the run_analysis.R code.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData.txt is the output of the final step
