library(tidyr)
library(dplyr)
library(stringr)
library(ggplot2)






gasData <- read.csv('data/usReport.csv', skip = 6)



# Price of gasoline in the month of January from the years 2000 - 2022 ( 20th Century)
Jan_gasincrease <- ggplot(data=gasData[25:47,], aes(x=Year, y=Jan)) +
  geom_bar(stat="identity",color = "white",fill="black" ,width = 0.3)



#color change
ggplot(data=gasData, aes(x=Year, y=Jan)) +
   geom_bar(stat="identity", color="white", fill="black")


p<-ggplot(data=gasData, aes(x=Year, y=Jan)) +
  geom_bar(stat="identity", fill="white")+
  theme_minimal()
  

  