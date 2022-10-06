# Creating a dataframe
num <- c(2, 3, 5)
char <- c("aa", "bb", "cc")
log <- c(TRUE, FALSE, TRUE)
df = data.frame(num, char, log) # df is a data frame
df
class(df)
df[1,1]
df[3,]
df[,2]


#===========================================
#in built dataframe in R - mtcars
mtcars
dim(mtcars) # dimensions
nrow(mtcars) # number of rows
ncol(mtcars) # number of columns
head(mtcars) # head()- first 6 rows
tail(mtcars) # tail()-last 6 rows
str(mtcars) # structure of the mtcar dataset
mtcars[c(1,3),1:4] 
summary(mtcars) # descriptive statistics summary"


mtcars$mpg #Accessing column mpg
mtcars$disp #Accessing column disp
mtcars$gear #Accessing column gear
mtcars[c(1:3)] # #Accessing columns 1 to 3


df = mtcars
df$wt
df$disp # Access column

df[2,] # access 2nd row
df[,"disp"] # access disp column
df[2, "disp"] # access disp column of 2nd row
df[2,4] # Row # 2 and Column # 4

# rbind () - combine rows in dataframe
str(df)
df1 <- df[1:20,]
str(df1)
df2 <- df[21:32,]
str(df2)
df_full <- rbind(df1, df2)
str(df_full)
#cbind() - combine cloumn in dtaframe
df3 <- df$mpg
df3
df4 <- df$cyl
df4
df_full <- cbind(df3,df4)
df_full

#LIST: It may contain a combinaton of vectors, matrices, data frames and even ,!other list
# Vector with numerics from 1 up to 10
my_vector <- 1:10
# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)
# First 3 rows of the built-in data frame mtcars
my_df <- mtcars[1:3,]
# Construct list with these different elements:
my_list <- list(my_vector, my_matrix, my_df)
my_list 

