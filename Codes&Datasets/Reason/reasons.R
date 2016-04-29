setwd("E:\\—ßœ∞œ‡πÿ\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets\\Reason")

library(ggplot2)
library(ggplot2movies)
library(reshape2)
library(Rmisc)
library(gridExtra)

raw <- read.csv("reason-raw.csv")
raw$family <- raw$Trailing.Family.Member+raw$Marriage
raw <- raw[,c(1,2,3,9)]
melted <- melt(raw)

plots <-list()
for (i in c("Beijing",
            "Tianjin",
            "Hebei",
            "Shanxi",
            "Inner Mongolia",
            "Liaoning",
            "Jilin",
            "Heilongjiang",
            "Shanghai",
            "Jiangsu",
            "Zhejiang",
            "Anhui",
            "Fujian",
            "Jiangxi",
            "Shandong",
            "Henan",
            "Hubei",
            "Hunan",
            "Guangdong",
            "Guangxi",
            "Hainan",
            "Chongqing",
            "Sichuan",
            "Guizhou",
            "Yunan",
            "Tibet",
            "Shaanxi",
            "Gansu",
            "Qinghai",
            "Ningxia",
            "Xinjiang",
            "National Average")){
  temp <- subset(melted, melted$X==i)
  p1 <- ggplot(temp, aes(x = X.1, y= value, fill = variable))+
    geom_bar(stat="identity") + coord_polar(theta = "y")+
    theme(legend.position="none",panel.background = element_rect(fill = "white"),
          panel.border= element_blank())+
    scale_x_discrete(breaks=NULL)+
    scale_y_continuous(breaks=NULL)+
    scale_fill_manual(values=c("#b1fcf9","#07e2d8","#023734"))
  plots[[i]] <- p1
}

do.call("grid.arrange", c(plots, ncol=4, nrow=8))
