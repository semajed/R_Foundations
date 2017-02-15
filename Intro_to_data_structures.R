## Now we'll look at a matrix, an array, and a list.

################ VECTOR DATA STRUCTURE ################

## a single vector is 1 dimensional with a single type

?vector

my_vector = c(14,15,16,17)
my_vector

?str
?summary

str(my_vector)
summary(my_vector)

my_vector[2]

















################ MATRIX DATA STRUCTURE ################

## a single matrix is 2 dimensional with a single type
## it is basically a combination of multiple vectors
?matrix

my_matrix = matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3)
my_matrix
summary(my_matrix)
str(my_matrix)

## byrow tells the matrix how the vectors are to be structured.
my_matrix = matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3, byrow=TRUE)
my_matrix
summary(my_matrix)


## now retrieve single items from the matrix


## data_structure[row, column]



my_matrix[2,2]
my_matrix[,3]
my_matrix[1,]
my_matrix[7]

## now retrieve multiple items from the matrix
my_matrix[c(1,3),]
my_matrix[,c(2,3)]
my_matrix[,2:3]

my_matrix[1:2,]


# another way to create lots of data fast in a matrix
my_big_matrix = matrix(c(seq(from=-98,to=100,by=2)),nrow=10,ncol=10)
my_big_matrix



# using a matrix has the benefits of uniform data, you can perform massive operations quickly
?apply
# get the mean of all the columns
apply(my_big_matrix, 2, mean)

# sum all the rows
apply(my_big_matrix, 1, sum)

## even use custom functions to decide which items you want to affect
# 
apply(my_big_matrix, 1, function(x) mean(x[x>0]))
























################ LIST DATA STRUCTURE ################
## 1 dimensional, multiple types

## simple list
my_list = list("look", 2, TRUE)

#### you can make a list of other data structures: list of matrices, list of vectors
## lists of vectors
n = c(2, 3, 5)
s = c("aa", "bb", "cc", "dd", "ee") 
b = c(TRUE, FALSE, TRUE, FALSE, FALSE)
x = list(n, s, b, 3)

## list slicing
my_list[2]
x[3]
x

## naming the data in a list
v = list(bob=c(2, 3, 5), john=c("aa", "bb"))
v
v$bob
v$john


## Lists have their draw-backs: the data is inherently less organized and harder to work with
## We prefer dataframes.






## look at your environment tab
## you'll notice you still have access to the data you created previously
## just because this is a different script doesn't mean you don't have access to other variables
## this is called scope, or the defined area of existence for a variable
## if we were to create a new project, that would create a new scope
## ls() command also shows you the scope of your current environment variables
ls()

## right now we have separate columns of data that all relate to each other, we need to combine the data












## PRACTICE

# create a vector of first names of your friends
# create a vector of logicals
# create a matrix of anything
# create factors for car types (honda, lexus, toyota, etc)




