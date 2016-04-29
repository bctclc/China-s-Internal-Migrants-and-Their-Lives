setwd("E:\\—ßœ∞œ‡πÿ\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets\\Total Population")
library(ggplot2)
library(reshape2)

#data cleanup
mydata <- read.csv("total population.csv")
mydata <- subset(mydata, mydata$X.1!="National Average")
mydata$difference <- NULL
mydata$percentage.change <- NULL

melt_data <- melt(mydata)
mydata <- read.csv("total population.csv")
mydata$X2000 <- NULL
mydata$X2010  <- NULL
mydata$Region <- NULL
mydata$X.1 <- NULL
melt_data <- merge(melt_data, mydata, by = "X")

#paired dot plot
positions <- c("Tibet","Qinghai","Ningxia","Gansu","Jilin",
               "Heilongjiang","Hainan","Henan","Jiangxi","Anhui",
               "Hunan","Guizhou","Guangxi",
               "Shanxi","Chongqing","Shaanxi","Hubei","Sichuan","Yunan",
               "Hebei","Inner Mongolia","Liaoning","Xinjiang","Shandong",
               "Tianjin","Fujian","Beijing","Jiangsu","Shanghai","Zhejiang","Guangdong")
ggplot(melt_data, aes(x = value, y = X.1))+
  geom_path(group = melt_data$X.1, size=1,aes(color=percentage.change) )+
  scale_colour_gradient(low = "#b1fcf9", high = "#023734")+
  geom_point(size = 1, shape=9, color="#5e5e5e") +
  scale_y_discrete(limits = positions)+
  theme(panel.background = element_rect(fill = "white"))
  
