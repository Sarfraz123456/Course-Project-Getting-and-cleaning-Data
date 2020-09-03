CodeBook.md

The code for this assignment is writtn in the "run_analysis.R" script. The code starts from downloading the data, unzipping, cleaning labelling and extraction of mean and standard devisions etc.  It is written to comply the  5 steps required as per coursera Requirements. 

1- Downloading of the dataset: Dataset downloaded and unzipped into "UCI HAR Dataset" created in the working directory.

2- Assign each data to variables:

activity <- activity_labels.txt: List of activities performed when the corresponding measurements were taken and its codes (labels). It has 6 rows and 2 columns. 

features <- features.txt: The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.It has 561 rows and 2 columns.

Xtrain <- X_train.txt: It contains recorded features train data. It contains 7352 rows and 561 columns

Ytrain <- Y_train.txt: It contains train data of activities’code labels and has 7352 rows and 1 column.

Subjecttrain <- subject_train.txt:It contains train data of 30 volunteer subjects being observed and has 7352 rows and 1 column.


Xtest <- X_test.txt:  It contains recorded features test data.It has 2947 rows and 561 columns

Ytest <- Y_test.txt: 
contains test data of activities’code labels and has 2947 rows and 1 column.

Subjecttest <- subject_test.txt: 
contains test data of 9/30 volunteer test subjects being observed. It has 2947 rows and 1 column.





3- Merges the training and the test sets to create one data set
xCombined (10299 rows, 561 columns) is created by merging Xtrain and Xtest using rbind() function.
yCombined  (10299 rows, 1 column) is created by merging Ytrain and Ytest using rbind() function.
SCombined (10299 rows, 1 column) is created by merging Subjecttrain and Subjecttest using rbind() function

4. Extracts only the measurements on the mean and standard deviation for each
measurement by creating the variables ExtractedMean and Extractedstd and stored in the Xprocessed variable which was later lower capitalized.                                     
5.  Uses descriptive activity names to name the activities in the data set and its assignment into YProcessed variable.

6. Merging of the Xprocessed, Yprocessed and SCombined variables Column vectors ) and generation of DataMerged variable throgh cbind function. DataMerged has 10299 rows and 563 columns.

7. TidyDataSet (10299 rows, 88 columns) is created by subsetting DataMerged.
It uses descriptive activity names to name the activities in the data set
Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activities variable.

8. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
AverageofDataMerged  (180 rows, 88 columns) is created by sumarizing TidyDataSet taking the means of each variable for each activity and each subject. FInally, this file is exported in text also csv formats.