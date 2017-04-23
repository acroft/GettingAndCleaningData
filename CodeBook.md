Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

These measurements were taken from a set of 30 subjects, identified in the dataset by the subject ID, performing a set of 6 activities, described by activity_desc.

subject_id
activity_desc
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

For each of these variables, only the mean() and std() of the measured window appears in the dataset. E.g. tBodyAcc.std...Z is the standard deviation of tBodyAcc in the Z direction.

Transformations
===============
The data in this dataset was derived from the UCI HAR Dataset. The following transformations were applied:

1. The training and test datasets were merged to form on large dataset
2. Only the features that sampled the mean or standard deviation were extracted. This means all features that had either "mean" or "std" in their names and includes all means and standard deviations in the frequency domain as well.
3. The "activity ID" columns were replaced with descriptiv activity names instead so that all of the data is accessible in one place.
4. The data were grouped by subject/activity combination and the variables were collapsed down to represent only the mean value for the entire activity for each subject.