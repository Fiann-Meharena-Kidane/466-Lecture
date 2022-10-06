#=================== Dirty Data Examples

# is.na in r example

demo = c(1, 2, NA, 4, NA, 6, 7)


is.na(demo)


demo[is.na(demo)]

demo[!is.na(demo)]



demo2 = c(1, 2, 3, 4, 5, 6, 7)
is.na(demo2)




demo = c(1, 2, NA, 4, NA, 6, 7)


any(is.na(demo))
any(is.na(demo2))


#which() function which returns to locations that have NA values.

demo = c(14, 70, NA, 35, NA, 11, 17)

which(is.na(demo))
which(!is.na(demo))


x<- c(NA, 3, 4, NA, NA, NA)
is.na(x)



#Extracting values except for NA values
x <- c(1, 2, NA, 3, NA, 4)
x
is.na(x)
!is.na(x)

x[!is.na(x)]


#-------------- Example ------------------------------

# Creating a data frame
df <- data.frame (c1 = 1:8,
                  c2 = c("B", "A", "B", "C",
                                 "A", "C", "B", "A"))
df
# Filling some NA in data frame
df[4, 1] <- df[6, 2] <- NA
df

# excludes every row containing even one NA
x=na.exclude (df)
x


                  
#Missing values in analysis
## use the famous anscombe data 

anscombe
is.na(anscombe)




# data frame with missing data
df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA,"is", "text"), 
                 col3 = c(TRUE, FALSE, TRUE, TRUE), 
                 col4 = c(2.5, 4.2, 3.2, NA))
df



# identify NAs in full data frame
is.na(df)


# identify NAs in specific data frame column

is.na(df$col4)

df$col4[!is.na(df$col4)]



df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA,"is", "text"), 
                 col3 = c(TRUE, FALSE, TRUE, TRUE), 
                 col4 = c(2.5, 4.2, 3.2, NA))
df

# identify count of NAs in data frame

is.na(df)

x <- c(1:4, NA, 6:7, NA)

sum(is.na(x))

sum(is.na(df$col4))


sum(!is.na(df))


#For data frames, a convenient shortcut to compute the total missing values in each column is to use colSums()
colSums(is.na(df))


# recode missing values with the mean
# vector with missing data
x <- c(1:4, NA, 6:7, NA)
x

x[is.na(x)] <- mean(x, na.rm = TRUE)
x


x=round(x,2)
x


# data frame that codes missing values as 99
df <- data.frame(col1 = c(1:3, 99), col2 = c(2.5, 4.2, 99, 3.2))
df


# change 99s to NAs
df[df == 99] <- NA
df

#------------------------------------

# data frame with missing data
df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA,"is", "text"), 
                 col3 = c(TRUE, FALSE, TRUE, TRUE), 
                 col4 = c(2.5, 4.2, 3.2, NA))
df

df$col4[is.na(df$col4)] <- mean(df$col4, na.rm = TRUE)              
df

mean(df$col4, na.rm = TRUE)


#-------------------------------------------
# data frame with missing values
df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA,"is", "text"), 
                 col3 = c(TRUE, FALSE, TRUE, TRUE), 
                 col4 = c(2.5, 4.2, 3.2, NA))

df
#na.omit() to omit all rows containing missing values

na.exclude(df)
df
#=================-------------------------

data <- data.frame(x1 = c(9, 6, NA, 9, 2, 5, NA),     # Column with 2 missing values
                   x2 = c(NA, 5, 2, 1, 5, 8, 0),      # Column with 1 missing values
                   x3 = c(1, 3, 5, 7, 9, 7, 5))       # Column without missing values
data                                                  # Print data to RStudio console

na.omit(data) 
data
data_omit <- na.omit(data)                            # Apply na.omit in R
data_omit                                             # Print data_omit to RStudio console



#-------------------------- Example
airquality
#This code prints the rows where the Ozone is NA 
airquality[is.na(airquality$Ozone),]
is.na(airquality$Ozone)
airquality <- airquality[!is.na(airquality$Ozone),]
airquality

#========================================================


