---
title: "Code Book"
author: "Andy Phillips"
date: "December 15, 2014"
output: html_document
---



Raw data description:
---------------------

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Tidy data set description:
----------

The tidy data set comprises the merged training and test sets described above. 

The first two variables are:  
* **Activity** : One of STANDING, SITTING, LAYING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS  
* **Subject**  : 1-30 indicating which of the 30 participants performed the activity


The remaining variables are a subset of the raw data set variables whose description is as follows:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The variable names are edited by 'run_analysis.R' to remove '()' (which could cause problems if you wanted to use the name in R code) and remove duplicates of the word 'body' which are erroneously included in the original set.

The full list of variables is as follows:



```
## [1] "tBodyAcc.meanX"
## [1] "tBodyAcc.meanY"
## [1] "tBodyAcc.meanZ"
## [1] "tBodyAcc.stdX"
## [1] "tBodyAcc.stdY"
## [1] "tBodyAcc.stdZ"
## [1] "tGravityAcc.meanX"
## [1] "tGravityAcc.meanY"
## [1] "tGravityAcc.meanZ"
## [1] "tGravityAcc.stdX"
## [1] "tGravityAcc.stdY"
## [1] "tGravityAcc.stdZ"
## [1] "tBodyAccJerk.meanX"
## [1] "tBodyAccJerk.meanY"
## [1] "tBodyAccJerk.meanZ"
## [1] "tBodyAccJerk.stdX"
## [1] "tBodyAccJerk.stdY"
## [1] "tBodyAccJerk.stdZ"
## [1] "tBodyGyro.meanX"
## [1] "tBodyGyro.meanY"
## [1] "tBodyGyro.meanZ"
## [1] "tBodyGyro.stdX"
## [1] "tBodyGyro.stdY"
## [1] "tBodyGyro.stdZ"
## [1] "tBodyGyroJerk.meanX"
## [1] "tBodyGyroJerk.meanY"
## [1] "tBodyGyroJerk.meanZ"
## [1] "tBodyGyroJerk.stdX"
## [1] "tBodyGyroJerk.stdY"
## [1] "tBodyGyroJerk.stdZ"
## [1] "tBodyAccMag.mean.."
## [1] "tBodyAccMag.std.."
## [1] "tGravityAccMag.mean.."
## [1] "tGravityAccMag.std.."
## [1] "tBodyAccJerkMag.mean.."
## [1] "tBodyAccJerkMag.std.."
## [1] "tBodyGyroMag.mean.."
## [1] "tBodyGyroMag.std.."
## [1] "tBodyGyroJerkMag.mean.."
## [1] "tBodyGyroJerkMag.std.."
## [1] "fBodyAcc.meanX"
## [1] "fBodyAcc.meanY"
## [1] "fBodyAcc.meanZ"
## [1] "fBodyAcc.stdX"
## [1] "fBodyAcc.stdY"
## [1] "fBodyAcc.stdZ"
## [1] "fBodyAcc.meanFreqX"
## [1] "fBodyAcc.meanFreqY"
## [1] "fBodyAcc.meanFreqZ"
## [1] "fBodyAccJerk.meanX"
## [1] "fBodyAccJerk.meanY"
## [1] "fBodyAccJerk.meanZ"
## [1] "fBodyAccJerk.stdX"
## [1] "fBodyAccJerk.stdY"
## [1] "fBodyAccJerk.stdZ"
## [1] "fBodyAccJerk.meanFreqX"
## [1] "fBodyAccJerk.meanFreqY"
## [1] "fBodyAccJerk.meanFreqZ"
## [1] "fBodyGyro.meanX"
## [1] "fBodyGyro.meanY"
## [1] "fBodyGyro.meanZ"
## [1] "fBodyGyro.stdX"
## [1] "fBodyGyro.stdY"
## [1] "fBodyGyro.stdZ"
## [1] "fBodyGyro.meanFreqX"
## [1] "fBodyGyro.meanFreqY"
## [1] "fBodyGyro.meanFreqZ"
## [1] "fBodyAccMag.mean.."
## [1] "fBodyAccMag.std.."
## [1] "fBodyAccMag.meanFreq.."
## [1] "fBodyAccJerkMag.mean.."
## [1] "fBodyAccJerkMag.std.."
## [1] "fBodyAccJerkMag.meanFreq.."
## [1] "fBodyGyroMag.mean.."
## [1] "fBodyGyroMag.std.."
## [1] "fBodyGyroMag.meanFreq.."
## [1] "fBodyGyroJerkMag.mean.."
## [1] "fBodyGyroJerkMag.std.."
## [1] "fBodyGyroJerkMag.meanFreq.."
```

References:
-----------

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  

[2] https://class.coursera.org/getdata-016/forum/thread?thread_id=50#comment-382 Note on discussion forum about the BodyBody duplication
