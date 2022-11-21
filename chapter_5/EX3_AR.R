library(arules)
library(arulesViz)


setwd("C:/R Codes/Ch5")
f1 <- read.csv("cosmetic.csv",header=T, colClasses = "factor")
f1 <- read.csv(file.choose(),header=T, colClasses = "factor")

dim(f1)
str(f1)
#summarizing data
data<-f1
#data=na.omit(f1)
head(data,n=10)
str(data)
summary(data)

#inspecting rules
rules <- apriori(data)
rules
# Rules with specified parameter values
rules<-apriori(data,parameter=list(minlen=2,maxlen=10,supp=0.5,conf=0.8))
rules
inspect(rules)





rules.sorted <-sort(rules, by="confidence")

inspect(rules.sorted)
quality(rules)
quality(rules)<-round(quality(rules),digits=3)
quality(rules)
rules.sorted <- sort(rules, by="lift")
inspect(rules.sorted)

# Finding redundancy
#is.redundant to find redundant rules.
redundant <- is.redundant(rules, measure="confidence")
redundant
which(redundant)
rules_non_redundant <- rules[!redundant]
rules_non_redundant
inspect(rules_non_redundant)



#graphical understanding
plot(rules_non_redundant[1:10],method = "graph")
