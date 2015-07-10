####Week 1 Cross Validation

##Key ideas
##1.Accuracy on training set is optimistic
##2.Better estimate from an independent test set
##3.Do not use test set in training

##Cross-validation approach
##1.use training set
##2.split it into training/test set
##3.build model on training set
##4.evaluate on the test set
##5.repeat and average the estimated errors

##Used for:
##1.pick variables to include a mode
##2.pick type of prediction function
##3.pick parameter in the prediction function

##How to make test set
##1.Random subsampling
##2.K-fold
##3.Leave one out

##Considerations
##--random sample do not apply for time series
##--larger k gives less bias, more variance
##--small k gives more bias, less variance
##--random sampling must be done without replacement (e.g pick 3 balls out of 3, 3*3)
##--random sampling with replacement is the bootstrap (e.g pick 3 balls out of 3, 3*2)
##--bootstrap underestimates of the error
##--can be corrected, but it is complicated (0.632 bootstrap)


