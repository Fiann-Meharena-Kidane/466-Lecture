#install.packages("rpart.plot")
library("rpart") # load libraries
library("rpart.plot")

# Read the data
play_decision <- read.table("C:/R Codes/Ch7/DTdata.csv", header=TRUE, sep=",")
play_decision
summary(play_decision)
names(play_decision)
# build the decision tree
#Training

#minsplit :- the minimum number of observations that must exist in a node in order for a split to be attempted.
#The splitting index can be gini or information
# Make a simple decision tree by only keeping the categorical variables

fit <- rpart(Play ~ Outlook + Temperature + Humidity + Wind,
             method="class",
             data=play_decision,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))
#Enter summary(fit) to produce a summary of the model built from rpart
summary(fit)


# Plot the tree
#extra Display extra information at the nodes
#type Type of plot.

#Enter the following R code to plot the tree based on the model being built. The resulting
#tree is shown in Figure. Each node of the tree is labeled as either yes or no referring to
#the Play action of whether to play outside.
rpart.plot(fit, type=4, extra=1)

#The decision tree can be used to predict outcomes for new datasets. Consider a testing set
#that contains the following record.
#Outlook="rainy", Temperature="mild", Humidity="high", Wind=FALSE
#The goal is to predict the play decision of this record. The following code loads the data
#into R as a data frame n1. Note that the training set does not contain this case.


#Testing
n1 <- data.frame(Outlook="rainy", Temperature="mild",
                 Humidity="high", Wind=FALSE)
n1

predict(fit,newdata=n1,type="prob") #Testing
predict(fit,newdata=n1,type="class")

#The output shows that one instance is classified as
#Play=no, and zero instances are classified as Play=yes. Therefore, in both cases, the
#decision tree predicts that the play decision of the testing set is not to play.



