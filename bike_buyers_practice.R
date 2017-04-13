## author: James Dayhuff, Winter 2017 ##
## course: Data Analytics in R ##



#### Practice on dataset ####

bike_buyers = read.csv("assets/bike_buyers.csv")

## run these commands, talk with a neighbor about what you learn
class(bike_buyers)
str(bike_buyers)
summary(bike_buyers)

## What data structure is it and how would you explain that structure?
## Do the data types make sense?
## What do you learn from summary?


## What are some interesting questions we could ask this data?



## PRACTICE SUBSETTING
# get all married observations

married_buyers = bike_buyers[which(bike_buyers$Marital.Status=="Married"),]
## don't forget the comma!

## get all observations which attended high school and the observations which attended partial college
hs_or_partial_col = bike_buyers[which(bike_buyers$Education == "High School" | bike_buyers$Education == "Partial College"),]


## get all observations who own 3 cars or more
cars_plus_3 = bike_buyers[which(bike_buyers$Cars>=3),]

cars_plus_3 = subset(bike_buyers, Cars >= 3 & Marital.Status == "Married")













