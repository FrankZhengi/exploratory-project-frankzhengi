library(tidyverse)

# reading files in
gas_prices <- read.csv('data/API_EP.PMP.SGAS.CD_DS2_en_csv_v2_4028724.csv', skip = 4)
gas_feat <- read.csv('data/Metadata_Country_API_EP.PMP.SGAS.CD_DS2_en_csv_v2_4028724.csv')
gas_feat <- subset(gas_feat, select = -X)

# table for worldwide 
worldwide_table <- gas_feat %>% 
  left_join(gas_prices) %>% 
  filter(IncomeGroup != "") %>%
  group_by(IncomeGroup) %>% 
  select(Country.Name, IncomeGroup, X2016)

