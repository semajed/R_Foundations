
#### Practice on a real dataset ####

bike_buyers = read.csv("assets/bike_buyers.csv")

## run these commands, talk with a neighbor about what you learn
class(bike_buyers)
str(bike_buyers)
summary(bike_buyers)

## What data structure is it and how would you explain that structure?
## Do the data types make sense?
## What do you learn from summary?


## What are some interesting questions we could ask this data?


## PULL THE INCOME VARIABLE INTO IT'S OWN VECTOR
income = bike_buyers$Income
# why get a single variable? You can start early analysis on it. We'll go over this more later.

hist(income)




## PRACTICE SUBSETTING
# get all married observations

married_buyers = bike_buyers[which(bike_buyers$Marital.Status=="Married"),]
## don't forget the comma!

## get all observations which attended high school and the observations which attended partial college
hs_or_partial_col = bike_buyers[which(bike_buyers$Education == "High School" | bike_buyers$Education == "Partial College"),]


## get all observations who own 3 cars or more
cars_plus_3 = bike_buyers[which(bike_buyers$Cars>=3),]














