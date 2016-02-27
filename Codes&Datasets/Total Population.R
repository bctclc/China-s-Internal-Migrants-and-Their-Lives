### Total Floating Population

setwd("E:\\—ßœ∞œ‡πÿ\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets")
library(ggplot2)
library(reshape2)
file <- read.csv("total population.csv", header=T)

### subset for stacked bar chart
barchart <- subset(file[-1,], select=c(X.1, X2000, difference))

### plot barchart
melt_barchart <- melt(barchart, id=c("X.1"))
positions <- c("Guangdong","Zhejiang","Jiangsu","Shanghai","Beijing","Fujian","Shandong",
               "Sichuan","Liaoning","Hubei","Henan","Inner Mongolia","Hebei","Tianjin",
               "Yunan","Guangxi","Hunan","Anhui","Shaanxi","Shanxi","Xinjiang","Chongqing",
               "Heilongjiang","Guizhou","Jiangxi",
               "Jilin","Gansu","Hainan","Ningxia","Qinghai","Tibet")
ggplot(melt_barchart) +aes(x=X.1, y=value, fill=variable) +
  geom_bar(stat="identity") +
  scale_fill_manual(values=c("#05968f", "#4fc2bd")) +
  theme(panel.background = element_rect(fill = "white"),
        panel.border= element_blank())+
  scale_x_discrete(limits = positions)

### subset for lollipop chart
loll <- subset(file[-1,], select = c(X.1, percentage.change))

### plot lollipop chart
ggplot(loll, aes(y=loll$percentage.change, x=loll$X.1)) + 
  geom_point(stat="identity", shape=24, size=3, color="#005955", fill="#005955")+
  theme(panel.background = element_rect(fill = "white"),
        panel.border= element_blank())+
  scale_x_discrete(limits = positions)