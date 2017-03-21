##### Why do EDA? Exploratory Data Analysis ############
# Understand variables
# Find patterns in data
# Suggest modeling strategies

## Univariate Analysis
## Multivariate Analysis





bike_buyers = read.csv("assets/bike_buyers.csv")


#### Get high level overview of data ####
str(bike_buyers)
summary(bike_buyers)
class(bike_buyers)

View(bike_buyers)
head(bike_buyers)

## QUESTION: do you need to adjust anything at this point? data types, structure of data, etc

library("dplyr")
bike_buyers = select(bike_buyers, -ID)
summary(bike_buyers)




######################### NOTES #########################
#### Examine univariate data ####
## univariate data = samples of one variable
## univariate data analysis isn't concerned with the 'why'. It is just to describe the data as is.
## discrete variables vs continuous variables
### discrete = an example is a level of education within this dataset. It has a limited set of values.
### continuous = an example is income. It can be just about any number.


## two key things to discover in EDA: central tendency, spread
### central tendency: what is a common value? what's the value around which the data is centered?
### spread: how varied are the data points?

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
density(bike_buyers$Income)
?density

## EDUCATION: categorical, so it's discrete
summary(bike_buyers$Education)
plot(bike_buyers$Education)



## MARITAL STATUS: categorical, discrete
summary(bike_buyers$Marital.Status)
plot(bike_buyers$Marital.Status)
pie(bike_buyers$Marital.Status, main="Married vs Single Customers")
?pie
table(bike_buyers$Marital.Status)

pie(table(bike_buyers$Marital.Status), main="Married vs Single Buyers")
?table
?pie

## CHILDREN
summary(bike_buyers$Children)
plot(bike_buyers$Children)






## is it the right data type? Probably not. We want more of a "count" for each number of children


# change to factor
bike_buyers$Children = factor(bike_buyers$Children)
summary(bike_buyers$Children)
plot(bike_buyers$Children, xlab = "Num. of Children", ylab="Frequency",main="my graph")

# what about those who bought a bike, specifically?
library("dplyr")
bought = filter(bike_buyers, Purchased.Bike == "Yes")
plot(bought$Children, main = "Purchased Bikes yes, num children")

# MINI CHALLENGE: 
# What is the most common commute distance? Visualize it!
# Did more people buy bikes or not buy bikes? Visualize it!

summary(bike_buyers$Commute.Distance)
plot(bike_buyers$Commute.Distance)


summary(bike_buyers$Purchased.Bike)
plot(bike_buyers$Purchased.Bike)











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
# density plots
# box plots

######################### NOTES #########################









####################################### categorical & continuous 

## compare education to income
?by
by(bike_buyers$Income, bike_buyers$Education, summary)
by(bike_buyers$Income, bike_buyers$Education, mean)
by(bike_buyers$Income, bike_buyers$Education, median)



?boxplot
boxplot(bike_buyers$Income~bike_buyers$Education, notch=T,col=c("grey","green","grey","grey","grey"), main="Income distribution among education levels")

?sm
library(sm)
sm.density.compare(bike_buyers$Income, bike_buyers$Education, xlab="Income")
?sm.density.compare

# no legend...hm....
education_legend = factor(bike_buyers$Education, labels = c("Bachelors", "Graduate Degree", "High School", "Partial College", "Partial High School")) 

colfill<-c(2:(2+length(levels(education_legend)))) 
legend(locator(1), levels(education_legend), fill=colfill)



####################################### categorical & categorical
# bought a bike vs education
?xtabs
xtabs_bike = xtabs(~Education+Purchased.Bike, bike_buyers)
plot(xtabs_bike, main="Bike Buyers and Education Levels")

# bought a bike vs occupation
xtabs(~Occupation+Purchased.Bike, bike_buyers)
plot(xtabs(~Occupation+Purchased.Bike, bike_buyers), main="Bike Buyers and Occupation")

## what if you want to drill down into the details?

library(gmodels)
?CrossTable

CrossTable(bike_buyers$Education, bike_buyers$Purchased.Bike, chisq = TRUE, prop.t = F)
CrossTable(bike_buyers$Occupation, bike_buyers$Purchased.Bike, chisq = TRUE, prop.t = F)

## use chi-sq to find p-value, which will show significance
## p-value > 0.05 is NOT significant

### MINI CHALLENGE (time permitting)
## Explore the relationship between Purchased.Bike and another categorical variable of your choice (like commute distance)


####################################### continuous & continuous
str(bike_buyers)

?scatter.smooth
scatter.smooth(bike_buyers$Age, bike_buyers$Income, main="Income to Age Relationship")

# let's use a better dataset
library(datasets)
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










