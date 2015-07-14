library(caret)
library(kernlab)
data(spam)
inTrain<-createDataPartition(y=spam$type,p=0.75,list=FALSE)
training<-spam[inTrain,]
testing<-spam[-inTrain,]

##bug in following code
hist(training$capatalAve,main="",xlab="ave.capital run length")

##standalising variables in training set
trainCapAve<-training$capitalAve
testCapAveS<-(trainCapAve-mean(trainCapAve))/sd(trainCapAve)

##standardizing test set. Using mean and std of TRAINING set
testCapAve<-testing$capitalAve
testCapAveS<-(testCapAve-mean(trainCapAve))/sd(trainCapAve)

##preprocessing function
preObj <- preProcess(training[,-58],method=c("center","scale"))
trainCapAveS <- predict(preObj, training[,-58])$capitalAve
mean(trainCapAveS)

##boxcox, contineous data
preObj <- preProcess(training[,-58],method=c("BoxCox"))
trainCapAveS <- predict(preObj, training[,-58])$capitalAve
mean(trainCapAveS)

set.seed(13343)

#Make some values NA
training$capAve<-training$capitalAve
selectNA<-rbinom(dim(training)[1],size=1,prob=0.05)==1
training$capAve[selectNA]<-NA

#Impute and standardize, MA filter
preObj <- preProcess(training[,-58],method=c("BoxCox"))
capAve<-predict(preObj,training[,-58])$capAve

#standardize true values
capAveTruth<-training$capitalAve
capAveTruth<-(capAveTruth-mean(capAveTruth))/sd(capAveTruth)

