## author: James Dayhuff, Winter 2017 ##
## course: Data Analytics in R ##

## this file was not used for class examples or lectures ##


hr_anl <- read.csv("assets/HR_comma_sep.csv")

View(hr_anl)
str(hr_anl)

hr_anl$number_project = as.factor(hr_anl$number_project)

hr_anl$Work_accident = as.factor(hr_anl$Work_accident)

hr_anl$promotion_last_5years = as.factor(hr_anl$promotion_last_5years)

hr_anl$time_spend_company = as.factor(hr_anl$time_spend_company)

hr_anl$left = as.factor(hr_anl$left)

hr_anl$left = as.numeric(hr_anl$left)

str(hr_anl)

library("caret")
set.seed(456)
?createDataPartition
subset_index = createDataPartition(y=hr_anl$left, p = 0.7, list = FALSE)

hr_train <- hr_anl[subset_index,]


hr_test <- hr_anl[-subset_index,]



