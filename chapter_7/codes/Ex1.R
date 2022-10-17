
#The method = "class" argument (it's the third one) tells rpart() that this is a classification tree
library(datasets)
library(party)
library(caTools)
library("rpart")
library("rpart.plot")
library('FSelector')


iris
head(iris)
str(iris)
set.seed(9)
iris$Species= as.factor(iris$Species)
iris$Species
str(iris)
split = sample.split(iris$Species,SplitRatio = 0.75) # 75 of the rows for training and 25% of the rows for testing
split
trainData = subset(iris, split == TRUE)
trainData

nrow(trainData)
testData = subset(iris, split == FALSE)
testData
head(testData)


nrow(testData)
names(iris)
model1 <- rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,method="class", data=trainData)

rpart.plot(model1, type=3, extra=1)
testData
testData[,-5]
test2=testData
test2
test2$Species=NULL
test2
# Predicting the Test set results
y_pred1 = predict(model1, newdata = testData[,-5], type = 'class')
y_pred1
# Making the Confusion Matrix
testData
testData[, 5]

cm1 = table(testData[, 5], y_pred1)
cm1

#Determining the accuracy of the model developed 
sum(diag(cm1))
sum(cm1)
ac_Test1 <- sum(diag(cm1)) / sum(cm1)
print(paste('Accuracy for test is found to be', ac_Test1))

#================================================================================================
iris
nrow(iris)
names(iris)
iris$Species= as.factor(iris$Species)
split = sample.split(iris$Species,SplitRatio = 0.5)

trainData = subset(iris, split == TRUE)
trainData
nrow(trainData)
testData = subset(iris, split == FALSE)
testData
nrow(testData)

names(iris)

# Building our Classification Model

model2 <- ctree(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=trainData)

print(model2)

plot(model2)

# Predicting the Test set results
y_pred2 = predict(model2, newdata = testData[,-5])
y_pred2
# Making the Confusion Matrix
cm2 = table(testData$Species, y_pred2)
cm2

#Determining the accuracy of the model developed 
ac_Test2 <- sum(diag(cm2)) / sum(cm2)
print(paste('Accuracy for test is found to be', ac_Test2))


#-----------------------------------
# finding most important factors
iris
set.seed(9)
iris$Species= as.factor(iris$Species)
split = sample.split(iris$Species,SplitRatio = 0.5)
split
trainData = subset(iris, split == TRUE)
trainData

testData = subset(iris, split == FALSE)
testData

res2 <- cfs(Species~.,trainData)
res2

res1 <- gain.ratio(Species~.,trainData)
res1


res3 <- chi.squared(Species~.,trainData)
res3

#---------------------------------------------------------------------------
# Building our Classification Model based on Petal attributes only
names(iris)
split = sample.split(iris$Species,SplitRatio = 0.6)

trainData = subset(iris, split == TRUE)
trainData

testData = subset(iris, split == FALSE)
testData

model3 <- ctree(Species ~ Petal.Length + Petal.Width, data=trainData)
plot(model3)
# predict on test data
names(testData)
testData=testData[,3:5]
testData
testData[,-3]
y_pred3 = predict(model3, newdata = testData[,-3])
y_pred3

testData
# Making the Confusion Matrix
cm3 = table(testData$Species, y_pred3)
cm3

#Determining the accuracy of the model developed 
ac_Test3 <- sum(diag(cm3)) / sum(cm3)
print(paste('Accuracy for test is found to be', ac_Test3))


#---------------------------------------------------------------------------
# Building our Classification Model based on sepal attributes only
names(iris)
split = sample.split(iris$Species,SplitRatio = 0.6)

trainData = subset(iris, split == TRUE)
trainData
nrow(trainData)
testData = subset(iris, split == FALSE)
testData



model4 <- ctree(Species ~ Sepal.Length + Sepal.Width, data=trainData)
plot(model4)

# predict on test data
names(testData)
testData
testData=testData[,c(1,2,5)]
testData
y_pred4 = predict(model4, newdata = testData[,-3])
y_pred4
# Making the Confusion Matrix
cm4 = table(testData$Species, y_pred4)
cm4

#Determining the accuracy of the model developed 
ac_Test4 <- sum(diag(cm4)) / sum(cm4)
print(paste('Accuracy for test is found to be', ac_Test4))

#-----------------------------------------------------------


dataset = read.csv('C:/R Codes/Ch7/Iris.csv')
head(dataset)
str(dataset)
dataset$Species= as.factor(dataset$Species)
dataset$Species
str(dataset)
set.seed(123)

split = sample.split(dataset$Species,SplitRatio = 0.75)
split

trainData = subset(dataset, split == TRUE) # 0.75 Train
trainData
nrow(trainData)

testData = subset(dataset, split == FALSE) # 0.25 Test
testData

nrow(testData)



model5 <- rpart(Species ~ .,method="class", data=trainData) # Training Phase


rpart.plot(model5, type=3, extra=1)



# predict on test data
y_pred5 = predict(model5, type =  "class",newdata = testData[,-5]) # Testing Phase
y_pred5

# Making the Confusion Matrix
cm5 = table(testData$Species, y_pred5)
cm5

#Determining the accuracy of the model developed 

ac_Test5 <- sum(diag(cm5)) / sum(cm5)
print(paste('Accuracy for test is found to be', ac_Test5))
#-----------------------------------------------------------


# Importing the dataset

dataset = read.csv('C:/R Codes/Ch7/Advertisement.csv')
head(dataset, 10)
#dataset$User.ID=NULL
#dataset
head(dataset, 10)
data1=dataset[,2:5]
head(data1)
str(data1)
data1$Gender=factor(data1$Gender)
data1$Purchased=factor(data1$Purchased)
data1$Gender
str(data1)
names(data1)
nrow(data1)


set.seed(123)
split = sample.split(data1$Purchased,SplitRatio = 0.8)
training_set = subset(data1, split == TRUE)
test_set = subset(data1, split == FALSE)



# Fitting Decision Tree Classification 
# to the Training set

classifier = rpart( Purchased ~ .,method="class",data = training_set)

test_set[,-4]
#Testing Phase
# Predicting the Test set results
y_pred = predict(classifier, type ="class",newdata = test_set[,-4])
y_pred
# Making the Confusion Matrix
cm = table(test_set$Purchased, y_pred)
cm

#Determining the accuracy of the model developed 
ac_Test <- sum(diag(cm)) / sum(cm)
print(paste('Accuracy for test is found to be', ac_Test))

#==============================================================
#------------------------------------------------

dataset = read.csv('C:/R Codes/Ch7/Iris.csv')
head(dataset)

split = sample.split(dataset$Species,SplitRatio = 0.75)

trainData = subset(dataset, split == TRUE) # 0.75 Train
trainData
testData = subset(dataset, split == FALSE) # 0.25 Test
testData
res1 <- gain.ratio(Species~.,trainData) # Information gain
res1
res1$attr_importance

order(res1$attr_importance,decreasing = TRUE)
names(dataset)
set.seed(123)



# 

model7 <- rpart(Species ~ Petal.Width+Petal.Length,method="class", data=trainData)



rpart.plot(model7, type=3, extra=1)

names(testData)
testData=testData[,3:5]
testData
y_pred7 = predict(model7, type =  "class",newdata = testData[,-3])
y_pred7
# Making the Confusion Matrix
cm7 = table(testData$Species, y_pred7)
cm7

#Determining the accuracy of the model developed 
ac_Test7 <- sum(diag(cm7)) / sum(cm7)
print(paste('Accuracy for test is found to be', ac_Test7))