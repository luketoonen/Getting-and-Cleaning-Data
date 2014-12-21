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

##Combine Test and Training Data Frames
DataSet<-rbind(Test,Training)

##Tidy data set with a mean and stand deviation for each of the 561 measurements
DataSet2<-arrange(DataSet,Subject,ActivityID)
DataSet3<-group_by(DataSet2,Subject,ActivityID)
DataSet4<-summarise_each(DataSet3,funs(mean,sd))

##Adding labels and descriptive variable names and variable numbers
TableNames<-read.table("UCI HAR Dataset/features.txt")
TableNames[,2]<-gsub("()",replacement="",fixed=T,TableNames[,2])
TableNames[,2]<-gsub("-",replacement="_",fixed=T,TableNames[,2])
TableNamesTranspose<-t(TableNames)
TableNamesSelect<-TableNamesTranspose[2,]
MeanInputs<-c("Mean")
SDInputs<-c("SD")
Numbers<-c(1:561)
TableNamesMean<-paste(TableNamesSelect,MeanInputs,sep=" ")
TableNamesMean1<-paste(TableNamesMean,Numbers,sep=" v")
TableNamesSD<-paste(TableNamesSelect,SDInputs,sep=" ")
TableNamesSD1<-paste(TableNamesSD,Numbers,sep=" v")
names(DataSet4)<-c("Subject","ActivityID",TableNamesMean1,TableNamesSD1)

Activities<-c("Walking","Walking_Upstairs","Walking_Downstairs","Sitting","Standing","Laying")

##Finished data frame: DataSet5 with descriptive activity names and labels the data set with descriptive variable names
DataSet5<-cbind(Activities,DataSet4)

## Average for each Activity results of the sample of 30 subjects
SelectActivity<-select(DataSet5,3:1125)
AveragePerActivity<-group_by(SelectActivity,ActivityID)
AveragePerActivity1<-summarise_each(AveragePerActivity,funs(mean))
AveragePerActivity2<-cbind(Activities,AveragePerActivity1)

##Write tables called AveragePerActivty into working directory
write.table(AveragePerActivity2,file="AveragePerActivity.txt",row.names=F)
