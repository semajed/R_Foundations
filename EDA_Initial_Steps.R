library(dplyr)

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



## EDUCATION: categorical, so it's discrete
summary(bike_buyers$Education)
plot(bike_buyers$Education)



## MARITAL STATUS: categorical, discrete
summary(bike_buyers$Marital.Status)
plot(bike_buyers$Marital.Status)

pie(table(bike_buyers$Marital.Status), main="Married vs Single Buyers")
?table
?pie


# CLASS WORK: how far do these people commute?
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






####################################### continuous & continuous
str(bike_buyers)

# let's use a better dataset
cars = mtcars
scatter.smooth(cars$mpg, cars$hp, xlab="MPG", ylab="Number of Horses")





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



#### Categorical Variables Significance ####

# testing a single variable against another single variable
purchase_to_edu = table(bike_buyers$Purchased.Bike, bike_buyers$Education)
chisq.test(purchase_to_edu)
?chisq.test










