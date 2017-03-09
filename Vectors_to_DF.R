


## GOAL ##
## we will be creating multiple vectors which we will then tie together to become a dataframe





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
summary(fcolor)




################## create data frame ########################
## multiple columns, various data types. A single column must be the same data type.

?data.frame


df1 = data.frame(first_name, gender, gpa, pass, fcolor)
df1
str(df1)
class(df1)
summary(df1)

## You'll notice that first_name was converted to a factor. Do we want that? Is that categorical?

df1 = data.frame(first_name, gender, gpa, pass, fcolor, stringsAsFactors = FALSE)
df1


################## extracting from data frame ########################

## we are now dealing with multiple vectors stacked into one variable

## data_structure[rows, columns]

## get the first, first_name 
df1[1,1]

## get gpa of 3rd person
df1[3,3]

## get all the data from the last row
df1[4,]

## get all the gpa's
df1[,3]

## get Jimmy and Luke's data
df1[2:4,]

## get Alice and Sarah's data
df1[c(1,4),]

## get the names and whether or not they passed
df1[,c(1,4)]


## CONDITIONAL EXTRACTION

df1[which(df1$pass==TRUE),]


df1[which(df1$gpa>3.00),]




## QUESTIONS
# What to do when you don't know what a function does?
# What key words could you google for today's material?


