rm(list=ls())

 
library(plyr)

 
# Load Packages and get the Data

 
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

 
download.file(file.url,"UCIHARDataset.zip")

 
unzip("UCIHARDataset.zip", exdir="DownloadedData")

## read in the data

activity <- read.table("DownloadedData/UCI HAR Dataset/activity_labels.txt")

features <- read.table("DownloadedData/UCI HAR Dataset/features.txt")

 
Xtrain <- read.table("DownloadedData/UCI HAR Dataset/train/X_train.txt")

Ytrain <- read.table("DownloadedData/UCI HAR Dataset/train/Y_train.txt")

Subjecttrain <- read.table("DownloadedData/UCI HAR Dataset/train/subject_train.txt")

 

Xtest <- read.table("DownloadedData/UCI HAR Dataset/test/X_test.txt")


Ytest <- read.table("DownloadedData/UCI HAR Dataset/test/Y_test.txt")


Subjecttest <- read.table("DownloadedData/UCI HAR Dataset/test/subject_test.txt")


## Now Let us perform the required Activities in the Assignment

# 1. Merges the training and the test sets to create one data set.

xCombined <- rbind(Xtrain,Xtest)

yCombined <- rbind(Ytrain,Ytest)

SCombined <- rbind(Subjecttrain, Subjecttest)

 

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

 
ExtractedMean <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))

Extractedstd <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))

 
Xprocessed <- xCombined[,(ExtractedMean | Extractedstd)]

names(Xprocessed) <- features[(ExtractedMean | Extractedstd), 2]

names(Xprocessed) <- tolower(names(Xprocessed))                   

# 3. Uses descriptive activity names to name the activities in the data set

activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))     

Yprocessed<- yCombined

Yprocessed[,1]= activity[Yprocessed[,1], 2]


# 4. Appropriately labels the data set with descriptive variable names.


names(Yprocessed) <- "activity"

names(SCombined) <- "subject"


## Create tidy data set.

DataMerged <- cbind(SCombined, Yprocessed, Xprocessed)

write.table(DataMerged, "TidyDataSet.txt")


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

 
## Now Convert the tidy data set as averaged.

AverageofDataMerged <- ddply(DataMerged, .(subject, activity), function(x) colMeans(x[,3:68]))

write.table(AverageofDataMerged, " AverageofDataMerged.txt")

 
## csv versions of the files

write.csv(DataMerged, "TidyDataSet.csv", row.names=FALSE)

write.csv(AverageofDataMerged, " AverageofDataMerged.csv", row.names=FALSE)

 