Bi <- read.csv("C:/R Codes/Ch3/bikes.csv")
Bi

sum(is.na(Bi))

sum(is.na(Bi$count))

Bi$count


mean(Bi$count)
mean(Bi$count, na.rm = TRUE)

Bi$count[is.na(Bi$count)] <- mean(Bi$count, na.rm = TRUE)
Bi

#=================================================================

# R program to illustrate
# Contingency Table



# Creating a vector
vec = c(2, 4, 3, 1, 6, 3, 2, 1, 4, 5)

# Creating contingency table from vec using table()
conTable = table(vec)
conTable

#=================== Scatterplot Examples
# Get the input values.
input <- mtcars[, c('wt', 'mpg')]

# Plot the chart for cars with 
# weight between 1.5 to 4 and 
# mileage between 10 and 25.
plot(x = input$wt, y = input$mpg,
     xlab = "Weight",
     ylab = "Milage",
     xlim = c(1.5, 4),
     ylim = c(10, 25),         
     main = "Weight vs Milage"
)



#=================== Dotchart Example


month <- month.name
month

expected <- c(15, 16, 20, 31, 11, 6,
              17, 22, 32, 12, 19, 20)
sold <- c(8, 18, 12, 10, 41, 2,
          19, 26, 14, 16, 9, 13)
quarter <- c(rep(1, 3), rep(2, 3), rep(3, 3), rep(4, 3))


data <- data.frame(month, expected, sold, quarter)
data
dotchart(data$sold, labels = data$month, pch = 10, bg = "green", pt.cex = 1.5)

######################
#In the below example, we generate dotplot of student marks.
students <- c(10,11,12,15,14,10,16,17,12)
dotchart(students, col = 'red')

students <- c(1, 5, 7, 3, 3, 5, 8, 15, 10, 10, 15, 5, 5, 12, 15, 10, 15, 3, 3, 3, 5, 15)
dotchart(students, col = 'blue')


#=================== Barplot Examples

# Create the data for the chart
H <- c(7,12,28,3,41)
M <- c("Mar","Apr","May","Jun","Jul")



# Plot the bar chart 
barplot(H,names.arg=M,xlab="Month",ylab="Revenue",col="blue",
        main="Revenue chart",border="red")


######## EX
colors = c("green", "orange", "brown")
months <- c("Mar", "Apr", "May", "Jun", "Jul")
regions <- c("East", "West", "North")

# Create the matrix of the values.
Values <- matrix(c(2, 9, 3, 11, 9, 4, 8, 7, 3, 12, 5, 2, 8, 10, 11), 
                 nrow = 3, ncol = 5)

# Create the bar chart
barplot(Values, main = "Total Revenue", names.arg = months, 
        xlab = "Month", ylab = "Revenue", 
        col = colors, beside = TRUE)


#=================== Histogram Examples
str(airquality)
airquality
dim(airquality)
Temperature <- airquality$Temp
hist(Temperature)

# histogram with added parameters
hist(Temperature,
     main="Maximum daily temperature at La Guardia Airport",
     xlab="Temperature in degrees Fahrenheit",
     xlim=c(50,100),
     col="darkmagenta",
     freq=TRUE
)


# Create data for the graph.
v <- c(19, 23, 11, 5, 16, 21, 32, 14, 19, 27, 39)


# Create the histogram.
hist(v, xlab = "No.of Articles", col = "green", 
     border = "black", xlim = c(0, 50),
     ylim = c(0, 5), breaks = 5)  





#=================== Box-and-Whisker Plot Examples

# prepare the data
ozone <- airquality$Ozone
temp <- airquality$Temp
airquality
boxplot(Temp~Month,
        data=airquality,
        main="Different boxplots for each month",
        xlab="Month Number",
        ylab="Degree Fahrenheit",
        col="orange",
        border="brown"
)



# Plot the chart.
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", main = "Mileage Data")

########### EX
# Plot the chart.
boxplot(mpg ~ cyl, data = mtcars, 
        xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", 
        main = "Mileage Data",
        col = c("green","yellow","purple"),
        names = c("High","Medium","Low")
)

