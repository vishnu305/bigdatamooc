#clear all data variables
rm(list=ls())

car_data <- read.csv(file="CarSales.csv")

print(car_data)
print(" ")

TopSales <- subset(car_data,Sales>300)
print(TopSales)
print(" ")

#topsales in descending order
sorted_topsales <- TopSales[order(-TopSales$Sales),]
print(sorted_topsales)

#write output file
write.table(sorted_topsales,file="Sorted_Top_Sales.csv",sep=",",row.names=FALSE)
print("saved table successfully")

vec1 <- c(15,2,46,78,50)

resultvec <- ifelse(vec1%%2==0,"even","odd")
print(resultvec)

#concatenation

print(paste("a","b"))
print(paste("hello","world",sep="_"))

str1 <- c("Hello","world")
print(paste(str1,collapse=" "))
print(paste(str1,collapse="*"))

#check for null
vec2 <- c(1.2,3,4,5,NA,7,NA,9)

print(is.na(vec2))
no_null_vec <- vec2[!is.na(vec2)]
print(no_null_vec)

df1 = data.frame(customerid=c(1:6),product=c(rep("Toaster",3),rep("Radio",3)))
print(df1)







