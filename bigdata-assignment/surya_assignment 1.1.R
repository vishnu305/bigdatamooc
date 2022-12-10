# import data
data <- read.csv("BloombergData.csv")

# 1) Complete the following questions
# 
# Find the NA’s in the data and omit them from the analysis
# class() : structure of the data such as matrices or vector or dataframe
# dim(): to quickly reveal, the number of columns, i.e. variables and the rows i.e observations
# str(): datatype
# head(): top 5 rows & columns
# tail(): Bottom 5 rows & columns

sum(is.na(data))
data <- na.omit(data)

class(data)

dim(data)

str(data)

head(data, 5)

tail(data, 5)

# 2) Convert datatypes of the following:
# 
#   INDUSTRY_SECTOR & INDUSTRY_GROUP to Factors
#   CEO start date to default format yyyy - mm - dd

data$INDUSTRY_SECTOR <- as.factor(data$INDUSTRY_SECTOR)
data$INDUSTRY_GROUP <- as.factor(data$INDUSTRY_GROUP)

data$CEO_START_DATE <- gsub("-", "/", data$CEO_START_DATE)

# 3) Check the class of the following after converting:
#   
#   INDUSTRY_SECTOR & INDUSTRY_GROUP
# CEO start date

class(data$INDUSTRY_GROUP)
class(data$INDUSTRY_SECTOR)
class(data$CEO_START_DATE)

# 4) Summary of the dataset
# 
# Using the summary statistics of market cap (CUR_MKT_CAP). Use the logical conditions as below & impute a variable (Com_Classification):
#   1.Minimum to first quartile: Small cap
# 
# 2.First quartile to median: Mid cap
# 
# 3.Above median: Large cap

summary(data$CUR_MKT_CAP)
data$Com_Classification <- data$CUR_MKT_CAP
data$Com_Classification[data$CUR_MKT_CAP < 12892926310] <- "Small cap"
data$Com_Classification[data$CUR_MKT_CAP > 12892926310 & data$CUR_MKT_CAP < 21776721656] <- "Mid cap"
data$Com_Classification[data$CUR_MKT_CAP > 21776721656] <- "Large cap"

# 5) Impute a variable (Ous_Shares) for outstanding shares of each company: Market cap (CUR_MKT_CAP) / share price (PX_last)
data$Ous_Shares<- data$CUR_MKT_CAP/data$PX_LAST 

# 6) Subset / select data of companies whose CEO_start_date >= 2001 (after dotcom bubble)
data2 <- subset(data, data$CEO_START_DATE>=2001)

# 7) Aggregate data for the following
# 
# 1.CUR_MKT_CAP , INDUSTRY_SECTOR and Com_Classification
# 
# 2.Ous_Shares, INDUSTRY_SECTOR & Com_Classification

aggregate(CUR_MKT_CAP~INDUSTRY_SECTOR+Com_Classification, data, mean)
aggregate(Ous_Shares~INDUSTRY_SECTOR+Com_Classification, data, mean)

# 8) Data Visualization using Bloomberg data.
# 
# plot histogram & density of the market cap (CUR_MKT_CAP) & share prices (PX_last).
# Classify the histogram & density based on small, mid & large cap (Variable:COM_Classification).
# Box plot to understand the statistics of outstanding shares in each category small, mid & large cap (Variable:COM_Classification)
# Scatter plot to understand correlation between share price Vs Market cap
# Also classify this based on small, mid & large cap (Variable:COM_Classification).
# Bar chart (Stack or dodge) to find out number of companies in small, mid & large cap.

hist(data$CUR_MKT_CAP)
plot(data$PX_LAST, main = "Density plot")
scatter.smooth(data$PX_LAST, data$CUR_MKT_CAP)


