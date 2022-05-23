# Loading in the library
library(tidyverse)

# Reading the data
gas_prices <- read.csv('data/gasprice91_16.csv', skip = 4)

us_city <- read.csv('data/usReport.csv', skip = 6)

gas_feat <- read.csv('data/Metadata_county.csv')

gas_feat <- subset(gas_feat, select = -X)


# Summary info
summary_info <- list()

# Avg gas prices per liter of the world in 2016
summary_info$avg_gas <- gas_prices %>% 
  filter(Country.Code == "WLD") %>% 
  pull(X2016)

# Highest U.S. city gas prices per gallon
summary_info$highest_city_price <- us_city %>% 
  summarize(max_year = pmax(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, na.rm = T)) %>% 
  filter(max_year == max(max_year)) %>% 
  pull(max_year)

# year of highest U.S city gas price
summary_info$year_highest <- us_city %>% 
  mutate(max_year = pmax(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, na.rm = T)) %>% 
  filter(max_year == max(max_year)) %>% 
  pull(Year)


# high income value gas price
summary_info$HIC_val <- gas_feat %>% 
  left_join(gas_prices) %>% 
  group_by(IncomeGroup) %>% 
  summarize(X2016 = mean(X2016, na.rm = T)) %>% 
  filter(IncomeGroup == 'High income') %>% 
  pull(X2016)

summary_info$HIC_val <- round(summary_info$HIC_val, digits = 2)

# number of countries that are high income with gas above the 
# high income value
summary_info$num_country <- gas_feat %>% 
  left_join(gas_prices) %>% 
  filter(IncomeGroup == 'High income' & X2016 > summary_info$HIC_val) %>% 
  nrow()


