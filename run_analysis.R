# data cleaning w4 peer assignment
# load data 


if (!require("plyr")) {       # ddply
  install.packages("plyr")
}
require("plyr")

if (!require("dplyr")) {
  install.packages("dplyr")
}
require("dplyr")

if (!require("dtplyr")) {
  install.packages("dtplyr")
}
require("dtplyr")

getwd() -> odir

#### inital download   
#lfile <-  "Dataset.zip"
#if (!file.exists(lfile)){
#  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#  download.file(URL,destfile = lfile, method="auto")
#  #unzip (lfile)
#}
#########

# data extracted to the data directory
ddir <- "UCI HAR Dataset"

#read X.txt  from both test and train directorie
#if (!exists("xtest")) {   ## usefull during try-and-error -development
  lfile <- paste(ddir, "/test/X_test.txt", sep="")
  xtest <-read.table (lfile)
  xtest$x_train_or_test <- "test"   # add the type of the observation situation
#}
#if (!exists("xtrain")) {
  lfile <- paste(ddir, "/train/X_train.txt", sep="")
  xtrain <- read.table(lfile)
  xtrain$x_train_or_test <- "train" 
#}
#read Y.txt  from both test and train directorie
#if (!exists("ytest")) {
  lfile <- paste(ddir, "/test/y_test.txt", sep="")
  ytest <-read.table (lfile)
  ytest$y_train_or_test <- "test"
#}

#if (!exists ("ytrain")) {
  lfile <- paste(ddir, "/train/y_train.txt", sep="")
  ytrain <- read.table(lfile)
  ytrain$y_train_or_test <- "train"
#}

#read subject.txt  from both test and train directorie
#if (!exists("subtest")) {
  lfile <- paste(ddir, "/test/subject_test.txt", sep="")
  subtest <- read.table(lfile)
#}

#if (!exists("subtrain")) {
  lfile <- paste(ddir, "/train/subject_train.txt", sep="")
  subtrain <- read.table(lfile)
#}

#read infos
lfile <- paste(ddir, "/features.txt", sep="")
features <- read.table(lfile)


lfile <- paste(ddir, "/activity_labels.txt", sep="")
activity_labels<- read.table(lfile)

### some checks performed to assure that tables can be added
#print ("check x-files : identcal names(x*), dim  ?")
#print (identical (names(xtrain), names(xtest)))
#print (cat ("xtrain:",dim(xtrain)," xtest: ",dim(xtest) ) )
#print (cat ("NA in xtrain: ", sum(is.na(xtrain)), "NA in xtest:", sum(is.na(xtest))))

#if (!exists("xtable")) {xtable <- rbind(xtrain, xtest)}
xtable <- rbind(xtrain, xtest)

### some checks performed to assure that tables can be added
#print ("check y-files : identcal names(y*), dim  ?")
#print (identical (names(ytrain), names(ytest)))
print (cat ("ytrain:",dim(ytrain)," ytest: ",dim(ytest) ) )
#print (cat ("NA in ytrain: ", sum(is.na(ytrain)), "NA in ytest:", sum(is.na(ytest))))

# if (!exists("ytable")) {ytable <- rbind(ytrain, ytest)}
ytable <- rbind(ytrain, ytest)
#print (cat ("Get overview of ytable V1 with summary: ", summary (ytable) ))

subject <- rbind(subtrain,subtest)
names(subject)[1] <- "Subject"

# replace labels in ytable to make data more readable
ytable$activity = activity_labels[ytable$V1,2]
#ytable$V1 <- NULL   # remove redundant information  in a separate line (may be commented out, if there are doubts about the previous step)
#print (cat ("Get overview of ytable V1 with summary: ", summary (ytable) ))

# reduce number of colums in xtable  ()2. Extracts only the measurements on the mean and standard deviation for each measurement.
# names(xtable) shows Colums V1:V561, train_o_test = 562 colums
# identify a list of colums that refer to mean or std  according to the features.txt
# mean() and Freqmean  are both taken into account 

stdlist <-grep("std",features$V2)
meanlist <- grep("(mean)[^Freq]",features$V2) 
# Decision:  colums with meanFreq()  are not of interest:  theres no additional standard deviation information available

#print (cat ( "length of meanlist,stdlist", length (meanlist), length(stdlist) ))
numberOfCols <- sort(c(stdlist,meanlist))
numberOfCols <- c(numberOfCols,562)
xtable <- select(xtable,numberOfCols)


names(xtable) <-sub ("^V","",names(xtable))
# stupid idea to keep the train_or_test information
preserve <- names(xtable)[67]
features[names(xtable),2]-> names(xtable)
preserve -> names(xtable)[67]
# I think there´s a more elegant way to this -- but I don´t know it yet

# if (!exists("tidydata")) {tidydata <- cbind (xtable,ytable)}
tidydata <- cbind (xtable,ytable)


# obviously the x_train_or_test , y_train_or_test is not needed  so it is removed
# theres no question whether data are from training or from test
tidydata <- select(tidydata,1:66,-x_train_or_test,-V1, -y_train_or_test,activity)
tidydata <- cbind(tidydata,subject)

ddply (tidydata,.(Subject,activity),function(x) colMeans(x[, 1:66])) -> finaltable

write.table (finaltable,file="summary_data.txt",row.names=FALSE)

 