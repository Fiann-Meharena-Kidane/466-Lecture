#Variables and Assignmemt in R

x = 5
y <- 5
z <- x + y

x
y
z

x + 1

x**2 # x to the power of 2

# Assignments 
a = 5
a



#Basic R datatypes

#Numeric - Numbers
#Numbers that have a decimal value
num <- 1.2
num
class(num)

# Integer
# Numbers that do not contain decimal values have a data type as an integer. However, to create an
# integer data type, you explicitly use as.integer() and pass the variable as an argument.

value <- 2.2
value <- as.integer(value)
value
class(value)

#Character / Strings
# As the name suggests, it can be a letter or a combination of letters enclosed by quotes is considered
# as a character data type by R. It can be alphabets or numbers.

char <- "Data Analytics"
char
class(char)

# Logical
# A variable that can have a value of True and False like a boolean is called a logical variable.

log_true <- TRUE
log_true
class(log_true)
log_false <- FALSE
log_false
class(log_false)


#Operators
#Arithmetic Operators
# The operators that perform addition and subtraction are `+` and `-`:
2 + 3
2 - 3
# The operators that perform multiplication and division are `*` and `/`
2 * 3
2 / 3

#Exercise: What is the operator for Square root?
#** or ^ to power of some value
sqrt(4)
sqrt(9)
4**.5
4^(1/2)
#------------------------------
x=3 * (2 + 1)
x

#Operators - Arithmetic
a = 9
a
b= 2
b
c= a + b
c

d= 8 - 2
d

#Operators - Relational
a = 9
b = 2

print(a > b)
print(a >= b)
print(a <= b)
print(a == b)
print(a != b)


# Example with vectors 

my_vector1 <- 10:15
my_vector2 <- 3:8

my_vector1
my_vector2
vec_comparison = my_vector1 > my_vector2
vec_comparison

#Vectors

my_numbers <- 1:5
my_numbers
my_vector1 = c(1:6)
my_vector1
my_vector2 = c(2, 11, 9,6,34,5)
my_vector2


Sum_vector = my_vector2 + my_vector1
Sum_vector

length(Sum_vector)
class (my_vector1)
typeof(my_vector1)

num_1 = 5
class (num_1)
typeof(num_1)
# as exercise you can apply typeof on other R data types

# operation on Vectors
V <- my_vector1
V
W <- my_vector1 *2
W
Z <- V + W
Z
Result <- Z > 8
Result

mean(my_vector1) # average
max(my_vector1)
min(my_vector1)
sum(my_vector1)
range(my_vector1)
length(my_vector1)

#Data Frame

# Create a, b, c, d variables
a <- c(10,20,30,40)
b <- c('book', 'pen', 'textbook', 'pencil_case')
c <- c(TRUE,FALSE,TRUE,FALSE)
d <- c(2.5, 8, 10, 7)
# Join the variables to create a data frame
df <- data.frame(a,b,c,d)
df
# Name the data frame
names(df) <- c('ID', 'items', 'store', 'price')
df
# Print the structure
str(df)

df[1,2]

df[1:2,]

df[,1]
## Select Rows 1 to 3 and columns 3 to 4
df[1:3, 3:4]
#Append a Column to Data Frame

# Create a new vector
quantity <- c(10, 35, 40, 5)

# Add `quantity` to the `df` data frame
df$quantity <- quantity
df

mat <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3)
mat
mat[1,] 
mat[,1]
mat[1,1] 


##### Create Sequence #####
x <- seq(1,6,2)
x
y <- seq(2,6,2)
y
