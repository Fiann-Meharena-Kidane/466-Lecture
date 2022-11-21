
# Using R to Perform a K-Means Analysis

# install packages, if necessary

library(ggplot2)
library(cluster)


#import the student grades

grade_input=read.csv("C:/R Codes/Ch4/grades_km_input.csv")
grade_input=read.csv(file.choose())

grade_input
head(grade_input)
dim(grade_input)

str(grade_input)

summary(grade_input)

nrow(grade_input)

ncol(grade_input)

cor(grade_input[,2:4])


grade_input


kmdata <- grade_input[,2:4]
kmdata
head(kmdata)

km=kmeans(kmdata, 4, nstart=25)
km

km5=kmeans(kmdata, 5)
km5

#The displayed contents of the variable km include the following:
# => The location of the cluster means
# => A clustering vector that defines the membership of each student to a corresponding cluster 1, 2, or 3
# => The WSS of each cluster
# => A list of all the available k-means components

km$cluster

km$centers

km$withinss

km$tot.withinss

sum(km$withinss)





kmdata[1:10,]

head(kmdata)

tail(kmdata)


#==============================================
#------------------------Find K using Elbow method


wss <- numeric(15) 
wss
#k=1  last value of k =15  increment=1
for (k in 1:15) 
  wss[k] <- kmeans(kmdata, centers=k, nstart=25)$tot.withinss

wss

#(type = "b"): both points and lines with the lines running through the points

plot(1:15, wss, type="b", xlab="Number of Clusters", ylab="Within Sum of Squares") 

#As can be seen, the WSS is greatly reduced when k increases from one to two. Another
#substantial reduction in WSS occurs at k = 3. However, the improvement in WSS is fairly
#linear for k > 3. Therefore, the k-means analysis will be conducted for k = 3.

km = kmeans(kmdata,3, nstart=25)
km


km$cluster
km$centers




km = kmeans(kmdata,8, nstart=25)
km
#---------------------- 
iris
dim(iris)
names(iris)
iris2 <- iris
iris2
iris2$Species <- NULL
iris2
table(iris$Species)

km3 <- kmeans(iris2, 3)
km3
km3$cluster 
str(km3)

table(km3$cluster)
table(iris$Species)

table(iris$Species, km3$cluster)


km3$centers

plot(iris2[c("Sepal.Length", "Sepal.Width")], col = km3$cluster)
# plot cluster centers
points(km3$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:3,  pch = 5, cex=2)

plot(iris2[c("Petal.Length", "Petal.Width")], col = km3$cluster)
points(km3$centers[,c("Petal.Length", "Petal.Width")], col = 1:3,  pch = 6, cex=3)

plot(iris2, col=km3$cluster)




library(factoextra)
install.packages("factoextra")

fviz_cluster(km3, iris2[c("Sepal.Length", "Sepal.Width")])

#==============================================

#------------------------Find K using Elbow method

wss <- numeric(10)


for (k in 1:10){
  fit = kmeans(iris2,centers = k)
  wss[k]=fit$tot.withinss
  
}


wss
plot(1:10, wss, type="b", xlab="Number of Clusters", ylab="Within Sum of Squares")
plot(1:10, wss, type = "o")


#Based on the graph above, we can tell that k = 3 probably will be 
#the answer. And if you recall, the original data indeed has three 
#different species. So far, we are doing a good job

#apply kmeans clustering algorithm
km3 <- kmeans(iris2,3) # 3 clusters
plot(iris2[c("Sepal.Length", "Sepal.Width")], col = km3$cluster)
points(km3$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:3,  pch = 8, cex=3)

km4 <- kmeans(iris2,4) # 4 clusters
plot(iris2[c("Sepal.Length", "Sepal.Width")], col = km4$cluster)
points(km4$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:4,  pch = 8, cex=3)


#==================== Read the data from file

IrisDS <- read.csv("C:/R Codes/Ch4/Iris.csv",sep = ",", dec = ".", header = TRUE)
IrisDS = read.csv(file.choose())
IrisDS <- read.csv (file.choose(), sep = ",", header = TRUE)

data1=IrisDS
#prepare the iris dataset for clustering
data1$Species <- NULL
data1

#apply kmeans clustering algorithm using different number of clusters
k2 <- kmeans(data1, 2,25) 
k2


k3 <- kmeans(data1, 3,25) 
k3

k4 <- kmeans(data1, 4,25) 
k4

k10 <- kmeans(data1, 10,25) 
k10

# plot the clustering results using different variables combinations based on each previous cluster model results


# Plot for k2 model on different variables combination 
plot(data1[c("Sepal.Length", "Sepal.Width")], col = k2$cluster)
points(k2$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:2,  pch = 5, cex=3)

plot(data1[c("Petal.Length", "Petal.Width")], col = k2$cluster)
points(k2$centers[,c("Petal.Length", "Petal.Width")], col = 1:2,  pch = 5, cex=3)

