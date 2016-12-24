Introduction

The script run_analysis.R performs as described in the course project's definition on coursera.

The data is downloaded as explained in readme.md.


All the data are loaded into R using read.table function from a local folder named UCI HAR Dataset which was downloaded form the link (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) provided by the coursera.

Data are loaded as below for both test and train data.

features  
activityType 

Extract the measurement containing mean and standard deviation using(grepl) from features.
(These are 79 variables containing mean and standard deviation)

"tBodyAcc-mean()-X"          "tBodyAcc-mean()-Y"               "tBodyAcc-mean()-Z"              
"tBodyAcc-std()-X"           "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"               
"tGravityAcc-mean()-X"       "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"           
"tGravityAcc-std()-X"        "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
"tBodyAccJerk-mean()-X"      "tBodyAccJerk-mean()-Y"           "tBodyAccJerk-mean()-Z"          
"tBodyAccJerk-std()-X"       "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
"tBodyGyro-mean()-X"         "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"             
"tBodyGyro-std()-X"          "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
"tBodyGyroJerk-mean()-X"     "tBodyGyroJerk-mean()-Y"          "tBodyGyroJerk-mean()-Z"         
"tBodyGyroJerk-std()-X"      "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
"tBodyAccMag-mean()"         "tBodyAccMag-std()"               "tGravityAccMag-mean()"          
"tGravityAccMag-std()"       "tBodyAccJerkMag-mean()"          "tBodyAccJerkMag-std()"          
"tBodyGyroMag-mean()"        "tBodyGyroMag-std()"              "tBodyGyroJerkMag-mean()"        
"tBodyGyroJerkMag-std()"     "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
"fBodyAcc-mean()-Z"          "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"               
"fBodyAcc-std()-Z"           "fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"          
"fBodyAcc-meanFreq()-Z"      "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"          
"fBodyAccJerk-mean()-Z"      "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"           
"fBodyAccJerk-std()-Z"       "fBodyAccJerk-meanFreq()-X"       "fBodyAccJerk-meanFreq()-Y"      
"fBodyAccJerk-meanFreq()-Z"  "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
"fBodyGyro-mean()-Z"         "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"              
"fBodyGyro-std()-Z"          "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"         
"fBodyGyro-meanFreq()-Z"     "fBodyAccMag-mean()"              "fBodyAccMag-std()"              
"fBodyAccMag-meanFreq()"     "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-std()"      
"fBodyBodyAccJerkMag-meanFreq()"  
"fBodyBodyGyroMag-mean()"        
"fBodyBodyGyroMag-std()"         
"fBodyBodyGyroMag-meanFreq()"    
"fBodyBodyGyroJerkMag-mean()"     
"fBodyBodyGyroJerkMag-std()"     
"fBodyBodyGyroJerkMag-meanFreq()"



apply to data below.

subjectTrain :This contain 7352 obs with 1 variables.
subjectTest: This contain 2947 obs with 1 variables.
xTrain :This contain 7352 obs with 79 variables.
XTest: This contain 2947 obs with 79 variables.
yTrain :This contain 7352 obs with 2 variables.
yTest : This contain 2947 obs with 2 variables.

activity label variables are:
LAYING 
SITTING 
STANDING 
WALKING 
WALKING_DOWNSTAIRS 
WALKING_UPSTAIRS





Two table are created by using cbind function to make a training and test data set
trainData:This contain 7352 obs with 82 variables.
testData :This contain 2947 obs with 82 variables.

Finally finaldata is created by joining both training and test data using rbind function to get a dataframe of 10299 obs. and 82 variables.



Finally, a new dataset with all the average measures for each subject and activity type (30 subjects with 6 activities i.e 180 rows) are created. 




