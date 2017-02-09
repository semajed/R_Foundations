

location = "http://www.ndbc.noaa.gov/view_text_file.php?filename=44025h2011.txt.gz&dir=data/historical/stdmet/"


## prepare your workspace ##

## remove any previous data in your environment
rm(list = ls())

## check where you are currently working
getwd()

## you have a choice now...you can do one of two things:
#### 1) set your working directory to where you dataset is
#### 2) move your data set to where your current working directory is (I prefer this since I use GIT)


### TYPES OF FILES YOU CAN READ INTO R ###
## txt, csv, excel, json, xml, html tables, relational DB, non-relational DB, and more!
## some of these require unique packages to read the data in

?read.table

#### TXT FILE ####
my_file_name = "sample_text_file.txt"
my_txt_data = read.table(my_file_name)
# or
my_txt_data = read.table("sample_text_file.txt")

#### CSV FILE ####
my_csv_data = read.csv("sampledata.csv")
my_csv_data1 = read.table("sampledata.csv")

View(my_csv_data)
View(my_csv_data1)

## read.table is more generic, you need to specify what you want it to do
my_csv_data2 = read.table("sampledata.csv", sep=",")
View(my_csv_data2)


#### EXCEL FILE ####
library(XLConnect)
## if it says there is no package, you'll have to install in the package from scratch, which isn't hard
?XLConnect
my_xl_data = loadWorkbook("excel_data_sample.xlsx")
View(my_xl_data)
# what's wrong???
wb = loadWorkbook("excel_data_sample.xlsx")
my_xl_data = readWorksheet(wb, sheet=1)

# shortcut
my_xl_data = readWorksheetFromFile("excel_data_sample.xlsx",sheet = 1)

#### JSON FILE ####
library(rjson)
?rjson
jsondata = fromJSON(file="my_json_file")

#### XML FILE ####
library(XML)
??XML

#### HTML TABLES ####

?url
?readHTMLTable
my_url = "http://basketball.realgm.com/nba/stats"
nba_data = readHTMLTable(my_url, which=1)
head(nba_data)
str(nba_data)
nba_data = readHTMLTable(my_url, which=1, stringsAsFactors=FALSE,colClasses=c("numeric","character","character",rep("numeric",90)))
str(nba_data)
head(nba_data)


#### DATABASE CONNECTIONS ####
## depending on the type of databse you want to connect to, you'll use specific packages for each
## RMySQL, ROracle, RJDBC, and more
## They all follow a similar pattern to connect

library("RMySQL")
mydb = dbConnect(MySQL(), user='user', password='password', dbname='database_name', host='host')
dbListTables(mydb)
myquery = dbSendQuery(mydb, "select * from some_table")
close(mydb)




