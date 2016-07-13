#set working directory.


#download file and save to working directory for project. 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "HARDataset.zip")

#Unzip folder.
unzip("HARDataset.zip")

#Reading activity labels & features into R.
actlabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

#Load data sets.
train <- read.table("UCI HAR Dataset/train/X_train.txt")
trainAct <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSub <- read.table("UCI HAR Dataset/train/subject_train.txt")

test <- read.table("UCI HAR Dataset/test/X_test.txt")
testAct <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSub <- read.table("UCI HAR Dataset/test/subject_test.txt")

#assign column names.
colnames(train) <- features[,2] 
colnames(trainAct) <-"activityId"
colnames(trainSub) <- "subjectId"
      
colnames(test) <- features[,2] 
colnames(testAct) <- "activityId"
colnames(testSub) <- "subjectId"
      
colnames(actlabels) <- c('activityId','activityType')

#Merging merging respective X, Y,  and subject  data sets.
train <- cbind(trainSub, trainAct, train)
test <- cbind(testSub, testAct, test)

#Merging train and test data sets into one.
Data <- rbind(train, test)

#Vector to pull only mean and standard deviation data.
colNm <-  colnames(Data)

meanstd <- grepl("activityId" , colNm) | 
                 grepl("subjectId" , colNm) | 
                 grepl("mean.." , colNm) | 
                 grepl("std.." , colNm 
         )

#Sort Data to just mean and Standard Deviation Columns.
SortData <- Data[ , meanstd == TRUE]


#Appropriately label data set with activity description names.
FinalData <- merge(SortData, actlabels,
                              by='activityId',
                              all.x=TRUE)


#Create new independent data set of averages of each variable for each 
#activity and each subject.

#Create new activity table removing activity column.
FinalDataNoActType  = FinalData[,names(FinalData) != 'activityType']

#Averages of each variable for each activity and each subject.
TidyData    = aggregate(FinalDataNoActType, 
                        by=list(activityId=FinalDataNoActType$activityId, 
                                subjectId = FinalDataNoActType$subjectId),mean)


#Clean up data columns
FinalTidyData<- TidyData[,-(1:2),drop=FALSE]

# ReMerging the tidyData with activityType to include descriptive acitvity names
tidyData    = merge(FinalTidyData, actlabels,by='activityId',all.x=TRUE);

# Export the tidyData set 
write.table(tidyData, './TidyData.txt',row.names = FALSE, quote = FALSE)
