cat("\014")
rm(list=ls())

#practical on data standardization and data preparation

person <- read.csv("file1-1.txt",header=FALSE,col.names=c("age","height"),row.names=NULL,sep=" ",stringsAsFactors = FALSE)
person

str(person)
#convert height as numeric column
person$height <- as.numeric(person$height)
str(person)

# data preprocessing,
#1. read the data with readlines character
#2. select lines containing data character
#3. split lines into seperate fields list of character vectors
#4. standardize rows list of equivalent vectors
#5. transform to data.frame 
#6. normalize and coerce to correct type

txt <- readLines("dalton.txt")
txt

#detect lines starting with a percentage sign
I <- grepl("^%",txt)

dat <- txt[!I]
dat

#split lines
fieldList <- strsplit(dat,split=",")
fieldList

#standardize rows, every row should contain in order that name, birth year, death year
assignFields <- function(x){
  out<- character(3)
  #get names
  i<-grepl("[[:alpha:]]",x)
  out[1]<-x[i]
  #get birth year (if any)
  i<- which(as.numeric(x)<1890)
  out[2] <- ifelse(length(i)>0,x[i],NA)
  #get death year (if any)
  i<- which(as.numeric(x)>1890)
  out[3]<- ifelse(length(i)>0,x[i],NA)
  return(out)
}

  
standardFields <- lapply(fieldList,assignFields)
standardFields


#step5. coerce to dataframe

#create a matrix from list
(M <- matrix(
  unlist(standardFields)
  , nrow = length(standardFields)
  , byrow = TRUE
))

colnames(M)<- c("name","birth","death")
#populate data frame

daltons <- as.data.frame(M,stringsAsFactors = FALSE)
daltons

#normalize to correct data types

daltons$birth <- as.numeric(daltons$birth)
daltons$death <- as.numeric(daltons$death)
daltons

#handling of NA's while doing EDA

Age_vec <- c(23,16,NA)
Mean_Age <- mean(Age_vec)
Mean_Age


#by pass NA's
Mean_Age <- mean(Age_vec,na.rm=TRUE)
Mean_Age

#how many rows have NA's
NA_row_count <- nrow(daltons) - sum(complete.cases(daltons))
NA_row_count

#how to remove rows having NA
Goodrows<- na.omit(daltons)
Goodrows

Age_vec[is.na(Age_vec)]<- Mean_Age
Age_vec
