setwd("E:\\学习相关\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets\\Class")
library(foreign)
library(reshape2)
library(ggplot2)

raw <- read.dta("class1.dta")
raw <- subset(raw, raw$a8a<=70000)
raw <- subset(raw, raw$a18!="农业户口" | raw$a221!="")
raw$migrant <-1
raw$migrant[raw$a221==""] <- 0
raw$cat[raw$migrant==0] <- 1
raw$cat[raw$migrant==1&raw$a18!="农业户口"] <- 2
raw$cat[raw$migrant==1&raw$a18=="农业户口"] <- 3
ggplot(raw, aes(x=a8a, y=a43b, group=as.factor(cat), color=as.factor(cat)))+
  geom_point()+
  geom_smooth(method = lm)