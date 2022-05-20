library(ggplot2)
library(dplyr)

us_all_gas_df <- read.csv("Data/PET_PRI_GND_DCUS_NUS_W.csv")
us_city_avg_df <- read.csv("Data/SeriesReport-20220502011320_1a7c5d.csv", skip = 6)

us_city_avg_df <- us_city_avg_df %>% 
  mutate(yearly_average = 
    rowMeans(select(us_city_avg_df, Jan:Dec), na.rm = TRUE))

us_avg_year_gas <- ggplot(us_city_avg_df, mapping = aes(x = Year, y = yearly_average)) + 
  geom_line() +
  labs(title = "US Yearly City Average Gas Prices",
       subtitle = "unleaded regular gasoline, per gallon",
       y = "Yearly Average Gas Price (in USD)")

