library(ggplot2)
library(dplyr)
library(tidyverse)




gasData <- read.csv('data/gasprice91_16.csv', skip = 4)
#names(gasData) = gsub(pattern = "X", replacement = "", x = names(gasData))

gasData %>% select(starts_with("X"))

#gasData[,5:66] <- sapply(gasData[,5:66], as.numeric)

#gasDataCol <- gasData %>%
#  pull(Country.Name) %>%
#  select(5:66)


ggplot(gasData, aes(x= gasData[5:66], y = Country.Name, color = "Blue")) +
  geom_line()+
  geom_point()
  
  

  