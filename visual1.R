library(ggplot2)
library(dplyr)
library(cowplot)







gasData <- read.csv('data/gasprice91_16.csv', skip = 4)

names(gasData) = gsub(pattern = "X", replacement = "", x = names(gasData))


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

plotCol1 <- ggplot(df_column1, aes(x = factor(names), y = values)) + 
  geom_bar(stat = "identity") + 
  xlab("Year") +
  ylab("Price")+
  #facet_wrap(~Group)+
  theme_bw()

plot_Year <- ggplot(df_duration, aes(x=factor(names), y = values)) + 
  geom_bar(stat = "identity")+
  xlab("Country") +
  ylab("Price") +
  #facet_wrap(~Group) + 
  theme_bw()


plot_grid(plotCol1, plot_Year, labels = "AUTO")
  
  
  
  
  
  


gasData[,5:66] <- sapply(gasData[,5:66], as.numeric)



  
  

  