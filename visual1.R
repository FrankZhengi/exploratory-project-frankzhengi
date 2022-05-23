library(tidyr)
library(dplyr)
library(stringr)
library(ggplot2)
library(ggrepel)





gasData <- read.csv('data/gasprice91_16.csv', skip = 4)

names(gasData) = gsub(pattern = "X", replacement = "", x = names(gasData))










# years <- gasData%>% 
#   select(36:66)

df_column1 <- gasData %>%
  pivot_longer(
    cols = 36:66,
    names_to = "names",
    values_to = "values"
  ) %>%
  filter(grepl('Number', names))


df_duration <- gasData %>%
  pivot_longer(
    cols = 36:66,
    names_to = "names",
    values_to = "values"
  )%>%
  filter(grepl('Duration', names))

plotCol1 <- ggplot(df_column1, aes(x = factor(years), y = values)) + 
  geom_bar(stat = "identity") + 
  xlab("Year") +
  ylab("Price")+
  #facet_wrap(~Group)+
  theme_bw()

plot_Year <- ggplot(df_duration, aes(x=factor(years), y = values)) + 
  geom_bar(stat = "identity")+
  xlab("Year") +
  ylab("Price") +
  #facet_wrap(~Group) + 
  theme_bw()


plot_grid(plotCol1, plot_Year, labels = "AUTO")
  
  
  
  
  
  





# Don't know if this is necessary, someone double check with me here 
#gasData[,5:66] <- sapply(gasData[,5:66], as.numeric)



  
  

  