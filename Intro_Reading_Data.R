## author: James Dayhuff, Winter 2017 ##
## course: Data Analytics in R ##



#### BEFORE WE BEGIN ####
## Rstudio wants to know where to save your files. Create a project to make that easier. ##
## Go download "sales_per_year_per_state" from learningsuite -> content
## Go download "bike_buyers.csv" from learningsuite -> content
## Go Download "ZapataShoes.csv" from learningsuite -> content













## READING IN DATA ##



## R studio needs to able to find the data you want to consume
#### 1) set your working directory to where you dataset is
#### 2) move your data set to where your current working directory is (I prefer this since I use GIT)

## check where you are currently working
#getwd()
#setwd("File path to desired location")

### TYPES OF FILES YOU CAN READ INTO R ###
## txt, csv, excel, json, xml, html tables, relational DB, non-relational DB, and more!
## most of these require unique packages to read the data in




my_txt_data = read.table("assets/sample_text_file.txt")









?read.table

#### TXT FILE ####



my_file_name = "assets/sample_text_file.txt"
my_txt_data = read.table(my_file_name)
# or
my_txt_data = read.table("assets/sample_text_file.txt")

View(my_txt_data)

## common sep values = comma, pipe, fixed space
str(my_txt_data)










#





#### CSV FILE ####
?read.csv
my_csv_data = read.csv("assets/sales_per_year_per_state.csv")

?View
View(my_csv_data)




?read.table

## read.table is more generic, you need to specify what you want it to do
my_csv_data2 = read.table("assets/sales_per_year_per_state.csv", sep=",",header= T)
View(my_csv_data2)
## are the headers right?





str(my_csv_data)
View(my_csv_data)


my_csv_data = read.csv("assets/sales_per_year_per_state.csv", na.strings = c("No Value", NA))

str(my_csv_data)
View(my_csv_data)








##  stringsAsFactors?
my_csv_data = read.csv("assets/sales_per_year_per_state.csv", na.strings = c("No Value", NA), stringsAsFactors = FALSE)
str(my_csv_data)

## now what if I wanted ONE of those to remain a factor?

my_csv_data$Index = as.factor(my_csv_data$Index)

#= as.factor(my_csv_data$Index)

str(my_csv_data)









#### EXCEL FILE ####
library(XLConnect)
## if it says there is no package, you'll have to install in the package from scratch, which isn't hard
?XLConnect
?loadWorkbook
my_xl_data = loadWorkbook("assets/excel_data_sample.xlsx")
View(my_xl_data)
# what's wrong???
wb = loadWorkbook("assets/excel_data_sample.xlsx")
?readWorksheet
my_xl_data = readWorksheet(wb, sheet=1)
View(my_xl_data)

# shortcut
?readWorksheetFromFile
my_xl_data = readWorksheetFromFile("assets/excel_data_sample.xlsx",sheet = 1)











#### JSON FILE ####
library(rjson)
?rjson
?fromJSON
jsondata = fromJSON(file="my_json_file")













#### XML FILE ####
library(XML)
??XML

















#### HTML TABLES ####
??read
library(XML)
my_url = "http://basketball.realgm.com/nba/stats"
nba_data = readHTMLTable(my_url, which=1)
head(nba_data)
str(nba_data)

?readHTMLTable
nba_data = readHTMLTable(my_url, which=1, stringsAsFactors=FALSE,colClasses=c("numeric","character","factor",rep("numeric",90)))
head(nba_data)
str(nba_data)

summary(nba_data)

















#### DATABASE CONNECTIONS ####
## depending on the type of databse you want to connect to, you'll use specific packages for each
## RMySQL, ROracle, RJDBC, and more
## They all follow a similar pattern to connect

library("RMySQL")
?dbConnect

myconn = dbConnect(MySQL(), user='user', password='password', dbname='database_name', host='host')

dbListTables(mydb)

myquery = dbSendQuery(mydb, "select * from some_table")

close(myconn)













