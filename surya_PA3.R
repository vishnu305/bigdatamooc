cat("\014")
rm(list=ls())

#slicing vectors

vec1 <- c(12,4,4,6,9,3)

third_elem <- vec1[3]

print(third_elem)

#slicing matrices

A <- matrix(c(2,4,3,1,5,7),nrow=2,ncol=3,byrow=TRUE)

print(A)

A23 <- A[2,3]
Arow2vec <- A[2,]
A2by2 <- A[1:2,1:2]

print(A23)
print(Arow2vec)
print(A2by2)

#slicing data frames from vectors

n <- c(2,3,5)
s <- c("aa","bb","cc")
b <- c(TRUE,FALSE,TRUE)


df <- data.frame(n,s,b)
print("")
print(df)

print(df[1,2])
print(df[1,])
print(df[,2])

cardata <- read.csv("CarSales-4.csv")
print(cardata)

TopSales <- subset(cardata,Sales>300)
print(TopSales)

sorted_topsales <- TopSales[order(-TopSales$Sales),]
print(sorted_topsales)

#using a function called which to subset the dataframe

IDX_POS <- which(cardata$Sales>300)
carsale_GT_300 <- cardata[IDX_POS,]
print(carsale_GT_300)

#to get opposite of given criteria means less than 300

carsale_LT_300 <- cardata[-IDX_POS,]
print(carsale_LT_300)

Max_sale_model <- cardata$Model[which.max(cardata$Sales)]
print(Max_sale_model)


#DPLYR package used for data manipulation
#install.packages("dplyr")
library(dplyr)

#1. select verb from dplyr

car_models <- select(cardata,Model)
print(car_models)
#2. filter verb
sales_GT_500 <- filter(cardata,Sales>500)
print(sales_GT_500)
#3. arrange verb
sorted_cardata <- arrange(cardata,desc(Sales))
print(sorted_cardata)
#4. mutate verb
cardata2 <- mutate(cardata,Perc_Tot_Sales = (100*Sales)/(sum(Sales)))
print(cardata2)
#5. summarise verb
sale_summary <- summarise(cardata,avg_sales = mean(Sales),
                          min_sales = min(Sales),
                          max_sales = max(Sales),
                          total_sales = sum(Sales))
print(sale_summary)
#6. Group by

Mf_Avg_Sales <- cardata %>% group_by(Make) %>% summarise(Avg_Sales=mean(Sales))
print(Mf_Avg_Sales)

