# Getting-and-Cleaning-Data-Project
Final_project_for_class

REPO for final project

CodeBook.md gives a description of the process used, the variables, data and the work done to clean up the data.

run_analysis.R contains all the code to perform the analyses described in the 5 steps. The code was written in RStudio v 1.3.959, in MacOSX 10.14.6

Data were obtained from downloading the zip file at this URL and manipulating the file via the R script

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

More details are in the CodeBook, but briefly the script:

a) Merges the training and the test sets to create one data set.

b) Extracts only the measurements on the mean and standard deviation for each measurement.

c) Uses descriptive activity names to name the activities in the data set.

d) Creates a second, independent data set with the average of each variable for each activity and each subject.
TidyData.txt is the output of the final step
