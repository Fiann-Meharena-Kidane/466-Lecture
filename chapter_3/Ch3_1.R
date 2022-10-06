

setwd("C:/R Codes/Ch3")

# import a csv file of the total annual sales for each customer
sales <- read.csv("yearly_sales.csv")
sales
str(sales)
#sales_table <- read.table("yearly_sales.txt", header=TRUE, sep=",")
#sales_delim <- read.delim("yearly_sales_tab_delimited.txt")
# examine the imported dataset
head(sales)
head(sales,8)
summary(sales)

plot(1:10) 

# plot num_of_orders vs. sales
plot(sales$num_of_orders,sales$sales_total,
     main="Num of Sales")


# add a column for the average sales per order
sales$per_order <- sales$sales_total/sales$num_of_orders
sales
# export data as tab delimited without the row names
write.table(sales,"sales_modified.txt", sep="\t", row.names=FALSE)
