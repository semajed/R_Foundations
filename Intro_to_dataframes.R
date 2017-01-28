## look at your environment tab
## you'll notice you still have access to the data you created previously
## just because this is a different script doesn't mean you don't have access to other variables
## this is called scope, or the defined area of existence for a variable
## if we were to create a new project, that would create a new scope
## ls() command also shows you the scope of your current environment variables
ls()

## right now we have separate columns of data that all relate to each other, we need to combine the data


################## create data frame ########################
?data.frame
df1 = data.frame(first_name, gender, gpa, pass, fcolor)
df1
str(df1)
class(df1)
summary(df1)

## You'll notice that first_name was converted to a factor. Do we want that? Is that categorical?



df1 = data.frame(first_name, gender, gpa, pass, fcolor, stringsAsFactors = FALSE)



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
df1[2:3,]

## get Alice and Sarah's data
df1[c(1,4),]

## get the names and whether or not they passed
df1[,c(1,4)]


## CONDITIONAL EXTRACTION

df1[which(df1$pass==TRUE),]


df1[which(df1$gpa>3.00),]








