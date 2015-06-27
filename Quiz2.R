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
dummies<-dummyVars(diagnosis~)
adData = data.frame(diagnosis,predictors)

##Q4 unresolved
adData[adData$diagnosis=="Control",]$diagnosis<-1
adData[adData$diagnosis=="Impaired",]$diagnosis<-0
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

preProcPCA<-preProcess(training[58:69],method="pca",thresh=0.80)
trainPC<-predict(preProcPCA,training$diagnosis)
modelFit<-train(training$diagnosis~.,method="glm",data=trainPC)

testPCA<-predict(preProc,)
confusionMatrix(testing#diagnosis,predict(modelFit,testPCA))
