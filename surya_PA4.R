#clean the console
cat("\014")
#clear all the variables
rm(list=ls())

#install.packages("Hmisc")
#install.packages("pastecs")
#install.packages("psych")

data <- read.csv("bank_data.csv",header=T)
#to view the dataset in the form of table
View(data)
#to print the column names
names(data)
# to change any column name
colnames(data)[1] <- "age"
names(data)
#dimension of data
dim(data)
#structure of data
str(data)
#type of data
class(data)
#head of data
head(data,n=5)
#tail of data
tail(data,n=5)

# univariate statistics 
#load packages

library(Hmisc)
library(pastecs)
library(psych)
library(dplyr)
#summary of data
summary(data)

#choose subset for EDA

var <- c("age","marital","education","housing")
eda_data <- select(data,var)
names(eda_data)

summary(eda_data$age)

#describe function gives us all statistical values 
describe(eda_data$age)

stat.desc(eda_data$age)

#graphical views histogram

hist(eda_data$age,main="Histogram of age",xlab="Age in years")

# box plot

boxplot(eda_data$age,
        main=toupper("Boxplot of Age"),
        ylab="Age in years",
        col="blue")

#kernel density plot

d <- density(eda_data$age)
plot(d,main = "kernel density of age")
polygon(d, col="red",border="blue")

#descriptive statistics

pcdata = read.csv(file="PC_Sales.csv",header=T,sep=',')
head(pcdata,n=5)

summary(pcdata)

#data editor for data
edit(pcdata)

pcdata[2:4,]

#mean of a particular column

mean(pcdata$Units_Shipped_Q1_2016)

#another way to getting mean
with(pcdata, mean(pcdata$Units_Shipped_Q1_2016))

median(pcdata$Units_Shipped_Q1_2016)
#variance
var(pcdata$Units_Shipped_Q1_2016)
#standard deviation
sd(pcdata$Units_Shipped_Q1_2016)
#maximum
max(pcdata$Units_Shipped_Q1_2016)
#range
range(pcdata$Units_Shipped_Q1_2016)
#quantile 25%
quantile(pcdata$Units_Shipped_Q1_2016)
#number of observations
length(pcdata$Units_Shipped_Q1_2016)

#max value using which
pcdata$Company[[which.max(pcdata$Units_Shipped_Q1_2016)]]


# rep function used for repeating a sequence 

mat1 <- matrix(rep(seq(4),4),ncol=4)
mat1

#apply function
# each row sum
apply(mat1,1,sum)
#each column sum
apply(mat1,2,sum)

#inline function and apply function
#this function will sum every row and adds 2 to it
apply(mat1, 1, function(x) sum(x)+2)

# lapply function
mat1.df <- data.frame(mat1)
mat1.df
# now a list is returned which is having sum of row values
lapply(mat1.df,sum)

#apply function on two variables
y1 <- lapply(mat1.df,function(x,y) sum(x)+y,y=5)
y1
# the above function does is sums every column and adds 5

#sapply to return result in form a vector
y2 <- sapply(mat1.df,function(x,y) sum(x)+y,y=5)
y2

#tapply
#considering inbuilt dataset iris
head(iris)
uniquespeciescnt <- length(unique(iris$Species))
uniquespeciescnt

uniquespecies <- unique(iris$Species)
uniquespecies

#find mean sepallength of setosa, versicolor, virginica seperately

tapply(iris$Sepal.Length,iris$Species, mean)
