##linear type model
##PCA reduce number of predictors and noise
##first goal statistical and the second goal is data compression

library(caret)
library(kernlab)
data(spam)
inTrain<-createDataPartition(y=spam$type,p=0.75,list=FALSE)
Training<-spam[inTrain,]
testing<-spam[-inTrain,]

##set diagonal to 0 to remove covariance with itself
##show elements with covariance > 0.8
M<-abs(cor(training[,-58]))
diag(M)<-0
which(M>0.8,arr.ind=T)

##PCA
##SVD		X=UDV		V is useful in this case

##PCA eg
smallSpam<-spam[,c(34,22)]
prComp<-prcomp(smallSpam)
plot(prComp$x[,1],prComp$x[,2])
prComp$rotation

##PCA on Spam data
typeColor<-((spam$type=="spam")*1+1)
prComp<-prcomp(log10(spam[,-58]+1))
plot(prComp$x[,1],prComp$x[,2],col=typeColor,xlab="PC1",ylab="PC2")

preProc<-preProcess(log10(spam[,-58]+1),method="pca",pcaComp=2)
trainPC<-predict(preProc,log10(training[,-58]+1))
modelFit<-train(training$type~.,method="glm",data=trainPC)

##NOTE
##Useful in linear model
##avoid outlier: logs/Box Cox