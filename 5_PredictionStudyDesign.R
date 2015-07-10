####Week 1 prediction study design

##Procedure
##1.Define error rate
##2.Split data into training, testing, validation(optional)
##3.Use training set pick features,use cross-validation
##4.Use training set pick prediction function, use cross validation
##5.If no validation, apply 1x to test set
##6.If validation, apply test set and refine, apply 1x to validation

##Suggestions
##--Avoid small sample sizez
##Large sample size--60% 20% 20%/training, test, validation
##Medium sample -- 60% 40%/training, testing
##Small sample size --Do cross validation/ report caveat of small sample size

##Principles
##dont use validation/test set in training
##randomly sample training and test
##data set must reflect structure of the problem
##all should reflect as much deversity as possible