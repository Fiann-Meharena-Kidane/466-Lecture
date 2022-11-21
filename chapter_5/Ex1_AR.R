# Full code
setwd("C:/R Codes/Ch5")
weather <- read.csv("weather.csv",header=T, colClasses = "factor")
weather

weather <- read.csv(file.choose(),header=T, colClasses = "factor")
weather

str(weather)
install.packages('arules')
install.packages('arulesViz')
library(arules)

# find association rules with default settings
rules.all <- apriori(weather)

#inspect() function it displays the association rules

inspect(rules.all)
#Mine the rules with minimum support of 0.005 and 0.8 as the minimum confidence. 
# rules with rhs containing "Play or not" only
rulesPlay = apriori(weather,  parameter = list(minlen=2, supp=0.005, conf=0.8), appearance = list(
  rhs=c("Play.golf=No", "Play.golf=Yes"), default="lhs"))
inspect(rulesPlay)

quality(rulesPlay)

quality(rulesPlay) <- round(quality(rulesPlay), digits=3)
quality(rulesPlay)


rulesPlay.sorted <- sort(rulesPlay, by="conf")
#rulesPlay.sorted <- sort(rulesPlay, by="lift")
inspect(rulesPlay.sorted)



#  Visualizing Association Rules
library(arulesViz)
plot(rulesPlay.sorted )
plot(rulesPlay.sorted , method="graph")
 
