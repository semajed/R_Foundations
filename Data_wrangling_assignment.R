library(tidyr)
messy_data = data.frame(
  office_location = c("NY_New York", "TX_Houston", "CA_Los Angeles", "CO_Denver"),
  bike_sales = c(20000, 9000, 5000, 15000),
  helmet_sales = c(5000, 1000, 800, 4000),
  bike_repair_sales = c(4000, 1000, 400, 5000)
)
clean_data = gather(messy_data, item, sales_amount, bike_sales, helmet_sales, bike_repair_sales)
clean_data

library(dplyr)
cars = mtcars
head(mtcars)
sample_cars = sample_frac(cars, .20)

mpg_g_30 = filter(cars, mpg > 30)
mpg_g_30
