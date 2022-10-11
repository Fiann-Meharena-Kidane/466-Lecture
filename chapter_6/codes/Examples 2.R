#------------Example 5--------------------

ageandheight =  read.csv("c:/R Codes/Ch6/age_height.csv") 
ageandheight

lmHeight = lm(height ~ age, data = ageandheight) #Create the linear regression
lmHeight
# height = 64.928 + 0.635 * age

summary(lmHeight) #Review the results

lmHeight2 = lm(height~ ., data = ageandheight) #Create a linear regression with two variables
summary(lmHeight2) #Review the results
lmHeight2
#height= 64.90554+0.63751 * (age)-0.01772 * (no_siblings)

# predict the height for a person with age 19 and no_siblings is 2

age <- 19
no_siblings <- 2
new_pt <- data.frame(age, no_siblings)
new_pt


new1 <- predict(lmHeight2, new_pt)
new1 


#------------Example 6--------------------


hw =  read.csv("c:/R Codes/Ch6/height_weight.csv")
hw
relation <- lm(weight~height, hw)
relation
#weight = C0 + C1*height
#weight = (-38.4551) + (0.6746*height)

#predict the weight of  a person with a height 170
relation$coefficients
relation$coefficients[[2]]

new3= relation$coefficients[[1]] + relation$coefficients[[2]]*170
new3

print(summary(relation))

# Find weight of a person with height 170.
a <- data.frame(height = 170)
a

result <-  predict(relation,a)
print(result)

#------------Example 7--------------------

# Create the predictor and response variable.
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
x
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
y
relation <- lm(y~x)
relation

#y=-38.4551+0.6746*x

# predict y value if x value is 145
# Plot the chart.
plot(x,y,col = "blue",main = "Height & Weight Regression", abline(lm(y~x)),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")


#==============================================================

#Root Mean Squared Error (RMSE), which measures the average error performed by the model 
#in predicting the outcome for an observation. 

#The lower the RMSE, the better the model.
#low RMSE means high accuracy


#The larger the difference indicates a larger gap between the predicted and observed values,
#which means poor regression model fit. In the same way, the smaller RMSE that indicates 
#the better the model.

#Based on RMSE we can compare the two different models with each other and be able to 
#identify which model fits the data better.



# Importing the required package
install.packages( "Metrics" )
library(Metrics)

# Taking two vectors
actual = c(1.5, 1.0, 2.0, 7.4, 5.8, 6.6)		
predicted = c(1.0, 1.1, 2.5, 7.3, 6.0, 6.2)	

# Calculating RMSE using rmse()		
result = rmse(actual, predicted)

# Printing the value
print(result)	




#Example on salary dataset
# import the salary dataset
dataset <- read.csv(file.choose())

# check the dataset
str(dataset)
head(dataset)



# split salary data into training and testing sets
library(caTools)
set.seed(25)
split = sample.split(dataset$Salary, SplitRatio = 0.8)
train_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Build L1 model based on training part of the dataset
L1 = lm(formula = Salary ~ YearsExperience, data = train_set)
summary(L1)
# predict L1 model based on the testing part of the dataset
predicted = predict(L1, newdata = test_set)
predicted

actual_salary = test_set$Salary
predictd_salary = predicted
difference = actual_salary - predicted
actual_vs_predicted <- data.frame(cbind(actual_salary , predictd_salary , difference  ))


actual_vs_predicted

#the least RMSE, the better the model will be
# Check accuracy of the model

result = rmse(actual_salary, predictd_salary)
result

#plot the result to evaluate the model
plot(predicted, type ="l",col="blue")
lines(test_set$Salary, col="red")
