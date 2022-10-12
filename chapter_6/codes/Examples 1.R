

#------------Example 1--------------------

Java1 <- c(95, 85, 80, 70, 60)
Java1
Java2 <- c(85, 95, 70, 65, 70)
Java2


plot(Java1, Java2)

fit <- lm(Java2 ~ Java1)
fit
#Java2 = c0 + c1 * Java1
#Y = c0 + c1*x1
#Java2 = 26.7808 + 0.6438 * Java1
fit$coefficients

fit$coefficients[[1]]
fit$coefficients[[2]]
#Java2 = 26.7808 + 0.6438 * Java1

# new student with Java1 grade is 80 find Java2
java2_ <- fit$coefficients[[1]] + fit$coefficients[[2]]*80

java2_ 

a <- data.frame(Java1 = 80)
a
result <-  predict(fit,a)
result

#------------Example 2--------------------



# 1. read marks
Java1 <- c(95, 85, 80, 70, 60, 80, 75, 90, 88)
Java2 <- c(85, 95, 70, 65, 70, 78, 72, 88, 91)
swEng <- c(82, 89, 70, 72, 75, 77, 75, 89, 89)


#2. plot
library(scatterplot3d)
scatterplot3d(Java1,   # x axis
              Java2,   # y axis
              swEng,   # z axis
              main="3-D Scatterplot Example 1")

# 3. predict the mark in software engineering based on the marks in java1 and java2
fit2 <- lm(swEng ~ Java1 + Java2)
fit2

#swEng = c0 + c1 * Java1 + c2* Java2
#swEng = 27.699 - 0.1069*Java1 + 0.7647*Java2

# new student with Java1 = 90 and Java2 = 79 predict swEng

b <- data.frame(Java1 = 90,Java2=79)
b
result <-  predict(fit2,b)
result

# 4. visualize the model
install.packages("visreg")
library(visreg)
visreg(fit2)


#------------Example 3--------------------

# each year 4 quarters 
# rep() function replicates values 
year <- rep(2008:2010, each=4)
year
quarter <- rep(1:4, 3) # 3 years / 4 Q
quarter

cpi <- c(162.2, 164.6, 166.5, 166.0, 166.2, 167.0, 168.6, 169.5,171.0, 172.1, 173.3, 174.0)
cpi

cor(year,cpi)
cor(quarter,cpi)

fit <- lm(cpi ~ year + quarter)
fit




fit$coefficients[[1]]
fit$coefficients[[2]]

fit$coefficients[[3]]

# cpi = C0 + C1*year + C2*quarter

cpi2011 <- fit$coefficients[[1]] + fit$coefficients[[2]]*2011 + fit$coefficients[[3]]*(1:4)
cpi2011

data2011 <- data.frame(year=2011, quarter=1:4)
data2011

cpi2011 <- predict(fit, data2011)
cpi2011



#------------Example 4--------------------

income_input = read.csv("c:/R Codes/Ch6/income.csv")
income_input=read.csv(file.choose())
income_input


income_input[1:10,]

head(income_input,5)

summary(income_input)

names(income_input)


results <- lm(Income ~ Age + Education + Gender, income_input)
results

#Income = 7.2630  + 0.9952*Age + 1.7579*Education + (-0.9343*Gender)


summary(results)

results2 <- lm(Income ~ Age + Education, income_input) # training phase, 
results2 
summary(results2) 


# Income= 6.758 + 0.996*Age + 1.759*Education 


#Income = B0 + B1*Age + B2*Education

# compute the expected income of a person with age==41 and Education==12, 

# create first a data frame, 
Age <- 41
Education <- 12
new_pt <- data.frame(Age, Education)
new_pt


new1 <- predict(results2, new_pt)  # testing phase, 
new1 


results2$coefficients[[2]]
#Income = B0 + B1*Age + B2*Education
new2 <- results2$coefficients[[1]] + results2$coefficients[[2]]*41 + results2$coefficients[[3]]*12
new2

