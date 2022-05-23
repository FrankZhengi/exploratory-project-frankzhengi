library(tidyverse)

# reading files in
gas_prices <- read.csv('data/gasprice91_16.csv', skip = 4)
gas_feat <- read.csv('data/Metadata_county.csv')
gas_feat <- subset(gas_feat, select = -X)

# table for worldwide 
worldwide_table <- gas_feat %>% 
  left_join(gas_prices) %>% 
  filter(IncomeGroup != "") %>%
  group_by(IncomeGroup) %>% 
  summarize(mean = mean(X2016, na.rm = T)) %>% 
  select(IncomeGroup, mean)

