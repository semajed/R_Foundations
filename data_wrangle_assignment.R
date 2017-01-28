#### Assignment ####
messy_data = data.frame(
  office_location = c("NY_New York", "TX_Houston", "CA_Los Angeles", "CO_Denver"),
  bike_sales = c(20000, 9000, 5000, 15000),
  helmet_sales = c(5000, 1000, 800, 4000),
  bike_repair_sales = c(4000, 1000, 400, 5000)
)

messy_data

gathered_data = gather(messy_data, sales_items, sales_amount, bike_sales, helmet_sales, bike_repair_sales)

gathered_data
?separate
clean_data = separate(gathered_data, office_location, c("state", "city"), sep="_")
clean_data

library(help = "datasets")
library(datasets)
mtcars = datasets::mtcars
sample1 = sample_frac(mtcars,.2)
sample1

mpg_g_30 = filter(mtcars, mpg>=30)
mpg_g_30

mtcars = mutate(mtcars, gears_to_carbs=gear/carb)
mtcars
?mutate