# Getting and Cleaning Data [getdata-016] December 2014
# Peer Assessment

# Script Assumptions:
# For the script to work the R session must have a working directory where the zip file has already
# been extracted to create the default "UCI HAR Dataset". (i.e. "can be run as long as the Samsung 
# data is in your working directory" as per the evaluation notes.)

# Load the libraries used
library(data.table)

dataDir <- "./UCI HAR Dataset/"

## Requirements from the assignment text

### 1. Merges the training and the test sets to create one data set.

## Test and train sets each contain three files 'X', 'y' and 'subject'. 'Inertial Signals' data
## is ignored as it would be excluded later anyway (no mean or standard deviation data).

## Read in the test sets
X_test <- read.table(file.path(dataDir,"test","X_test.txt"))
y_test <- read.table(file.path(dataDir,"test","y_test.txt"))
subject_test <- read.table(file.path(dataDir,"test","subject_test.txt"))

## Read in the train sets
X_train <- read.table(file.path(dataDir,"train","X_train.txt"))
y_train <- read.table(file.path(dataDir,"train","y_train.txt"))
subject_train <- read.table(file.path(dataDir,"train","subject_train.txt"))

## First merge each test set with its corresponding train set
X <- rbind(X_test,X_train)
y <- rbind(y_test,y_train)
subject <- rbind(subject_test,subject_train)

## Before merging these three into a single dataset, I skip ahead to requirements 2 & 3:

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

## This involves the 'X' dataset, I need to filter out any variables that are not related to mean or
## standard deviation. I get the variable names from the 'features.txt' file

varNames <- read.table(file.path(dataDir,"features.txt"))[,2] #only want 2nd column

## Filter out of the X set any columns not corresponding to feature names containing "mean" or "std"
X <- X[,grepl("(mean|std)",varNames)]

### 3. Uses descriptive activity names to name the activities in the data set

## The activities are in the 'y' dataset which contains numbers 1 - 6 corresponding to activity names
## which can be extracted from the activity_labels text file.

activityLabels <- read.table(file.path(dataDir,"activity_labels.txt"))[,2] #only want 2nd column

yNames <- y #temp as once I start replacing numerics with characters the whole set will be coerced
for (i in 1:dim(y)[1]){ #Loop through every 'y' row 
  yNames[i,1] <- as.character(activityLabels[y[i,1]]) #replace the existing numeric with the matching name
}
y <- yNames #replace the whole column

## Now I can merge all three data sets into a single set containing test & training data

fullSet <- cbind(X,subject,y)

### 4. Appropriately labels the data set with descriptive variable names. 

## The last two columns are our subject and activity columns, all preceeding columns come from the 'X' 
## dataset whose variables are named in the 'varNames' table created earlier.
## Using the same regexp in grep I can filter out the matching column name list.

xLabels <- as.character(varNames[grep("(mean|std)",varNames)])
xLabels <- gsub("\\(\\)-", "", xLabels) # get rid of ()- in variable names
xLabels <- gsub("BodyBody", "Body", xLabels) # BodyBody is mistakenly included in the some names
colnames(fullSet) <- c(xLabels,"Subject","Activity")

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
###    each variable for each activity and each subject.

fullSet <- data.table(fullSet)
tidySet <- fullSet[, lapply(.SD,mean), by=c("Activity","Subject")]

# Finally, write the table to a local text file
write.table(tidySet, file = "tidySet.txt", sep = ",", row.names = FALSE)


