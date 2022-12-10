data <- read.csv("bank_data.csv", header = T)

View(data)

names(data)

colnames(data)[1] <- "age"
names(data)
dim(data)

str(data)

class(data)

head(data, n = 5)

tail(data, n = 5)


library(Hmisc)
library(pastecs)
library(psych)
library(dplyr)

summary(data)

var <- c("age", "marital", "education", "housing")
eda_data <- select(data, var)
names(eda_data)

summary(eda_data$age)

describe(eda_data$age)

stat.desc(eda_data$age)

hist(eda_data$age, main= "Histogram", xlab= "Age in Years")

boxplot(eda_data$age, main = toupper("Boxplot of age"))

d <- density(eda_data$age)
plot(d, main = "kernal density of age")
polygon(d, col= "red", border = "blue")

PCData <- read.csv(file = "PC_SALES-6.csv")
summary(PCData)
edit(PCData)

str(PCData)

tail(PCData, n = 2)
PCData[2:4, ]
PCData[2:4, 1:3]
PCData[2:4, c(1,3)]

mean(PCData$Units_Shipped_Q1_2016)

with(PCData, mean(PCData$Units_Shipped_Q1_2016))

length(PCData$Units_Shipped_Q1_2016)
PCData$Company[[which.max(PCData$Units_Shipped_Q1_2016)]]

mat1 <- matrix(rep(seq(4), 4), ncol = 4)
mat1

apply(mat1, 1, sum)
apply(mat1, 2, sum)

apply(mat1, 1, function(x) sum(x) + 2)

mat1.df <- data.frame(mat1)
mat1.df

lapply(mat1.df, sum)

y <- lapply(mat1.df, sum)

is.list(y)

y1 <- lapply(mat1.df, function(x, y) sum(x) + y, y = 5)
y1
y1[1:2]

y2 <- sapply(mat1.df, function(x, y) sum(x) + y, y = 5)
y2

is.vector(y2)
