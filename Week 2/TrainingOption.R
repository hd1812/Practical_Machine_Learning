library(caret)
library(kernlab)
data(spam)
inTrain<-createDataPartition(y=spam$type,p=0.75,list=FALSE)
training<-spam[inTrain,]
testing<-spam[-inTrain,]
dim(training)

##generalised linear model fit
set.seed(32343)
modelFit<-train(type~.,data=training,method="glm")
modelFit

##predictions
predictions<-predict(modelFit,newdata=testing)
predictions

##confusionMatrix
confusionMatrix(predictions,testing$type)

