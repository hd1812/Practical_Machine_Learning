library(AppliedPredictiveModeling)
library(caret)
data(AlzheimerDisease)
data(concrete)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

hist(training$Superplasticizer)

##Q3
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]
preProcPCA<-preProcess(training[58:69],method="pca",thresh=0.90)
preProcPCA

##Q4 unresolved
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

##PCA:
##preProcess Returns a list of evidence for PCA transmission
preProcPCA<-preProcess(training[58:69],method="pca",thresh=0.80)
trainPC<-predict(preProcPCA,training[58:69])
##train the model using data after PCA
modelFit<-train(training$diagnosis~.,method="glm",data=trainPC)
testPC<-predict(preProcPCA,newdata=testing[58:69])
confusionMatrix(testing$diagnosis,predict(modelFit,testPC))##Accuracy 0.7195

##Non-PCA
##train the model using data without
modelFit<-train(training$diagnosis~.,method="glm",training[58:69])
confusionMatrix(testing$diagnosis,predict(modelFit,testing[58:69]))##Accuracy 0.6463
