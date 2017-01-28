## GOAL ##
## we will be creating multiple vectors which we will then tie together to become a dataframe




## A vector is one of the most basic data structures you'll encounter in R
## Vectors can be of many types (int, numeric, character, logical and factor)

## a single vector is 1 dimensional of a single type


################## numeric vector ########################

?vector
## create a numeric vector
gpa = c(1.81, 3.91, 3.45, 3.65)

## R is a non-zero based language
gpa[1]

## use semi-colon to get a series of values
gpa[1:3]
gpa[3:4]

## get information about a vector using str, class, and summary
str(gpa)
class(gpa)
summary(gpa)

?str
?class
?summary















################## char vector ########################



## create a char vector
first_name = c("Alice", "Jimmy", "Luke", "Sarah")
str(first_name)
class(first_name)
summary(first_name)
## different results with summary because it is non-numeric













################## logical vector ########################


## create a logical vector
pass = c(FALSE, TRUE, TRUE, TRUE)
str(pass)
class(pass)
summary(pass)












################## factor vector ########################


## create a factor vector
gender = c("f", "m", "m", "f")
str(gender)


## Factors are like buckets of categories, use these when dealing with categorical variables
gender = factor(gender)
str(gender)
class(gender)
summary(gender)






## create another factor vector for favorite color of each person, but use concise code
fcolor = factor(c("blue", "green", "green", "red"))
str(fcolor)
class(fcolor)
summary(fcolor)
## notice that it lists the factors in alphabetical order. 
## Customize this by specifying the order of levels
fcolor
fcolor = factor(c("blue", "green", "green", "red"), levels = c("red", "green", "blue"))
fcolor

