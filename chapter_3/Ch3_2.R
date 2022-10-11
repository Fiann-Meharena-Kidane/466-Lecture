# Numeric, Character, and Logical Data Types
i <- 1                      # create a numeric variable
sport <- "football"         # create a character variable
sport
flag <- TRUE                # create a logical variable
flag
print(flag)


class(i)                    # returns "numeric"
typeof(i)                   # returns "double"
class(sport)                # returns "character"
typeof(sport)               # returns "character"
class(flag)                 # returns "logical"
typeof(flag)                # returns "logical"

x=-5
class(x)
is.integer(i)               # returns FALSE
j <- as.integer(i)          # coerces contents of i into an integer
is.integer(j)               # returns TRUE


length(i)                   # returns 1
length(flag)                # returns 1
length(sport)               # returns 1 (not 8 for "football")


# Vectors
is.vector(i)                # returns TRUE
is.vector(flag)             # returns TRUE
is.vector(sport)            # returns TRUE

u <- c("red", "yellow", "blue") # create a vector "red" "yellow" "blue"
u                               # returns "red" "yellow" "blue"

u[1]
u[2]                            

v <- 1:5                        # create a vector 1 2 3 4 5
v                               # returns 1 2 3 4 5
length(v)

x = 30:71
x
m <- seq(2,18,3)
m

m2=rep(2,5)
m2

a=sum(v)                          
b=mean(v)

v <- 1:5                        
w <- v * 2                      # create a vector 2 4 6 8 10
w                               # returns 2 4 6 8 10
length(x)
w[3]                           
z <- v + w                      # sums two vectors element by element
z                               

z > 8                           # returns FALSE FALSE TRUE TRUE TRUE


z[z > 8]                        # returns 9 12 15

z[z > 8 | z < 5]                # returns 3 9 12 15 ("|" denotes "or")

 

a <- vector(length=3)           # create a logical vector of length 3
a                               # returns FALSE FALSE FALSE

b <- vector(mode="numeric", 3)  # create a numeric vector of length 3
typeof(b)                       # returns "double"

b[2] <- 3.1                     # assign 3.1 to the 2nd element
b                               # returns 0.0 3.1 0.0
b[3] <- 4.6
b

c <- vector(mode="integer", 5)  # create an integer vector of length 5
c                               # returns integer(0)
typeof(c)  
length(c)                       
length(b)                       

# Arrays and Matrices

quarterly_sales <- array(9,dim=c(5,4))
quarterly_sales
quarterly_sales[3,4] <- 15
quarterly_sales

sales_matrix <- matrix(2, nrow = 3, ncol = 4)
sales_matrix

sales_matrix[2,2]=25
sales_matrix

install.packages("matrixcalc")                      # install, if necessary
library(matrixcalc)


K=c(1,3,3,5,0,4,3,3,3)
K
M <- matrix(K,nrow = 3,ncol = 3) # build a 3x3 matrix
M
Y <- matrix.inverse(M)
Y

M %*% matrix.inverse(M)                             # multiply M by inverse(M)



Q <- matrix(c(1,3,3,5,0,4,3,3,3),nrow = 3,ncol = 3)
# transpose of matrix
# using t() function.
Q
t <- t(Q) 
t
# Data Frames

#import a CSV file of the total annual sales for each customer

sales <- read.csv("C:/R Codes/Ch3/yearly_sales.csv")
sales
is.data.frame(sales)              # returns TRUE
is.data.frame(sales)

x=sales$num_of_orders
x

length(sales$num_of_orders)       # returns 10000 (number of customers)
is.vector(sales$cust_id)          # returns TRUE
is.vector(sales$sales_total)      # returns TRUE
is.vector(sales$num_of_orders)    # returns TRUE
is.vector(sales$gender)           

is.vector(sales$num_of_orders)
summary(sales)

w=min(sales$sales_total)
w

max(sales$num_of_orders)

str(sales) # display structure of the data frame object
sales
#sales[row,col]
sales[,4]
sales[2:10,]
sales[,c(1,2,3)]

p= sales[,4]
p

x=sales[4,]
y=sales[1,2]

sales[,1:3]
# extract the gender column of the sales data frame
d=sales$gender
d
k=sales$num_of_orders
k
# retrieve the first two rows of the data frame
sales[1:2,]

#[row,col]
sales[,2:3]

#seq(start value, last value, increment)
sales[seq(3,7,2),]   
sales[,seq(2,4,1)]



f=sales[,c(2,4)]
f

str(f)
summary(f)
s=mean(f$sales_total)
s

seq(1,3,1)

