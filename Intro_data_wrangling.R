
library("tidyr")



## What is tidy data? ##

## GROUND RULES FOR HOW R WORKS WITH DATASETS BEST ##
## 1) Each variable in the data set is placed in its own column
## 2) Each observation is placed in its own row
## 3) Each value is placed in its own cell



######### TIDYR ###########
## This package helps you get your data to R specs
## gather(), separate(), unite(), spread()
## both rely on key value pairs

### GATHER FUNCTION ###
?gather

messy1 = data.frame(
  name = c("Wilbur", "Petunia", "Gregory"),
  a = c(67, 80, 64),
  b = c(56, 90, 50),
  c = c(99, 30, 40)
)
messy1
plot(messy1)

## what's wrong with this data? 
## this data is considered WIDE since heartrate is in multiple columns
## first identify the variables: name, drug, heart rate
## Do they follow the rules of tidyr?


messy1 = gather(messy1, drug, heartrate,a,b,c)
messy1
plot(messy1$name, messy1$heartrate)


### SEPARATE FUNCTION ###
?separate
messy2 = data.frame(
  name = c("Wilbur_m", "Petunia_f", "Gregory_m"),
  a = c(67, 80, 64),
  b = c(56, 90, 50),
  c = c(99, 30, 40)
)
messy2

messy2 = separate(messy2, name, c("name","gender"), sep="_")
messy2 = gather(messy2, drug, heartrate,a,b,c)
messy2


### UNITE FUNCTION ###
?unite
messy3 = data.frame(
  first_name = c("Wilbur_m", "Petunia_f", "Gregory_m"),
  last_name = c("Smith", "Gordon", "Jones"),
  a = c(67, 80, 64),
  b = c(56, 90, 50),
  c = c(99, 30, 40)
)
messy3

messy3 = gather(messy3, drug, heartrate,a,b,c)
messy3

messy3 = separate(messy3, first_name, c("first_name","gender"), sep="_")
messy3

messy3 = unite(messy3, full_name, 1, 3, sep=" ")
messy3


### SPREAD FUNCTION ###
?spread
messy3 = spread(messy3, drug, heartrate)
messy3














## dplyr is similar to sql statements (select, group by, joins)
library("dplyr")


bike_buyers = read.csv("assets/bike_buyers.csv")
View(bike_buyers)

# What could we try to learn about this data? What intereting questions could we ask it?



######### SAMPLE FUNCTION ###########

## select random rows by defining the number of rows you want
s1 = sample_n(bike_buyers, 5)
s1
## re-run this and you will get a different random 5 every time


## select random rows by defining a percentage
## this will be more helpful when using predictive algorithms
s2 = sample_frac(bike_buyers, 0.2)
s2



######### SELECT FUNCTION ###########
## pre-req: data must be in data frame format because it uses columns as params
?select
## from the df, get the marital status and income
select(bike_buyers, Marital.Status, income)
## uh oh, what happened? Correct it.




## from the df, drop variables
bike_buyers = select(bike_buyers, -ID)
bike_buyers

## why did I save that one to a variable? 

head(bike_buyers, 3)
tail(bike_buyers, 3)


## select variables (aka columns) based on partial description
select(bike_buyers, starts_with("C"))

## drop
select(bike_buyers, -starts_with("Y"))
## but we don't want to drop any from this....so we won't.

## rearrange the data, put purchased bike as the first column
bike_buyers = select(bike_buyers, Purchased.Bike, everything())
head(bike_buyers)





######### RENAME FUNCTION ###########
## must be a data frame
## provide new name first, then old name that it is replacing
?rename
bike_buyers = rename(bike_buyers, Purchased = Purchased.Bike)
head(bike_buyers)







######### FILTER FUNCTION ###########
?filter
## single criteria
filter(bike_buyers, Marital.Status=="Married")
filter(bike_buyers, Marital.Status=="Married" & Purchased == "Yes")



## multiple criteria, like occupation
filter(bike_buyers, Occupation %in% c("Skilled Manual", "Manual"))



filter(bike_buyers, Occupation %in% c("Skilled Manual", "Manual") & Purchased == "Yes" & Marital.Status == "Single")





## not operator
filter(bike_buyers, !Education =="High School")








######### ARRANGE FUNCTION ###########
## arrange is used to carry out sorting operations
?arrange

arrange(bike_buyers, desc(Children))
arrange(bike_buyers, desc(Purchased), desc(Children))












######### MUTATE FUNCTION ###########
## talk about feature engineering

## adding a new var named change
mutate(bike_buyers, age_to_income_ratio=Age/Income)


######### OTHER THINGS DPLYR CAN DO ###########
## join()
## intersect()
## union()


### other related functions not in DPLYR ###
?subset
subset(bike_buyers, select = c(Y2015, Y2014), Y2015 > 1800000 & Y2014 > 150000)

## subset(data, select which columns, set criteria)
subset(bike_buyers, select = c(Purchased, Marital.Status, Income, Occupation), Purchased=="Yes" & Marital.Status=="Single")






shoes = read.csv("assets/ZapataShoes.csv")
View(shoes)
head(shoes)

## get a sample of 10% of the whole dataset, use that for the rest of the operations

## drop customer number column

## get all buyers from Los Angeles

## get all buyers who purchased the Praia shoe

## separate name into first name and last name columns. NOTE: we'll go over this one together, but try. You might need another package.


## SOLUTIONS

shoes_samp = sample_frac(shoes, .10)

shoes_samp = select(shoes_samp, -CustNbr)

LA_customers = filter(shoes_samp, City == "Los Angeles")

Praia_shoe_customers = filter(shoes_samp, Shoe=="Praia")

library(tidyr)
shoes_samp = separate(shoes_samp, Name, c("Last_Name", "First_Name"), sep=",")
head(shoes_samp)

library(datasets)
mtcars

