##### Why do EDA? ############
# Understand data properties
# Find patterns in data
# Suggest modeling strategies
# “Debug” analyses




bike_buyers = read.csv("assets/bike_buyers.csv")


#### Get high level overview of data ####
str(bike_buyers)
summary(bike_buyers)
class(bike_buyers)

View(bike_buyers)
head(bike_buyers)

## QUESTION: do you need to adjust anything at this point? data types, structure of data, etc




# if we wanted to avoid converting strings to factors, how would we do that?


######################### NOTES #########################
#### Examine univariate data ####
## univariate data = samples of one variable
## univariate data analysis isn't concerned with the 'why'. It is just to describe the data as is.
## discrete variables vs continuous variables
### discrete = an example is a die. It can only be the numbers 1 - 6.
### continuous = an example is weight. It can be just about any number (within reason). It has no limits.


## two key things to discover in EDA: central tendency, spread
### central tendency: what is a common value? what's the value around which the data is centered?
### spread: how variable are the data points?

## Types of graphs to use:
# box plot
# histogram
# density plot
# pie graph


######################### NOTES #########################


## INCOME: discrete or continouous? continuous.

## central tendency
summary(bike_buyers$Income)
boxplot(bike_buyers$Income)

## spread
hist(bike_buyers$Income)
plot(density(bike_buyers$Income), main="Income Density Spread")
?density

pairs(bike_buyers)


## EDUCATION: categorical, so it's discrete
summary(bike_buyers$Education)
plot(bike_buyers$Education)



## MARITAL STATUS: categorical, discrete
summary(bike_buyers$Marital.Status)
plot(bike_buyers$Marital.Status)

pie(table(bike_buyers$Marital.Status), main="Married vs Single Buyers")
?table
?pie

## CHILDREN

# change to factor
bike_buyers$Children = factor(bike_buyers$Children)
summary(bike_buyers$Children)
plot(bike_buyers$Children, xlab = "Num. of Children", ylab="Frequency")

# what about those who bought a bike, specifically?
library("dplyr")
bought = filter(bike_buyers, Purchased.Bike == "Yes")
plot(bought$Children)

# CLASS WORK: what is the most common commute distance? Visualize it
# Did more people buy bikes or not buy bikes?

summary(bike_buyers$Commute.Distance)
plot(bike_buyers$Commute.Distance)


summary(bike_buyers$Purchased.Bike)
plot(bike_buyers$Purchased.Bike)

# you might ask yourself, what kind of people bought bikes?


######################### NOTES #########################
#### Examine multivariate data ####
### Three broad classes of multivariate analysis:
# 1) The relationship between one categorical variable and one continuous variable
# 2) The relationship between two categorical variables
# 3) The relationship between two continuous variables

## You're wanting to find relationships between variables
## You aren't worried about the WHY right now, just the WHAT

## Types of graphs to use:
# scatter plot

######################### NOTES #########################

####################################### categorical & continuous 

## compare education to income
?by
?boxplot
by(bike_buyers$Income, bike_buyers$Education, summary)
by(bike_buyers$Income, bike_buyers$Education, mean)
by(bike_buyers$Income, bike_buyers$Education, median)




boxplot(bike_buyers$Income~bike_buyers$Education, notch=TRUE,col=c("grey","gold","grey","grey","grey"), main="Income distribution among education levels")


library(sm)
sm.density.compare(bike_buyers$Income, bike_buyers$Education, xlab="Income")
?sm.density.compare
# no legend...hm....
education_legend = factor(bike_buyers$Education, labels = c("Bachelors", "Graduate Degree", "High School", "Partial College", "Partial High School")) 

colfill<-c(2:(2+length(levels(education_legend)))) 
legend(locator(1), levels(education_legend), fill=colfill)



####################################### categorical & categorical
# bought a bike vs commute distance
?xtabs
xtabs(~Education+Purchased.Bike, bike_buyers)
plot(xtabs(~Education+Purchased.Bike, bike_buyers), main="Bike Buyers and Education Levels")

xtabs(~Occupation+Purchased.Bike, bike_buyers)
plot(xtabs(~Occupation+Purchased.Bike, bike_buyers), main="Bike Buyers and Occupation")

## what if you want to drill down into the details?

library(gmodels)
?CrossTable

CrossTable(x=bike_buyers$Education, bike_buyers$Purchased.Bike, chisq = TRUE, prop.t = FALSE)
CrossTable(x=bike_buyers$Occupation, bike_buyers$Purchased.Bike, chisq = TRUE, prop.t = FALSE)

## use chi-sq to find p-value, which will show significance
## p-value > 0.05 is NOT significant



####################################### continuous & continuous
str(bike_buyers)

scatter.smooth(bike_buyers$Age, bike_buyers$Income)

# let's use a better dataset
cars = mtcars
scatter.smooth(cars$mpg, cars$hp, xlab="MPG", ylab="Number of Horses")


####################################### descriptive models
library(help="datasets")

## single variables
head(faithful)
# x first, y second
plot(faithful$eruptions, faithful$waiting, xlab="Eruption Duration", ylab="Time Waited", main="Eruption Analysis")

# y first, x second
?lm
lm(faithful$eruptions ~ faithful$waiting)

# add to most recent graph
abline(lm(faithful$waiting~faithful$eruptions), col="red")



## multiple variables
head(airquality)
plot(airquality$Ozone, airquality$Temp)
abline(lm(airquality$Temp ~ airquality$Ozone), col="red")

lm(data = airquality[,c(1,3,4)])

summary(lm(data = airquality[,c(3,1,4)]))


plot(bike_buyers$Children, bike_buyers$Income)
abline(lm(bike_buyers$Income ~ bike_buyers$Children),col="red")

summary(lm(bike_buyers$Income ~ bike_buyers$Children))

# when you have tons of numeric variables
?pairs
pairs(airquality)

library(ggplot2)
??plotmatrix
plotmatrix(with(airquality))

####################################### what's next? Prepare for predictive modeling

## tests of significance to see which variables you will want to use

#### Continuous Variables Significance ####

# covariance indicates positive or negative relationship between the two variables
# this is hard to compare if the two variables have different metrics
cov(cars$mpg, cars$hp)

# Pearson's Correlation (or just correlation), standardizes the metric for both variables by using standard deviations
# will always range from -1 to 1
# pearson, used for LINEAR tests
# spearmans & kendall, non-linear tolerant but not the best for non-linear relationships
cor.test(cars$mpg, cars$hp, method="pearson")
cor.test(cars$mpg, cars$hp, method="spearman")

library(ggplot2)
qplot(cars$mpg, cars$hp, data=mtcars, geom=c("point", "smooth"))
?qplot










