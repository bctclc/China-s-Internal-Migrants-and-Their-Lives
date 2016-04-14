setwd("E:\\—ßœ∞œ‡πÿ\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets\\Correlation")
library(ggplot2)
library(reshape2)

raw <- read.csv("econ corr.csv")
raw <- raw[,-c(1,7,8)]
raw$shape <- ifelse(raw$Region=="Northern China", 0,
                    ifelse(raw$Region=="Eastern China", 1, 
                           ifelse(raw$Region=="Southern China",2,
                                  ifelse(raw$Region=="Northeastern China", 15,
                                         ifelse(raw$Region=="Southwestern China", 16, 17)))))
raw$log_comsumption <- log(raw$Consumption.Level..Yuan.)

ggplot(raw, aes(x=raw$Consumption.Level..Yuan., y=raw$percentage.immigrants))+
  geom_point(size=4.5, shape=raw$shape, color="#05968f")+
  geom_smooth(method=lm, se=F, color="#bcbcbc")+
  theme(panel.background = element_rect(fill = "white"))

ggplot(raw, aes(x=raw$Consumption.Level..Yuan., y=raw$percentage.emigrants))+
  geom_point(size=4.5, shape=raw$shape, color="#05968f")+
  geom_smooth(method=lm, se=F, color="#bcbcbc")+
  theme(panel.background = element_rect(fill = "white"))