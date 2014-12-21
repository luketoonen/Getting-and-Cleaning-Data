## UCI HAR Dataset should already be downloaded and in the working directory before proceeding.
## The dplyr package must be installed before proceeding.

## open dplyr for analysis
library(dplyr)

## Open files to be cleaned
TestLabels<-read.table("UCI HAR Dataset/test/y_test.txt")
TestSubjects<-read.table("UCI HAR Dataset/test/subject_test.txt")
TestSets<-read.table("UCI HAR Dataset/test/X_test.txt")

TrainingLabels<-read.table("UCI HAR Dataset/train/y_train.txt")
TrainingSubjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
TrainingSets<-read.table("UCI HAR Dataset/train/X_train.txt")

## Adding analysis column names and making a Test and Training Data Frame
names(TestSubjects)<-c("Subject")
names(TestLabels)<-c("ActivityID")
Test<-cbind(TestSubjects,TestLabels,TestSets)

names(TrainingSubjects)<-c("Subject")
names(TrainingLabels)<-c("ActivityID")
Training<-cbind(TrainingSubjects,TrainingLabels,TrainingSets)

##Combine Test and TrainingData Frames
DataSet<-rbind(Test,Training)

##Tidy data set with a mean and stand deviation for each of the 561 measurements
DataSet2<-arrange(DataSet,Subject,ActivityID)
DataSet3<-group_by(DataSet2,Subject,ActivityID)
DataSet4<-summarise_each(DataSet3,funs(mean,sd))

##Adding labels and descriptive variable names
TableNames<-read.table("UCI HAR Dataset/features.txt")
TableNames[,2]<-gsub("()",replacement="",fixed=T,TableNames[,2])
TableNames[,2]<-gsub("-",replacement="_",fixed=T,TableNames[,2])
TableNamesTranspose<-t(TableNames)
TableNamesSelect<-TableNamesTranspose[2,]
MeanInputs<-c("Mean")
SDInputs<-c("SD")
TableNamesMean<-paste(TableNamesSelect,MeanInputs,sep=" ")
TableNamesSD<-paste(TableNamesSelect,SDInputs,sep=" ")
names(DataSet4)<-c("Subject","ActivityID",TableNamesMean,TableNamesSD)

Activities<-c("Walking","Walking_Upstairs","Walking_Downstairs","Sitting","Standing","Laying")
DataSet5<-cbind(Activities,DataSet4)
