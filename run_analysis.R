# run_analysis.R
#
# Project 1 submission for Coursera Getting and Cleaning Data
# 10/24/2014
#
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#    each variable for each activity and each subject.

run <- function()
{
  # read in the data files and load any required libraries
  readSmall<-FALSE # TRUE
  
  require(plyr)
  
  test<-readDataType("test",readSmall)
  train<-readDataType("train",readSmall)
  alldata<-rbind(test,train)
  colnames(alldata)<-prettyNames(colnames(alldata))
  tidy<-ddply(alldata,c("subject","activity"), numcolwise(mean))
}

readDataType<-function(type,readSmall)
{
  t<-readDataFile(type,"x",readSmall)
  cols<-read.csv("./rawData/UCI HAR Dataset/features.txt",sep="",header=FALSE,col.names=c("index","name"))
  m<-grep("mean()",cols$name,fixed=TRUE)
  s<-grep("std()",cols$name,fixed=TRUE)
  cols<-cols[c(cols[m,1],cols[s,1]),]
  meanstd<-t[,cols$index]
  colnames(meanstd)<-cols$name
  
  subject<-readDataFile(type,"subject",readSmall)
  colnames(subject)<-c("subject")
  
  activity<-readDataFile(type,"y",readSmall)
  colnames(activity)<-c("activity_id")
  
  rdata<-cbind(subject,activity,meanstd)
  
  activity_labels<-read.csv("./rawData/UCI HAR Dataset/activity_labels.txt",sep="",header=FALSE,col.names=c("id","activity"))
  rdata<-merge(rdata,activity_labels,by.x="activity_id",by.y="id")

  rdata<-rdata[,c("subject","activity",colnames(meanstd))]
  
}

readDataFile<-function(type,XorY,small)
{
  fdir<-paste("./rawdata/UCI HAR Dataset/",type,"/",sep="")
  fname<-paste(fdir,XorY,"_",type,sep="")

  if (small)
    {
    fname<-paste(fname,"_small",sep="")
    }

  fname<-paste(fname,".txt",sep="")
  read.csv(fname,sep="",header=FALSE)
}

prettyNames <- function(uglyNames)
{
  # Make the variable names in the dataset nicer to use
  # remove the leading "t"
  # remove the "()"
  # change "-" to "_"
  p<-uglyNames
  p<-sub("()","",p,fixed=TRUE)
  p<-gsub("-","_",p,fixed=TRUE)
  p<-sub("^t","time_",p)
  p<-sub("^f","filter_",p)
  p
  
}