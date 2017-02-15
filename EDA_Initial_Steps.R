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


## three key things to discover in EDA: frequency distribution, central tendency, spread

## income: discrete or continouous? continuous.
hist(bike_buyers$Income)








M = cor(mtcars)
corrplot(M, method="square")
mtcars
