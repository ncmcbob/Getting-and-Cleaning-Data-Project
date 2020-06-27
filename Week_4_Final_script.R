# Getting and Cleaning Data
# Week Four Final Project

library(plyr)
library(dplyr)

if(!file.exists("./CleanData")){dir.create("./CleanData")} # PICK DIFFERENT NAME
fileUSE <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUSE, destfile = "./CleanData/projectdataset.zip")

unzip(zipfile = "./CleanData/projectdataset.zip", exdir = "./CleanData")

xtrain <- read.table("./CleanData/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./CleanData/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./CleanData/UCI HAR Dataset/train/subject_train.txt")

xtest <- read.table("./CleanData/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./CleanData/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./CLeanData/UCI HAR Dataset/test/subject_test.txt")

features <- read.table("./CleanData/UCI HAR Dataset/features.txt")

activityLabels = read.table("./CleanData/UCI HAR Dataset/activity_labels.txt")

#Label columns
colnames(xtrain) <- features[,2]
colnames(ytrain) <- "activityId"
colnames(subject_train) <- "subjectId"

colnames(xtest) <- features[,2]
colnames(ytest) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

#MERGE TRAIN AND TEST DATA
MergeTrain <- cbind(ytrain, subject_train, xtrain)
MergeTest = cbind(ytest, subject_test, xtest)
MergeAll = rbind(MergeTrain, MergeTest) # 10299 records

cnames <- colnames(MergeAll)
find_mean_sd <- grepl("activityId", cnames) | grepl("subjectId", cnames) | grepl("mean..", cnames) | grepl("std..", cnames)
# Find only mean and stdev columns

OnlyMeanSD <- MergeAll[, find_mean_sd == T] # 81 variables

ActNames <- activityLabels[match(OnlyMeanSD[, 1], activityLabels[, 1]), 2] # Rename activities
OnlyMeanSD <- cbind(OnlyMeanSD[,1], ActNames, OnlyMeanSD[, 2:ncol(OnlyMeanSD)]) # Insert Activity Labels in col 2
colnames(OnlyMeanSD)[1] <- "activityId"

tidy1 <- unique(OnlyMeanSD[, 1:3])
for(i in 1:nrow(tidy1)) {
  for(j in 4:ncol(OnlyMeanSD)) {
    tidy1[i, j] <- mean(OnlyMeanSD[which(paste0(OnlyMeanSD[,2], OnlyMeanSD[,3]) == paste0(tidy1[i,2], tidy1[i,3])), j])
  }
}

colnames(tidy1)[4:ncol(tidy1)] <- colnames(OnlyMeanSD)[4:ncol(OnlyMeanSD)]
tidy1 <- tidy1[order(tidy1[, 3], tidy1[,1]),]

write.table(tidy1, "TidyData.txt", row.names = F)