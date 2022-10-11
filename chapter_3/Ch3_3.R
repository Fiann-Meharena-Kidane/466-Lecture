
##########################################
#  Exploratory Data Analysis
##########################################

install.packages( "ggplot2" )

# import a csv file of the total annual sales for each customer
sales <- read.csv(file.choose())

sales
summary(sales)
nrow(sales)
ncol(sales)


#rnorm()?function in R programming is used to generate a vector of
#random numbers which are normally distributed.
#We need to provide the rnorm() function with the number of values 
#that needs to be generated. Further, the mean and variance values are optional.
#If not provided, it takes the default values as mean = 0 and variance = 1.


# geometric object: The type of plot you want to show. 
# The most common object are: 
# Point: `geom_point()` 
# Bar: `geom_bar()` 
# Line: `geom_line()` 
# Histogram: `geom_histogram()`




x <- rnorm(50) 
x

y <- x + rnorm(50, mean=0, sd=0.5)
y

data <- as.data.frame(cbind(x, y))
summary(data)

plot(x,y)

library(ggplot2)
ggplot(data, aes(x=x, y=y)) +
  geom_point(size=2)

ggplot(data, aes(x=x, y=y)) +
  geom_point(size=2) +
  ggtitle("Scatterplot of X and Y") + 
  theme(axis.text=element_text(size=12), 
        axis.title = element_text(size=14),
        plot.title = element_text(size=20, face="bold"))

##########################################
#  Visualization Before Analysis
##########################################


library(ggplot2)

data(anscombe) # load the anscombe dataset into the current workspace
anscombe
nrow(anscombe) # number of rows

iris
nrow(iris)
dim(iris)

mtcars
# generates levels to indicate which group each data point belongs to
#

levels <- gl(4,nrow(anscombe))
levels

# Group anscombe into a data frame
mydata <- with(anscombe,data.frame(x=c(x1,x2,x3,x4), y=c(y1,y2,y3,y4), mygroup=levels))
mydata

# Make scatterplots using the ggplot2 package
# theme_gray : gray background color and white grid lines
# theme_bw : white background and gray grid lines
theme_set(theme_bw()) # set plot color theme

# create the four plots of Figure 3-7
# geom_smooth plot a smooth line
#We have used geom_smooth() function to add a regression line
#to our scatter plot by providing "method=lm"  as an argument.
#We have set method=lm as lm stands for Linear Model, 
#which plots a linear regression line.
#fullrange: Should the fit span the full range of the plot, or just the data?
#create Faceted Line Graph using facet_wrap() function


ggplot(mydata, aes(x,y)) +
  geom_point(size=2) +
  geom_smooth(method="lm", fill=NA, fullrange=TRUE) +
  facet_wrap(~mygroup)



# Each dataset is plotted as a scatterplot, and the fitted lines are the 
# result of applying linear regression models. 

# The estimated regression line fits Dataset 1 reasonably well. 

# Dataset 2 is definitely nonlinear. 

# Dataset 3 exhibits a linear # trend, with one apparent outlier at x =13.

# For Dataset 4, the regression line fits the dataset quite well.
# However, with only points at two x values, it is not possible to 
# determine that the linearity assumption is proper.


##########################################
# Dirty Data
##########################################
#If the age data is in a vector called age, 
#the graph can be created with the following R script:
#runif: generate 40 random variables, uniformly distributed between min and max


x=12.66576
x
y=round(x,2)
y

one=rep(5,9)
one

x=rep(0,400)
x


y=runif(40, min=100, max=110)
y

runif(20, min=-2, max=0)

age <- rnorm(6000, mean=40, sd=10) 
age
round(age,2)

#age <- round(age,2)

age <- c( age, runif(20, min=-2, max=0), 
          rep(0,400), 
          runif(40, min=100, max=110))

age
age <- round(age)

age
length(age)

# Consider a scenario in which a bank is conducting data analyses of its 
# account holders to gauge customer retention.

# The Figure shows the age distribution of the account holders.
# 
# The figure shows that the median age of the account holders is around 40. 
# A few accounts with account holder age less than 10 are unusual but plausible. 
# These could be custodial accounts or college savings accounts set up
# by the parents of young children. 
# 
# 
# However, the left side of the graph shows a huge spike of customers who are zero years old or have
# negative ages. 
# This is likely to be evidence of missing data. 
# One possible explanation is that the null age values could have been 
# replaced by 0 or negative values during the data input. 
# 
# Therefore, data cleansing needs to be performed over the accounts with
# abnormal age values. 
# Analysts should take a closer look at the records to decide if the missing data
# should be eliminated or if an appropriate age value can be determined
.


#breaks: This parameter is used as width of each bar.
#col: This parameter is used to set color of the bars.


hist(age, breaks=100, main="Age Distribution of Account Holders",
     xlab="Age", ylab="Frequency", col="gray")


#In R, the is.na() function provides tests for missing values
#The is.na() function returns TRUE at each NA value and FALSE otherwise.

