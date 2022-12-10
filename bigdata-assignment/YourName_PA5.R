person <- read.csv("file1-1.txt")
person

person <- read.csv("file1-1.txt", header = FALSE, col.names = c("age", "height"), row.names = NULL, sep = "")
person
str(person)

person$height <- as.numeric(person$height)
str(person)

txt <- readLines("dalton.txt")
txt

I <- grepl("^%", txt)
dat <- txt[!I]
dat

fieldList <- strsplit(dat, split = ",")
fieldList


assignFields <- function(x){
  out <- character(3)
  
  i <- grepl("[[:alpha:]]", x)
  out[1] <- x [i]
  
  i <- which(as.numeric(x) < 1890)
  out[2] <- ifelse(length(i)>0, x[i], NA)
  
  i <- which(as.numeric(x) > 1890)
  out[3] <- ifelse(length(i)>0, x[i], NA)
  return(out)
}

standardFields <- lapply(fieldList, assignFields)
standardFields

(M <- matrix(
  unlist(standardFields),
  nrow = length(standardFields),
  byrow = TRUE
))

colnames(M) <- c("name", "birth", "death")
daltons <- as.data.frame(M, stringsAsFactors = FALSE)


daltons$birth <- as.numeric(daltons$birth)
daltons$death <- as.numeric(daltons$death)

Age_Vec <- c(23, 16, NA)
Mean_Age <- mean(Age_Vec)
Mean_Age

NA_row_count <- nrow(daltons) - sum(complete.cases(daltons))
NA_row_count

Good_Rows <- na.omit(daltons)
Good_Rows

Age_Vec <- c(23, 16, 15, 26, 19, NA)
Mean_Age <- mean(Age_Vec, na.rm = TRUE)
Mean_Age

Age_Vec[is.na(Age_Vec)]<- Mean_Age
Age_Vec