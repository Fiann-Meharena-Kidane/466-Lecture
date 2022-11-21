# set working directory
setwd("C:/R Codes/Ch5")

# Loading package
#install.packages('arules')
#install.packages('arulesViz')
library(arules)
library(arulesViz)

#read the dataset
dataset = read.transactions("C:/R Codes/Ch5/Market_Basket_Optimisation.csv", sep=",", rm.duplicates=TRUE)
dataset

dataset = read.transactions(file.choose(), sep=",", rm.duplicates=TRUE)
dataset


#plot
#itemFrequencyPlot() It creates an item frequency bar plot for inspecting the distribution of objects based on the transactions
itemFrequencyPlot(dataset, topN = 10)

# Fitting model
# Training Apriori on the dataset
rules = apriori(data = dataset)


rules = apriori(data = dataset, parameter = list(support = 0.02,confidence = 0.3))


# Visualising the results
inspect(rules)

inspect(sort(rules, by = 'lift')[1:10])

inspect(sort(rules, by = 'support')[1:5])

plot(rules, method = "graph", measure = "lift", shading = "lift")