plot(data1[c("Petal.Length", "Sepal.Width")], col = k2$cluster)
points(k2$centers[,c("Petal.Length", "Sepal.Width")], col = 1:2,  pch = 5, cex=3)

plot(data1, col = k2$cluster)


# Plot for k3 model on different variables combination 
plot(data1[c("Sepal.Length", "Sepal.Width")], col = k3$cluster)
points(k3$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:3,  pch = 5, cex=3)

plot(data1[c("Petal.Length", "Petal.Width")], col = k3$cluster)
points(k3$centers[,c("Petal.Length", "Petal.Width")], col = 1:3,  pch = 5, cex=3)

plot(data1[c("Petal.Length", "Sepal.Width")], col = k3$cluster)
points(k3$centers[,c("Petal.Length", "Sepal.Width")], col = 1:3,  pch = 5, cex=3)

plot(data1, col = k3$cluster)


# Plot for k4 model on different variables combination 
plot(data1[c("Sepal.Length", "Sepal.Width")], col = k4$cluster)
points(k4$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:4,  pch = 5, cex=3)

plot(data1[c("Petal.Length", "Petal.Width")], col = k4$cluster)
points(k4$centers[,c("Petal.Length", "Petal.Width")], col = 1:4,  pch = 5, cex=3)

plot(data1[c("Petal.Length", "Sepal.Width")], col = k4$cluster)
points(k4$centers[,c("Petal.Length", "Sepal.Width")], col = 1:4,  pch = 5, cex=3)

plot(data1, col = k4$cluster)

# Plot for k10 model on different variables combination 
plot(data1[c("Sepal.Length", "Sepal.Width")], col = k10$cluster)
points(k10$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:10,  pch = 5, cex=3)

plot(data1[c("Petal.Length", "Petal.Width")], col = k10$cluster)
points(k10$centers[,c("Petal.Length", "Petal.Width")], col = 1:10,  pch = 5, cex=3)

plot(data1[c("Petal.Length", "Sepal.Width")], col = k10$cluster)
points(k10$centers[,c("Petal.Length", "Sepal.Width")], col = 1:10,  pch = 5, cex=3)

plot(data1, col = k10$cluster)


#============================= Example Mall_Customers.csv

#load the data
#dataset without labels
MallData <- read.csv ("C:/R Codes/Ch4/Mall_Customers.csv", sep = ",", header = TRUE) 
MallData=read.csv(file.choose())
head(MallData)
str(MallData)

#Step1:  data preparation
#prepare the data by select the features for clustering 
#In this example we should remove columns number 1 and 2

MallData2 <- MallData[,3:5] 
MallData2
names(MallData2)
head(MallData2)


#Step2:  
#apply kmeans clustering algorithm using different number of clusters

k2 <- kmeans(MallData2, 2) #k=2 means 2 clusters
k2

k3 <- kmeans(MallData2, 3) #k=3 means 3 clusters
k3

k4 <- kmeans(MallData2, 4) #k=4 means 4 clusters
k4

k5 <- kmeans(MallData2, 5) #k=5 means 5 clusters
k5


# plot the clustering results using different variables combinations based on each previous cluster model results

# Plot for k2 model on different variables combination 

plot(MallData2[c(1,2)], col = k2$cluster)
points(k2$centers[,c(1,2)], col = 1:2,  pch = 5, cex=3)

plot(MallData2[c(2,3)], col = k2$cluster)
points(k2$centers[,c(2,3)], col = 1:2,  pch = 5, cex=3)

plot(MallData2[c(1,3)], col = k2$cluster)
points(k2$centers[,c(1,3)], col = 1:2,  pch = 5, cex=3)


#to plot all variables together 
plot(MallData2, col = k2$cluster)


# Plot for k4 model on different variables combination 

plot(MallData2[c(1,2)], col = k4$cluster)
points(k4$centers[,c(1,2)], col = 1:4,  pch = 5, cex=3)

plot(MallData2[c(2,3)], col = k4$cluster)
points(k4$centers[,c(2,3)], col = 1:4,  pch = 5, cex=3)

plot(MallData2[c(1,3)], col = k4$cluster)
points(k4$centers[,c(1,3)], col = 1:4,  pch = 5, cex=3)


plot(MallData2, col = k4$cluster)



#====================================================================

#Use the Elbow method to find the optimal number of clusters


wcss <-  vector()
wcss

for (i in 1:20) 
  wcss[i] <-  kmeans(MallData2, i)$tot.withinss

wcss

plot(1:20, wcss,type="b", main = "clusters of clients", xlab="Number of clusters", ylab="WCSS")



#Applying K means to the Mall data set

kmeans5 <-  kmeans(MallData2, 5)
kmeans5

plot(MallData2[c(1,3)], col = kmeans5$cluster)
points(kmeans5$centers[,c(1,3)], col = 1:5,  pch = 5, cex=3)


