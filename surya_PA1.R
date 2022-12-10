vtr = c(1,3,5,7,9)
vtr1<-c("Hi","Hello","hey")
vtr2 <- c(2,4,6,8,10)
print(vtr1)

list1<-list("hi",5,9.5,TRUE)
print(list1[2])

matrix1<-matrix(c(vtr,vtr2),5,2)
print(matrix1)

emp_id=c(1:3)
emp_name=c("rick","dan","ryan")
salary=c(80000,100000,150000)
emp_data = data.frame(emp_id,emp_name,salary)
print(emp_data)
