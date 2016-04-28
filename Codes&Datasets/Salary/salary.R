setwd("E:\\学习相关\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets\\Salary")
library(foreign)
library(ggplot2)

raw <- read.dta("migrant worker.dta")
raw <- raw[,c(6,129,137)]
raw$a2 <- as.character(raw$a2)
raw$a2[raw$a2=="女"] <- "female"
raw$a2[raw$a2=="男"] <- "male"
raw$b2a1a <- as.numeric(raw$b2a1a)
raw$year <- 0
raw$year <- raw$b2a1a%/%100
raw$year <- ifelse(raw$year>20, raw$year+1900, raw$year+2000)
raw <- subset(raw, raw$year<2019)
raw <- subset(raw, is.na(raw$b2a7)==F)
raw$group <- ifelse(raw$year<1980, 1, ifelse(raw$year>=1980 & raw$year<1990, 2,
                                                 ifelse(raw$year>=1990 & raw$year<2000, 3, 4)))
raw$color <- "#2CF8EF"
raw$color[raw$a2=="male"] <- "#023734"

summ <- data.frame(1, 0)
colnames(summ) <- c("group", "mean")

for (i in 1:4) {
  summ[i, 1] <- i
  temp <- subset(raw, raw$group==i)
  summ[i, 2] <- mean(temp$b2a7)
}



ggplot(raw, aes(factor(group),b2a7))+
  geom_violin(color="#05968f", fill="#05968f")+
  theme(panel.background = element_rect(fill = "white"))

temp <- subset(raw, raw$group==2)
ggplot(temp, aes(factor(a2),b2a7, color=temp$color,fill=temp$color))+
  geom_violin()+
  theme(panel.background = element_rect(fill = "white"))


temp <- subset(raw, raw$group==3)
ggplot(temp, aes(x=a2,y=b2a7, color=temp$color,fill=temp$color))+
  geom_violin()+
  theme(panel.background = element_rect(fill = "white"))

temp <- subset(raw, raw$group==4)
ggplot(temp, aes(x=a2,y=b2a7, color=temp$color,fill=temp$color))+
  geom_violin()+
  theme(panel.background = element_rect(fill = "white"))

ggplot(summ, aes(x=group, y=mean))+  
    geom_point()

