library(datasets)
library(party)
library(caTools)
library("rpart")
library("rpart.plot")
library('FSelector')



dataset = read.csv('C:/R Codes/Ch7/bank-sample.csv')
head(dataset)

nrow(dataset)

set.seed(123)
str(dataset)
dataset$job=as.factor(dataset$job)
dataset$marital=as.factor(dataset$marital)
dataset$education=as.factor(dataset$education)
dataset$default=as.factor(dataset$default)
dataset$housing=as.factor(dataset$housing)
dataset$loan=as.factor(dataset$loan)
dataset$contact=as.factor(dataset$contact)
dataset$month=as.factor(dataset$month)
dataset$poutcome=as.factor(dataset$poutcome)
dataset$subscribed = as.factor(dataset$subscribed )
dataset$subscribed

split = sample.split(dataset$subscribed,SplitRatio = 0.7)

trainData = subset(dataset, split == TRUE) # 0.7 * 2000 = 1400
nrow(trainData)
testData = subset(dataset, split == FALSE) # 0.3 * 2000 = 600
nrow(testData)

names(trainData)
res1 <- gain.ratio(subscribed~.,trainData)
res1
order(res1$attr_importance,decreasing = TRUE)


# Model based on top 5 attributes
model7 <- rpart(subscribed ~ duration+poutcome+pdays+previous+month,method="class", data=trainData)


rpart.plot(model7, type=2, extra=1)

names(testData)
testData=testData[,c(12,16,14,15,11,17)]
head(testData)


y_pred7 = predict(model7, type =  "class",newdata = testData[,-6])
y_pred7
# Making the Confusion Matrix
cm7 = table(testData$subscribed, y_pred7)
cm7

#Determining the accuracy of the model developed 
ac_Test7 <- sum(diag(cm7)) / sum(cm7)
print(paste('Accuracy for test is found to be', ac_Test7))
