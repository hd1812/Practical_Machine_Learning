####Week 1 
##In and Out sample error
##In Sample Error: Error generated on data set used to build predictor
##Out of sample error: error generated on new dataset -- generalization error
##Note that:  1.Out of sample error is more important
##            2.In sample error < out of sample error
##            3.Small in sample error -> overfitting

##Code sample -- Spam prediction
library(kernlab); data(spam); set.seed(333)
smallSpam <- spam[sample(dim(spam)[1],size=10),]
spamLabel <- (smallSpam$type=="spam")*1 + 1
plot(smallSpam$capitalAve,col=spamLabel)

##rule 1 --overfitting example
rule1 <- function(x){
  prediction <- rep(NA,length(x))
  prediction[x > 2.7] <- "spam"
  prediction[x < 2.40] <- "nonspam"
  prediction[(x >= 2.40 & x <= 2.45)] <- "spam"
  prediction[(x > 2.45 & x <= 2.70)] <- "nonspam"
  return(prediction)
}
table(rule1(smallSpam$capitalAve),smallSpam$type)

##rule 2 -- simplified rule
rule2 <- function(x){
  prediction <- rep(NA,length(x))
  prediction[x > 2.8] <- "spam"
  prediction[x <= 2.8] <- "nonspam"
  return(prediction)
}
table(rule2(smallSpam$capitalAve),smallSpam$type)

##Apply rule 1 and 2 to complete spam data
table(rule1(spam$capitalAve),spam$type)
table(rule2(spam$capitalAve),spam$type)
mean(rule1(spam$capitalAve)==spam$type)
mean(rule2(spam$capitalAve)==spam$type)

##look at accuracy. all noise are captured
sum(rule1(spam$capitalAve)==spam$type)
sum(rule2(spam$capitalAve)==spam$type)

