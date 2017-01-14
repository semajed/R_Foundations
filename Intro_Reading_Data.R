

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

my_file_name = "sample_text_file.txt"
my_txt_data = read.table(my_file_name)

