inTrain<-createDataPartition(y=Wage$wage,p=0.7,list=FALSE)
training<-Wage[inTrain,]
testing<- Wage[-inTrain,]
dim(training)
dim(testing)

##feature plot
featurePlot(x=training[,c("age","education","jobclass")],
				y=training$wage,
				plot="pairs")

##qplot with colour
qplot(age,wage,colour=jobclass,data=training)

##smooth qplot using linear model
qq<-qplot(age,wage,colour=education,data=training)
qq+geom_smooth(method='lm',formula=y~x)

##box plot
cutWage<-cut2(training$wage,g=3)
p1<-qplot(cutWage,age,fill=cutWage,data=training,geom=c("boxplot"))
p2<-qplot(age,wage,fill=cutWage,geom=c("boxplot","jitter"),data=training)
grid.arrange(p1,p2,ncol=2)

##density plot
qplot(wage,colour=education,data=training,grom="density")