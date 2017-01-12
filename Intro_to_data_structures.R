## We were introduced to vectors and dataframes, 
#### which are the most common type of data structures you'll use.

## Now we'll look at a matrix, an array, and a list.

################ MATRIX DATA STRUCTURE ################

## a single matrix is 2 dimensional with a single type
## it is basically a combination of multiple vectors
?matrix

my_matrix = matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3)
my_matrix
summary(my_matrix)

## byrow tells the matrix how the vectors are to be structured.
my_matrix = matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3, byrow=TRUE)
my_matrix
summary(my_matrix)

## now retrieve single items from the matrix
my_matrix[2,2]
my_matrix[,3]
my_matrix[1,]
my_matrix[7]

## now retrieve multiple items from the matrix
my_matrix[c(1,3),]
my_matrix[,c(2,4)]


################ ARRAY DATA STRUCTURE ################

## an array is multi-dimensional of a single type.
## it is basically a collection of matrices
## a one dimensional array is vector
## a two dimensional array is a matrix
## a three dimensional array is....an array

?array
## we aren't going to go over arrays since this isn't the focus of what we will be doing

################ LIST DATA STRUCTURE ################
## 1 dimensional, multiple types

## simple list
my_list = list("look", 2, TRUE)


## lists of vectors
n = c(2, 3, 5)
s = c("aa", "bb", "cc", "dd", "ee") 
b = c(TRUE, FALSE, TRUE, FALSE, FALSE)
x = list(n, s, b, 3)

## list slicing
my_list[2]
x[3]


## naming the data in a list
v = list(bob=c(2, 3, 5), john=c("aa", "bb")) 
v
v$bob
v$john


## Lists have their draw-backs: the data is inherently less organized and harder to work with
## We prefer dataframes.






