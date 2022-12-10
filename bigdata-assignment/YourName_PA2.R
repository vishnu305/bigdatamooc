Car_Data <- read.csv(file = "CarSales.csv")

Car_Data

TopSales <- subset(Car_Data, Sales>300)

Sorted_TopSales <- TopSales[order(-TopSales$Sales),]

Sorted_TopSales

write.table(Sorted_TopSales, file = "Sorted_Top_Sales.csv", sep = ".", row.names = FALSE)


Vec1 <- c(15,2,32,45,50)

ifelse(Vec1 == 2,1,0)

TestVec = c(5,9,2,3)
ResultVec <- ifelse(TestVec %% 2 == 0, "even", "odd")

ResultVec

paste("a", "b")
paste("Hello", "World", sep="_")

String1 <- c("hello", "world")
paste(String1)

paste(String1, collapse = " ")
paste(String1, collapse = "")

Vec1 <- c(1, 2, 3, NA, 4, 5, NA, NA)

is.na(Vec1)

No_Null_Vec <- Vec1[!is.na(Vec1)]

No_Null_Vec

Vec1[is.na(Vec1)] <- 0

Vec1

df1 = data.frame(CustomerId = c(1:6), Product = c(rep("Toaster", 3), rep("Radio", 3)))
df2 = data.frame(CustomerId = c(2, 4, 6), State = c(rep("Alabama", 2), rep("Ohio", 1)))
df1
df2

Inner_Merged <-merge(x = df1, y = df2,by = "CustomerId")
Inner_Merged

Outer_Merged <- merge(x = df1, y= df2, by = "CustomerId", all=TRUE)
Outer_Merged

L_Outer_Merged <- merge(x = df1, y= df2, by = "CustomerId", all.x = TRUE)
L_Outer_Merged


R_Outer_Merged <- merge(x = df1, y= df2, by = "CustomerId", all.y = TRUE)
R_Outer_Merged

ls()
rm(list = ls())
y.vector = runif(20)

ls()
save(y.vector, file = "yvec.saved")
rm(y.vector)
ls()

load("yvec.saved")
class(ls())

y.vector
class(y.vector)

x<-"a"

rm(list= c("x", "y.vector"))

ls()

Gender <- c("male", "male", "female", "male", "female")

Mstatus <- c("Married", "Single", "Married", "Single", "Married")

table(Gender)

table(Gender, Mstatus)

for(i in 1:5){
  print(i)
}

for(j in 1:5){
  j
}

j

i <- 1:5

for(j in i){
  print(j)
}

x<- 0
while(x < 5){
  print(x<- x+1)
}


y<- 0 
repeat{
  print(y<-y+1)
  if(y>5){
    break
  }
}

Hello_World <- function(){
  print("Hello World")
  return(0)
}

Hello_World()

Sum_Two_Nos <- function(a,b){
  sum2 <- a+b
  print(paste("Sum is", sum2))
}

ReturnVal <- Sum_Two_Nos(5, 10)
ReturnVal

Compute_mean_std_Tot <- function(x, y){
  Tot<- x+y
  mu <- mean(x+y)
  sigma <- sd(x+y)
  return(list(mean = mu, stand_dev=sigma, Totals = Tot))
}

Vec1 <- c(1,2,3,4,5)
Vec2 <- c(1,2,3,4,5)

answer <- Compute_mean_std_Tot(Vec1, Vec2)

answer