### Occupation segregation

setwd("E:\\—ßœ∞œ‡πÿ\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets")
library(ggplot2)
library(reshape2)
file <- read.csv("occupation segregation.csv", header=T)
file$X <-NULL

# melt dataset
melt_data <- melt(file)

# order
positions <- c("Tibet","Qinghai","Ningxia","Gansu","Jilin",
               "Heilongjiang","Hainan","Henan","Jiangxi","Anhui",
               "Hunan","Guizhou","Guangxi",
               "Shanxi","Chongqing","Shaanxi","Hubei","Sichuan","Yunan",
               "Hebei","Inner Mongolia","Liaoning","Xinjiang","Shandong",
               "Tianjin","Fujian","Beijing","Jiangsu","Shanghai","Zhejiang","Guangdong",
               "National Average")

# heatmap
ggplot(melt_data, aes(variable, X.1)) +
  geom_tile(aes(fill = value), color="white") +
  scale_fill_gradientn(colors=c("#b1fcf9","#05968f","#035d59","#023734"))+
  scale_y_discrete(limits = positions)+
  theme(panel.background = element_rect(fill = "white"),
        panel.border= element_blank())
  