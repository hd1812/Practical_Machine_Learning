library(caret)
library(kernlab)
data(spam)
inTrain<-createDataPartition(y=spam$type,0.75,list=FALSE)
training<-spam[inTrain,]
testing<-spam[-inTrain,]

##K-fold
set.seed(32342)
folds<-createFolds(y=spam$type,k=10,list=TRUE,returnTrain=TRUE)
sapply(folds,length)

##resampling
folds<-createResample(y=spam$type,times=10,list=TRUE)
sapply(folds,length)

##time slices
tme<-1:1000
folds<-createTimeSlices(y=tme,initialWindow=20,horizon=10)
