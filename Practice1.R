library(party)
library(FSelector)

#load the data and explore it


Fruit = read.csv("C:/R Codes/FruitData.csv")
Fruit = read.csv(file.choose())

#Exploration 

head(Fruit)
str(Fruit)
summary(Fruit)
dim(Fruit)
names(Fruit)
nrow(Fruit)
ncol(Fruit)

#Data preparation
#Prepare data by remove the output attribute because clustering is an unsupervised approach and remove other unnecessary attributes
#Therefore, We will use the following attributes
data1=Fruit[,c(-1,-6)]
head(data1)

#apply kmeans clustering algorithm using different k values (number of clusters)

# k=2  
K2 = kmeans(data1,2)
K2


# k=3  
K3 = kmeans(data1,3)
K3

# k=4  
K4 = kmeans(data1,4)
K4

# k=5  
K5 = kmeans(data1,5)
K5



## plot the clustering results with the centroids
#plot(data1, col = K3$cluster)

#based on features 1 and 2
#K2 model
plot(data1[c(1,2)], col = K2$cluster)
points(K2$centers[,c(1,2)], col = 1:2,  pch = 8, cex=2)

#k3 model
plot(data1[c(1,2)], col = K3$cluster)
points(K3$centers[,c(1,2)], col = 1:3,  pch = 8, cex=2)

#k4 model
plot(data1[c(1,2)], col = K4$cluster)
points(K4$centers[,c(1,2)], col = 1:4,  pch = 8, cex=2)

#k5 model
plot(data1[c(1,2)], col = K5$cluster)
points(K5$centers[,c(1,2)], col = 1:5,  pch = 8, cex=2)

#based on features 3 and 4
#K2 model
plot(data1[c(3,4)], col = K2$cluster)
points(K2$centers[,c(3,4)], col = 1:2,  pch = 8, cex=2)

#k3 model
plot(data1[c(3,4)], col = K3$cluster)
points(K3$centers[,c(3,4)], col = 1:3,  pch = 8, cex=2)

#k4 model
plot(data1[c(3,4)], col = K4$cluster)
points(K4$centers[,c(3,4)], col = 1:4,  pch = 8, cex=2)

#k5 model
plot(data1[c(3,4)], col = K5$cluster)
points(K5$centers[,c(3,4)], col = 1:5,  pch = 8, cex=2)


# The best clusters are from K3 model with variables "width" and "mass"

#Features selection
head(Fruit)
data2=Fruit[,c(-1)]
head(data2)

data2$Type=as.factor(data2$Type)
str(data2)


#Top features
topf <- gain.ratio(Type ~ ., data2)
topf

#Build the model based on top 3 features
# The top 3 features are mass, width, and color

model <- ctree(Type ~ mass + width + color,data = data2)
model

#plot
plot(model)