x <- c(1, 2, 3, NA, 4,NA,89)
x

is.na(x)

!(is.na(x))


x[is.na(x)!= FALSE]
x[is.na(x)!= TRUE]

#Some arithmetic functions, such as mean(), applied to 
#data containing missing values can yield an NA result. 
#To prevent this, set the na.rm parameter to TRUE to 
#remove the missing value during the function's execution.


x <- c(1, 2, 3, NA, 4,NA,89)
mean(x)

mean(x, na.rm=TRUE)



DF <- data.frame(x = c(1, 2, 3), y = c(10, 20, NA))
DF

mean(DF$y)
mean(DF$y,na.rm=TRUE)

DF1 <- na.exclude(DF)
DF1


mtcars

#rbeta: This function is used to generate random numbers from the beta density
#rbeta(n, shape1, shape2)
#n: number of observations
#shape1, shape2: non-negative parameters of the Beta distribution

rbeta(2000,2,4)

mortgage <- rbeta(2000,2,4) * 10
mortgage
round(mortgage)

rep(10, 1000)

mortgage <- c( mortgage, rep(10, 1000))

hist(mortgage, breaks=10, xlab="Mortgage Age", col="gray",
     main="Portfolio Distribution, Years Since Origination")

##########################################
#Visualizing a Single Variable
##########################################


data(mtcars)
mtcars


## Dotchart and Barplot ##
#cex: the character size to be used. 

mtcars$disp
mtcars$mpg

row.names(mtcars)


dotchart(mtcars$mpg,labels=row.names(mtcars),cex=0.9,
         main="Miles Per Gallon (MPG) of Car Models",
         xlab="MPG")

mtcars
mtcars$cyl

table(mtcars$gear)
table(mtcars$cyl)


barplot(table(mtcars$cyl), main="Distribution of Car Cylinder Counts",
        xlab="Number of Cylinders")


## Histogram and Density Plot ##

# randomly generate 4000 observations from the log normal distribution
income <- rlnorm(4000, meanlog = 4, sdlog = 0.7)
income
summary(income)
income <- 1000*income
income
summary(income)
# plot the histogram
hist(income, breaks=500, xlab="Income", main="Histogram of Income")



# In the data preparation phase of the Data Analytics Lifecycle, the data range and
# distribution can be obtained. 
# If the data is skewed, viewing the logarithm of the data can help detect structures 
# that might otherwise be overlooked in a graph with a regular, nonlogarithmic scale.



##########################################
# Examining Multiple Variables
##########################################




## Dotchart and Barplot ##
mtcars

mtcars$mpg

x=sort(mtcars$mpg)
x
# sort by mpg




cars <- mtcars[order(mtcars$mpg),]
cars
# grouping variable must be a factor
cars$cyl
table(cars$cyl)


cars$cyl <- factor(cars$cyl)

cars$cyl

cars

cars$color[cars$cyl==4] <- "red"
cars$color[cars$cyl==6] <- "blue"
cars$color[cars$cyl==8] <- "darkgreen"
cars

row.names(cars)


# Figure shows a dotchart that groups vehicle cylinders at
# the y-axis and uses colors to distinguish different cylinders. The vehicles are sorted
# according to their MPG values. 



dotchart(cars$mpg, labels=row.names(cars), cex=.7, groups= cars$cyl,
         main="Miles Per Gallon (MPG) of Car Models\nGrouped by Cylinder",
         xlab="Miles Per Gallon", color=cars$color, gcolor="black")

mtcars

#table() function in R Language is used to create a categorical representation of data 
#with variable name and the frequency in the form of a table.



table(mtcars$gear, mtcars$cyl)

table(mtcars$gear)



counts <- table(mtcars$gear, mtcars$cyl)
counts


barplot(table(mtcars$gear, mtcars$cyl), main="Distribution of Car Cylinder Counts and Gears",
        xlab="Number of Cylinders", ylab="Counts",
        col=c("red", "blue", "darkgreen"),
        legend = rownames(counts), beside=TRUE,
        args.legend = list(x="top", title = "Number of Gears",cex=0.4))


table(cars$gear)

barplot(table(cars$gear), main=" Gears",
        xlab="Number of Gears", col="red")





#=====================================================================
## Analyzing a Variable over Time ##

# Figure plots the monthly total numbers of international airline passengers (in thousands) 
# from January 1940 to December 1960. 
# 
# The plot shows that, for each year, a large peak occurs mid-year around July and August, 
# and a small peak happens around the end of the year,
# 
# 
# Additionally, the overall trend is that the number of air passengers steadily increased from 1949 to 1960


AirPassengers
plot(AirPassengers)


#========================================================

iris
boxplot(Sepal.Length~Species, data=iris)


M <- c(19,2,15,6,4,18,1,12,3,2,4,21,22,23,15)

boxplot(M)
mtcars
str(mtcars)
boxplot(mtcars$hp, col = "blue")
boxplot(mpg~gear, data = mtcars)
