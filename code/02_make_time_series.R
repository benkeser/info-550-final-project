library(ggplot2)

#putting each year into separate data frames to graph them on top of each other
daily_21 <- subset(pm_daily_mean, year == 2021)
daily_22 <- subset(pm_daily_mean, year == 2022)

#aligning 2022 data with 2021 by creating a 'fake date' so the two lines for each year overlay nicely on a graph where the x-axis is just day/month
daily_22$fake_date <- daily_21$date

#making a time series graph
ggplot_object <- ggplot() +
  geom_line(data=daily_21, aes(x=date, y=avg_conc, group=year, color=year)) +
  geom_line(data=daily_22, aes(x=fake_date, y=avg_conc, group=year, color=year)) +
  geom_point() +
  scale_x_date(date_breaks = "10 day", date_labels = "%m/%d") +
  labs(title = "Average Daily PM2.5 Concentration January to March of 2021 and 2022",
       x = 'Date',
       y = 'Avg. PM2.5 Conc. (ug/m3)',
       color = "Year",
       caption = "Time series data of daily average PM2.5 
       concentrations in Salt Lake County in winter of 2021 and 2022") +
  theme(legend.position = "bottom", plot.title=element_text(hjust=0.5)) +
  scale_color_manual(values = c("#9970de", "#37b9bf"))
                     
ggsave("output/time_series_plot.svg", plot = last_plot())
