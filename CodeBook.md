Please see README.txt and features_info.txt in the original raw zipped dataset. Column names were taken from this information:
V1:V561  were replaced by the more meaningful labels from the features table. 


Column names of the summary_table  are
[1] "Subject"                     "activity"                    "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"          
 [6] "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
[11] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"         "tBodyAccJerk-mean()-X"      
[16] "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
[21] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"          
[26] "tBodyGyro-std()-Z"           "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[31] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"          "tBodyAccMag-std()"           "tGravityAccMag-mean()"      
[36] "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
[41] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"      "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"          
[46] "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[51] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"        "fBodyGyro-mean()-X"         
[56] "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[61] "fBodyAccMag-mean()"          "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"    
[66] "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 

Where 
[1] "Subject" identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. (Original Readme)
[2] "activity" the activity name  -- one of 6 values:  "Walking", ...., "Laying"   as defined in the activity_labels data 

all other columns use the labels coming with the original dataset.  According to the original Readme these colums represent features and 
Features are normalized and bounded within [-1,1]
