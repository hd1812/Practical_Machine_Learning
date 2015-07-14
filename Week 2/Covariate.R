library(kernlab)
data(spam)

##Create covariates steps
##level 1: select feature & create feature from row data (feature extraction for [data type])
##level 2: tidy covariates to new covariates (preProcess). More necessary for regression, svm, tetc.
##Only on the training set
##basic idea - convert factor variables to indicator variables. Common covatiates to add, dummy variables
##		 - remove zero covariates
##		 - spline basis

##step 1 example
spam$capitalAveSq<-spam$capitalAve^2

##load data
library(ISLR)
library(caret)
data(Wage)
inTrain<-createDataPartition(y=Wage$wage,p=0.7,list=FALSE)
training<-Wage[inTrain,]
testing<-Wage[-inTrain,]

##turn qualititive variable to quantitative
dummies<-dummyVars(wage~jobclass,data=training)
head(predict(dummies,newdata=training))

##remove zero covariates
nsv<-nearZeroVar(training,saveMetrics=TRUE)

##spline
bsBasis<-bs(training$age,df=3)

##lm
lm1<-lm(wage~bsBasis,data=training)
plot(training$age,training$wage,pch=19,cex=0.5)
points(training$age,predict(lm1,newdata=training),col="red",pch=19,cex=0.5)

##splines on the test set
predict(bsBasis,age=testing$age)