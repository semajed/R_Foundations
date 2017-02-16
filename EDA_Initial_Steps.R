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



#### Examine univariate data ####
## univariate data = samples of one variable
## univariate data analysis isn't concerned with the 'why'. It is just to describe the data as is.
## discrete variables vs continuous variables
### discrete = an example is a die. It can only be the numbers 1 - 6.
### continuous = an example is weight. It can be just about any number (within reason). It has no limits.


## two key things to discover in EDA: central tendency, spread
### central tendency: what is a common value? what's the value around which the data is centered?
### spread: how variable are the data points?

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

summary(bike_buyers$Commute.Distance)
plot(bike_buyers$Commute.Distance)

commute_table = table(bike_buyers$Commute.Distance)
plot(density(commute_table), main="Commute Distance Spread")



#### Examine multivariate data ####



## compare educations to income
library(sm)
sm.density.compare(bike_buyers$Income, bike_buyers$Education, xlab="Income")
?sm.density.compare
# no legend...hm....
education_legend = factor(bike_buyers$Education, labels = c("Bachelors", "Graduate Degree", "High School", "Partial College", "Partial High School")) 

colfill<-c(2:(2+length(levels(education_legend)))) 
legend(locator(1), levels(education_legend), fill=colfill)


M = cor(mtcars)
corrplot(M, method="square")
mtcars
