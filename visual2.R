library(ggplot2)

us_city_average <- read.csv("SeriesReport-20220523022357_8c154c.csv", skip = 8)

# average pricing for January starting from 1976 to 2022

ggplot(data = us_city_average) +
  geom_point(mapping = aes(x = X, y = X.1)) + 
  labs(x = "Year", y = "Price")


