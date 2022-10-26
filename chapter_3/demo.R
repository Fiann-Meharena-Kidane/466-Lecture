mtcars

table(mtcars$gear, mtcars$cyl) # returns frequency of gear and cylinder
# row== gear, col==cylinder 
# eg. 12 cars with 3 gear and 8 cylinder

table(mtcars$gear)  # eg. 15 cars with 3 gear


counts=table(mtcars$gear, mtcars$cyl)

barplot(counts, main = 'Distribution of Car cylinder counts and gears', 
         xlab = 'Number of Cylinder',
          ylab = 'counts')
          col=c('red', 'blue', 'brown') 
          legend=rownames(counts) beside=True 
          args.lenged=list(x='top', title='Number of Gears', cex='0.4')

          
AirPassengers

plot(AirPassengers)
boxplot(AirPassengers)

head(iris)         
iris

boxplot(Sepal.Length~Species, data = iris)
boxplot(Petal.Width~Species, data = iris)


M=c(1,2,3,4,5,6,7) # vector 
summary(M)
boxplot(M)


mtcars
str(mtcars)

boxplot(mtcars$hp, col='blue')

boxplot(mpg~gear, data = mtcars)

mtcars[c(1,2,3),1:3]

my_vector=
my_matrix=matrix(1:8, ncol = 3)
my_matrix

