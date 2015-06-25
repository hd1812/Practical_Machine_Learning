##regression model

##load data
library(caret)
data(faithful)
set.seed(333)
inTrain<-createDataPartition(y=faithful$waiting,p=0.5,list=FALSE)
trainFaith<-faithful[inTrain,]
testFaith<-faithful[-inTrain,]
head(trainFaith)

plot(trainFaith$waiting,trainFaith$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")

##fit linear model
lm1<-lm(eruptions~waiting,data=trainFaith)
summary(lm1) ##'Estimate' is predicted value

##model fit
lines(trainsFaith$waiting,lm1$fitted,lwd=3)

##predictt a new value
newdata<-data.frame(waiting=80)
predict(lm1,newdata)

par(mfrow=c(1,2))
plot(trainFaith$waiting,trainFaith$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")
lines(trainFaith$waiting,predict(lm1),lwd=3)
plot(testFaith$waiting,testFaith$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")
lines(testFaith$waiting,predict(lm1,newdata=testFaith),lwd=3)

##Calculate RMSE on training
sqrt(sum((lm1$fitted-trainFaith$eruptions)^2))

##Calculate RMSE on test
sqrt(sum((predict(lm1,newdata=testFaith)-testFaith$eruptions)^2))

##prediction intevals ##bug
pred1<-predict(lm1,newdata=testFaith,inteval="prediction")
ord<-order(testFaith$waiting)
plot(testFaith$waiting,testFaith$eruptions,pch=19,col="blue")
matlines(testFaith$waiting[ord],pred1[ord,],type="l",,col=c(1,2,2),lty=c(1,1,1),lwd=3)