library(tidyr)
library(dplyr)
library(stringr)
library(ggplot2)






gasData <- read.csv('data/usReport.csv', skip = 6)

ggplot(data=gasData[25:47,], aes(x=Year, y=Jan)) +
  geom_bar(stat="identity", width=0.5)


ggplot(data=gasData, aes(x=Year, y=Jan)) +
  geom_bar(stat="identity", color="white", fill="black")


p<-ggplot(data=gasData, aes(x=Year, y=Jan)) +
  geom_bar(stat="identity", fill="red")+
  theme_minimal()
  

  