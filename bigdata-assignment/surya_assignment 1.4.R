# Give the name credit to the Credit_Rev.csv .

credit <- read.csv("Credit_Rev.csv")
credit$default <- ifelse(credit$default=="YES",1,0)
# Plot the variables to understand the correlation.

hist(credit$balance) # data in right skewed
plot(credit$balance, credit$income) # balance and income has no correlation 
plot(credit$Age, credit$income) # No relation 
plot(credit$Age, credit$balance)

# Fit a simple logistic regression model of the above (Default Vs Student & Balance & Age & Income)
student <- glm(default ~ student, data = credit, family = "binomial")
balance <- glm(default ~ balance, data = credit, family = "binomial")
income <- glm(default ~ income, data = credit, family = "binomial")
age <- glm(default ~ Age, data = credit, family = "binomial")


# Identify the 𝛃0 (Y - intercept) + 𝛃1(slope estimate).
# Use the summary values of p, AIC, etc.. to diagnose the model.
summary(student)
summary(balance)
summary(income)
summary(age)

# find the confidence interval of the fit.

new.dat = data.frame(student = "Yes")
predict(student, newdata = new.dat, interval = 'confidence')
    # 1 
    # -26.56607 

# Compare the first four model of this assignment with a  multi logistic regression model of Default Vs Student + Balance + Age
multfit <- glm(default ~ student + balance + income + Age, data = credit, family = "binomial")

# What do you infer?
  # Not conversing at all even after applying multiple features

# Predict the outcome (whether the person will default or not) using student + balance + age + income based on classification with reference to the multi Logistic Regression model.
testdata = data.frame(
  student = c("No", "Yes", "Yes", "No", "No", "No"),
  balance = c(1500, 1000, 2000, 2500, 1600, 1900),
  Age = c(34, 82, 71, 36, 68, 77),
  income = c(10000, 18000, 21000, 37000, 40000, 24000)
)
predict(multfit, testdata)
    # predict
    # 1         2         3         4         5         6 
    # -26.56607 -26.56607 -26.56607 -26.56607 -26.56607 -26.56607