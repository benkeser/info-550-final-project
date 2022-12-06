here::i_am("code/01_make_summary_table.R")

library(knitr)
library(magrittr)
library(kableExtra)

pm_daily_mean <- read.csv("data/agg_PM25_2021-22_daily_mean.csv")

## setting up data to calculate correctly for table
# converting dates from characters to dates
pm_daily_mean$date <- as.Date(c(pm_daily_mean$date), "%m/%d/%Y")

# creating a column for month and year
pm_daily_mean$month <- months(pm_daily_mean$date)
pm_daily_mean$month <- factor(pm_daily_mean$month, levels = c('January', 'February', 'March'))
pm_daily_mean$year <- format(pm_daily_mean$date, format="%Y")

# aggregating daily values by month and year
monthly_mean <- aggregate(avg_conc~month+year, pm_daily_mean, mean)

## making the table
knitr::kable(monthly_mean, 
             col.names = c("Month", "Year", "Average PM2.5 Concentration [ug/m3]"), 
             align = "llc",
             caption = "This table displays the average concentration of PM2.5 by month in winter 2021 and 2022, averaged across all EPA monitoring stations in Salt Lake County.",
             digits = 2
) %>%
  kable_material(c("striped", "hover")) %>%
  save_kable("output/final_table.html")
