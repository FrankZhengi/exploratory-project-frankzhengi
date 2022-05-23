library(ggplot2)
library(dplyr)

us_city_average <- read.csv("SeriesReport-20220523003731_7abc2f.csv", skip = 6)

# average pricing for each year

ggplot(data = us_city_average) +
  geom_point(mapping = aes(x = Year, y = Jan))

ggplot(data = us_natural_gas_prices) + 
  geom_point(mapping = aes(x = Month, y = Price))
abline(lm(Price~Month), col="red")