sales[seq(2,10,3),]
sales[seq(2,10,3),]


# retrieve both the cust_id and the sales_total columns
sales[,c("cust_id", "sales_total")]
sales[2:5,c("num_of_orders","gender", "sales_total")]

# retrieve all the records whose gender is female
sales[sales$gender=="F",]


# retrieve all the records whose sales_total greater than 1200 
h=sales[sales$sales_total > 1200 ,] 
h


# Lists

# build an assorted list of a string, a numeric, a list, a vector,
# and a matrix
housing <- list("own", "rent")
housing
housing[[1]]
assortment <- list("football", 7.5, housing, v, M)
assortment

L2=list(3,4,1,8,90,seq(3,10,2),2:6)
L2
length(L2)
V 
M 
# examine the fifth object, M, in the list
class(assortment[5])               # returns "list"
length(assortment[5])              # returns 1
class(assortment[[5]])             # returns "matrix"
length(assortment[[ 5 ]])          # returns "matrix"
length(assortment[[5]])            # returns 9 (for the 3x3 matrix)

str(assortment)

##########################################
#  Descriptive Statistics
##########################################

#Covariance is a statistical term used to measures the direction of the linear 
#relationship between the data vectors

#Correlation is a relationship term in statistics that uses the covariance method to measure 
# how strong the vectors are related

#correlation of 1 indicates the data points perfectly lie on a line 
#for which Y increases as X increases. A value of -1 also implies the data points 
#lie on a line; however, Y decreases as X increases.
#

# Exactly -1. A perfect (negative) linear relationship, -0.70. A strong (negative) linear 
#relationship, -0.50. A moderate (negative) relationship, -0.30. A weak (negative) 
#linear relationship
#0. No linear relationship

# +0.30. A weak (positive) linear relationship, +0.50. A moderate (positive) 
#relationship, +0.70. A strong (positive) linear relationship, 
#Exactly +1. A perfect (positive) linear relationship


#The IQR function computes the Interquartile Range of a numeric input vector.
#IQR() function in R Language is used to calculate the interquartile range of a data set
#IQR = Q3 - Q1 where, Q3 specifies the median of n largest values Q1 specifies 
#the median of n smallest values

#median(): It is the middle value of the data set. It splits the data into two halves. If the number of elements in the data set is odd then the center element is median and if it is even then the median would be the average of two central elements.
#sd(): function is used to compute the standard deviation of given values in R. It is the square root of its variance
#var(): the variance is the measure of how much value is away from the mean value.


#MARGIN=2 indicates columns or rows 
#For example 1 indicates rows 2 indicates columns
#Fun: is the function to be applied


head(sales,5)
apply(sales[,c(1:3)], MARGIN=2, FUN=sd)
apply(sales[,c(1:3)], MARGIN=2, FUN=mean)
x <- sales$sales_total
y <- sales$num_of_orders
cor(x,y) # returns 0.7508015 (correlation)
cov(x,y) # returns 345.2111 (covariance)
IQR(x) # returns 215.21 (interquartile range)
mean(x) # returns 249.4557 (mean)
median(x) # returns 151.65 (median)
range(x) # returns 30.02 7606.09 (min max)
sd(x) # returns 319.0508 (std. dev.)
var(x) # returns 101793.4 (variance)


# Factors

class(sales$gender)       # returns "factor"
is.ordered(sales$gender)  # returns FALSE

head(sales$gender)        # display first six values and the levels

install.packages("ggplot2")  # install ggplot, if necessary
library(ggplot2)
data(diamonds)            # load the data frame into the R workspace
str(diamonds)

diamonds
head(diamonds$cut)        # display first six values and the levels


# build an empty character vector of the same length as sales
sales_group <- vector(mode="character",
                      length=length(sales$sales_total))
sales_group
# group the customers according to the sales amount

sales_group[sales$sales_total<100] <- "small"
sales_group

sales_group[sales$sales_total>=100 & sales$sales_total<500] <- "medium"
sales_group

sales_group[sales$sales_total>=500] <- "big"
sales_group

str(sales_group)


# create and add the ordered factor to the sales data frame
spender <- factor(sales_group,levels=c("small", "medium", "big"),
                  ordered = TRUE)


sales 
str(spender)

sales <- cbind(sales,spender)
sales
str(sales)


#######################################


one=c(1,2,3)
two=c(10,20,30)
three=one+two
three

#cbind :column
#rbind: row

x=c(1,2,3)
y=c(4,5,6)
cbind(x, y)


d1=as.data.frame(cbind(x,y))
d1
d2=as.data.frame(rbind(x,y))
d2


