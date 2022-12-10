vec1 <- c(12, 4, 4, 6, 9, 3)

third_elem <- vec1[3]

third_elem

A<- matrix(c(2, 4, 3, 1, 5, 7), nrow=2, ncol=3, byrow= TRUE)
A

A23 <- A[2, 3]

ARow2Vec <- A[2, ]
ARow2Vec

A2by2 <- A[1:2, 1:2]
A2by2

n <- c(2, 3, 5)
s<- c("aa", "bb", "cc")
b<- c(TRUE, FALSE, TRUE)

df<- data.frame(n,s,b)

df
df[1,2]
df[1,]
df[,2]

Make <- c("Toyota", "Hyundai", "Maruti", "Toyota", "Hyundai", "Maruti", "Toyota", "Hyundai", "Maruti")
Model <- c("Corolla", "i20", "Alto", "Camry", "i10", "Baleno", "Fortuner", "Sonata", "Astra")
Sales <- c(345, 800, 2000, 150, 200, 350, 50, 68, 120)

CarData <- data.frame(Make, Model, Sales)
CarData

TopSales <- subset(CarData, Sales>300)

Sorted_TopSales <- TopSales[order(-TopSales$Sales),]

Sorted_TopSales

IDX_POS <- which(CarData$Sales > 300)

CarSale_GT_300 <- CarData[IDX_POS,]

CarSale_GT_300

CarSale_LT_300 <- CarData[-IDX_POS,]
CarSale_LT_300

Max_Sale_Model <- CarData$Model[which.max(CarData$Sales)]

Max_Sale_Model

library(dplyr)

Car_Models <- select(CarData, Model)
Car_Models

Sales_GT_500 <- filter(CarData, Sales> 500)

Sales_GT_500

Sorted_CarData <- arrange(CarData, desc(Sales))
Sorted_CarData

CarData <- mutate(CarData, Perc_Tot_Sales = (100*Sales)/(sum(Sales)))
CarData

Sale_Summary <- summarise(CarData, avg_sales = mean(Sales),
                          min_sales = min(Sales),
                          max_sales = max(Sales),
                          total_Sales= sum(Sales))
Sale_Summary

Mf_Avg_Sales <- CarData %>% group_by(Make) %>% summarise(Avg_Sales = mean(Sales))

Mf_Avg_Sales

