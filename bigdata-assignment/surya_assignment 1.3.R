# load data
data("mtcars")
cars <- mtcars

# Plot miles per gallon (mpg) Vs horsepower (hp) to understand the correlation.
plot(cars$mpg, cars$hp)



# Fit a simple linear regression model of the above (mpg Vs horsepower) to analyze 
fit <- lm(formula = mpg ~ hp, data = cars)



# Identify the 𝛃0 (Y - intercept) + 𝛃1 (slope estimate).
# Use the summary values of t, p, R2, Residual standard error, etc.. to diagnose the model.

summary(fit)
confint(fit)



# find the confidence interval of the fit.
new.dat <- data.frame(hp=30)
predict(fit, newdata = new.dat, interval = 'confidence')
    # confidence interval
    # fit      lwr      upr
    # 28.05201 25.26627 30.83776



# Using the following unknown dataset, predict the mileage given the horsepower based on linear regression. 
testdata <- data.frame ( hp = c(126, 167, 189, 211, 272, 312))
predict(fit, newdata = testdata)
    # predicted value
    # 21.502098 18.704738 17.203716 15.702694 11.540769  8.811638 



# Plot miles per gallon (mpg) Vs horsepower (hp) Vs weight (wt) of the car

par(mfrow = c(2,2))
plot(mpg ~ wt, xlab="Weight (in thousand of pounds)", ylab="MPG", main="MPG by Car Weight", mtcars)
abline(lm(mpg ~ wt, data = mtcars))

plot(mpg ~ hp, xlab="Horsepower", ylab="MPG", main="MPG by Horsepower", mtcars)
abline(lm(mpg ~ hp, data = mtcars))

plot(hp ~ wt, xlab="Weight", ylab="hp", main="horsepower by car weight", mtcars)
abline(lm(mpg ~ hp, data = mtcars))


# Fit a multilinear regression model of the above (mpg Vs horsepower + wt) 
multfit <- lm(formula = mpg ~ hp + wt, data = cars)


# Identify the 𝛃0 (Y - intercept) + 𝛃1 , 𝛃2(slope estimate).
# Use the summary values of t, p, R^2, Residual standard error, etc.. to diagnose the model.

summary(multfit)
confint(multfit)


# find the confidence interval of the fit

new.dat <- data.frame(hp=126, wt=1)
predict(multfit, newdata = new.dat, interval = 'confidence')
    # confidence interval
    # fit      lwr      upr
    # 29.34605 26.55073 32.14137


# Compare this with multilinear model Vs mpg =  𝛃0+𝛃1*hp+𝛃2*wt+𝛃3*hp*wt (create a model with interaction).

cars$hpwt = cars$hp * cars$wt
multfit2 <- lm(formula = mpg ~ hp + wt + hpwt, data = cars)



# what do you infer?
    # Ans That Creating new features from already used ones help model to fit more easily.

# find the confidence interval of the fit

new.dat <- data.frame(hp=126, wt=1, hpwt = 126)
predict(multfit2, newdata = new.dat, interval = 'confidence')
    # confidence interval
    # fit     lwr     upr
    # 29.9678 27.6192 32.3164


#Which of the model performs better?
# Ans. One with more features, multfit2 then multfit and then simple linear as analysed through R square.

# Predict the miles [per gallon based on multilinear regression models 1&2  (interaction)]
testdata2 <- data.frame ( hp = c(126, 167, 189, 211, 272, 312), wt = c(1.5, 2.2, 2.9, 3.2, 3.8, 4.2))
predict(multfit, testdata2)
testdata2$hpwt <- testdata2$hp * testdata2$wt
predict(multfit2, testdata2)
    # prediction multfit
    # 1        2        3        4        5        6 
    # 27.40713 23.38996 19.97647 18.11412 13.84927 11.02722 
    # multfit2
    # 1        2        3        4        5        6 
    # 27.61392 21.90621 18.54449 16.97675 14.70133 14.31896 

