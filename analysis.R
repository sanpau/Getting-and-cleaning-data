require("data.table")
require("reshape2")

#set working directory
setwd("/users/test/Desktop/Rprogramming/UCI HAR Dataset")

# Load only second column of activity labels and features 
activity_labels= read.table('./activity_labels.txt',header=FALSE)[,2]; 
features=read.table('./features.txt',header=FALSE)[,2]


# Load subjectTest, xTest and yTest data.
subjectTest <- read.table('./test/subject_test.txt');
xTest       <- read.table('./test/x_test.txt'); 
yTest       <- read.table('./test/y_test.txt');

#Label xTest data with column name.
names(xTest) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
extractFeatures <- grepl("mean|std", features)


# Extract only the measurements on the mean and standard deviation for each measurement.
xTest = xTest[,extractFeatures]

# Load activity labels
yTest[,2] = activity_labels[yTest[,1]]

names(yTest) = c("ActivityId", "ActivityLabel")
names(subjectTest) = "SubjectId"

# Bind all the column of subjectTest, yTest and xTest data using cbind function in R
testData <- cbind(as.data.table(subjectTest), yTest, xTest)


###Repeat all the data load like above for Train data set.

# Load subjectTrain, xTrain & yTrain data.
subjectTrain <- read.table('./train/subject_train.txt')
xTrain <- read.table('./train/x_train.txt')
yTrain <- read.table('./train/y_train.txt')


names(xTrain) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
xTrain = xTrain[,extractFeatures]

# Load activity data
yTrain[,2] = activity_labels[yTrain[,1]]



names(yTrain) = c("ActivityId", "ActivityLabel")
names(subjectTrain) = "SubjectId"



# Bind data
trainData <- cbind(as.data.table(subjectTrain), yTrain, xTrain)

# Merge test and train data
finalData = rbind(testData, trainData)




idLabels   = c("SubjectId", "ActivityId", "ActivityLabel")

#separating variables to melt the data 
dataLabels = setdiff(colnames(finalData), idLabels)

# Convert finalData into a molten data frame  

meltData = melt(finalData, id= idLabels, measure.vars = dataLabels)


# Apply mean function to dataset using dcast function. This creates a independent tidy data set with the average of each variable for each activity and each subject.


tidyData   = dcast(meltData, SubjectId + ActivityLabel ~ variable, mean)

# creating .txt file for tidyData

write.table(tidyData, file = "./tidyData.txt",row.names=TRUE);
