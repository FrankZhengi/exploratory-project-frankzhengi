library(ggplot2)

us_city_average <- read.csv("data/usReport.csv", skip = 6)

# average pricing for January starting from 1976 to 2022

us_city_plot <- ggplot(data = us_city_average) +
  geom_point(mapping = aes(x = Year, y = Jan)) + 
  labs(x = "Year", y = "Price")


