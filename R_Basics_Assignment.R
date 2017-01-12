### Create a dataframe that contains information about company sales

## vector of sales rep names (first only)
## vector of years with company
## vector of sales for the month
## vector of customer rating for sales rep (1 - 10)

sales_reps = c("Johnny", "Angelina", "Tony", "Amy")
rep_gender = factor(c("M", "F", "M", "F"))
years_with_comp = c(2, 9, 13, 1)
sales_amount = c(1420.29, 2900.57, 1600.43, 1400.91)
cust_rating = c(8.0, 9.8, 6.1, 8.6)

sales_df = data.frame(sales_reps, rep_gender, years_with_comp, sales_amount, cust_rating, stringsAsFactors = FALSE)

summary(sales_df)
str(sales_df)


###### question #######
## How many different types can a vector hold?
## How many different types can a dataframe hold?
## How many different types can a matrix hold?
## What is the 1st Qu and Mean of sales_amount of the resulting data frame?
## What is the code you used to get to find these results?


