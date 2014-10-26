##Coursera Getting and Cleaning Data - Project 1


###Summary
Project 1's assignment was to summarize a set data points by 30 `subjects` each performing 6 `activitys`.  The originating raw data was from a zip file with a subfolder structure separating similar "test" and "train" data sets.  Each subfolder contained files indexed by other files.  The project task was to simplify this data into a single self-contained "tidy" data set.

The data was collected from sesnory data from smart phones and is considered to be representative of data from "wearable computing". 

###Data structure
The resulting tidy data has the following 68 columns:

`subject` - Integer - id indicating the person from whom the data was collected.
`activity` - Factor - indicating the type of activity: 
- `LAYING`             
- `SITTING`            
- `STANDING`           
- `WALKING`           
- `WALKING_DOWNSTAIRS`
- `WALKING_UPSTAIRS` 

`variables[66]` - numeric - average of the values in the original data set as described in the following data mapping.


###Variable name mapping
The original data set contained data points for 561 variables which were either time based data or filtered data, prefixed by "t" and "f" respectively.  The data files themselves did not include column names, the column names were available from the features.txt file.  These variables were filtered to include only the 66 variable names for mean() and std().  The variable names were then simplified to remove "-" and "()".  The data for these variables was then summarized by subject and activity and subsequently averaged by subject and activity.  The resulting mapping of original variable names to averaged variable names is as listed in the table below.

**Week 4 lecture notes:** - Week 4 of the course details how variable names should be simplified in typical R applications.  According to the lecture, they should not contain underscores and they should not contain mixed case.  While this is totally counter to what I have been taught elsewhere (I have been programming for over 40 years),  I would have implemented this in the function `prettyNames()`.  As it stands, my current implementation uses Camel case and underscores for column names.



|Original                    | Simplified                     |
|:---------------------------|:-------------------------------|
|tBodyAcc-mean()-X           |time_BodyAcc_mean_X             |
|tBodyAcc-mean()-Y           |time_BodyAcc_mean_Y             |
|tBodyAcc-mean()-Z           |time_BodyAcc_mean_Z             |
|tGravityAcc-mean()-X        |time_GravityAcc_mean_X          |
|tGravityAcc-mean()-Y        |time_GravityAcc_mean_Y          |
|tGravityAcc-mean()-Z        |time_GravityAcc_mean_Z          |
|tBodyAccJerk-mean()-X       |time_BodyAccJerk_mean_X         |
|tBodyAccJerk-mean()-Y       |time_BodyAccJerk_mean_Y         |
|tBodyAccJerk-mean()-Z       |time_BodyAccJerk_mean_Z         |
|tBodyGyro-mean()-X          |time_BodyGyro_mean_X            |
|tBodyGyro-mean()-Y          |time_BodyGyro_mean_Y            |
|tBodyGyro-mean()-Z          |time_BodyGyro_mean_Z            |
|tBodyGyroJerk-mean()-X      |time_BodyGyroJerk_mean_X        |
|tBodyGyroJerk-mean()-Y      |time_BodyGyroJerk_mean_Y        |
|tBodyGyroJerk-mean()-Z      |time_BodyGyroJerk_mean_Z        |
|tBodyAccMag-mean()          |time_BodyAccMag_mean            |
|tGravityAccMag-mean()       |time_GravityAccMag_mean         |
|tBodyAccJerkMag-mean()      |time_BodyAccJerkMag_mean        |
|tBodyGyroMag-mean()         |time_BodyGyroMag_mean           |
|tBodyGyroJerkMag-mean()     |time_BodyGyroJerkMag_mean       |
|fBodyAcc-mean()-X           |filter_BodyAcc_mean_X           |
|fBodyAcc-mean()-Y           |filter_BodyAcc_mean_Y           |
|fBodyAcc-mean()-Z           |filter_BodyAcc_mean_Z           |
|fBodyAccJerk-mean()-X       |filter_BodyAccJerk_mean_X       |
|fBodyAccJerk-mean()-Y       |filter_BodyAccJerk_mean_Y       |
|fBodyAccJerk-mean()-Z       |filter_BodyAccJerk_mean_Z       |
|fBodyGyro-mean()-X          |filter_BodyGyro_mean_X          |
|fBodyGyro-mean()-Y          |filter_BodyGyro_mean_Y          |
|fBodyGyro-mean()-Z          |filter_BodyGyro_mean_Z          |
|fBodyAccMag-mean()          |filter_BodyAccMag_mean          |
|fBodyBodyAccJerkMag-mean()  |filter_BodyBodyAccJerkMag_mean  |
|fBodyBodyGyroMag-mean()     |filter_BodyBodyGyroMag_mean     |
|fBodyBodyGyroJerkMag-mean() |filter_BodyBodyGyroJerkMag_mean |
|tBodyAcc-std()-X            |time_BodyAcc_std_X              |
|tBodyAcc-std()-Y            |time_BodyAcc_std_Y              |
|tBodyAcc-std()-Z            |time_BodyAcc_std_Z              |
|tGravityAcc-std()-X         |time_GravityAcc_std_X           |
|tGravityAcc-std()-Y         |time_GravityAcc_std_Y           |
|tGravityAcc-std()-Z         |time_GravityAcc_std_Z           |
|tBodyAccJerk-std()-X        |time_BodyAccJerk_std_X          |
|tBodyAccJerk-std()-Y        |time_BodyAccJerk_std_Y          |
|tBodyAccJerk-std()-Z        |time_BodyAccJerk_std_Z          |
|tBodyGyro-std()-X           |time_BodyGyro_std_X             |
|tBodyGyro-std()-Y           |time_BodyGyro_std_Y             |
|tBodyGyro-std()-Z           |time_BodyGyro_std_Z             |
|tBodyGyroJerk-std()-X       |time_BodyGyroJerk_std_X         |
|tBodyGyroJerk-std()-Y       |time_BodyGyroJerk_std_Y         |
|tBodyGyroJerk-std()-Z       |time_BodyGyroJerk_std_Z         |
|tBodyAccMag-std()           |time_BodyAccMag_std             |
|tGravityAccMag-std()        |time_GravityAccMag_std          |
|tBodyAccJerkMag-std()       |time_BodyAccJerkMag_std         |
|tBodyGyroMag-std()          |time_BodyGyroMag_std            |
|tBodyGyroJerkMag-std()      |time_BodyGyroJerkMag_std        |
|fBodyAcc-std()-X            |filter_BodyAcc_std_X            |
|fBodyAcc-std()-Y            |filter_BodyAcc_std_Y            |
|fBodyAcc-std()-Z            |filter_BodyAcc_std_Z            |
|fBodyAccJerk-std()-X        |filter_BodyAccJerk_std_X        |
|fBodyAccJerk-std()-Y        |filter_BodyAccJerk_std_Y        |
|fBodyAccJerk-std()-Z        |filter_BodyAccJerk_std_Z        |
|fBodyGyro-std()-X           |filter_BodyGyro_std_X           |
|fBodyGyro-std()-Y           |filter_BodyGyro_std_Y           |
|fBodyGyro-std()-Z           |filter_BodyGyro_std_Z           |
|fBodyAccMag-std()           |filter_BodyAccMag_std           |
|fBodyBodyAccJerkMag-std()   |filter_BodyBodyAccJerkMag_std   |
|fBodyBodyGyroMag-std()      |filter_BodyBodyGyroMag_std      |
|fBodyBodyGyroJerkMag-std()  |filter_BodyBodyGyroJerkMag_std  |

