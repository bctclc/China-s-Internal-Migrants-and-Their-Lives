### Education composition for intra-provincial and inter-provincial flowing population

setwd("E:\\—ßœ∞œ‡πÿ\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets\\Education Composition")
library(ggplot2)
library(reshape2)

inter_pro <- read.csv("Education Composition-1.csv", header=T)
intra_pro <- read.csv("Education Composition-2.csv", header=T)
inter_pro3 <- read.csv("Education Composition-3.csv", header=T)
intra_pro3 <- read.csv("Education Composition-4.csv", header=T)

### create percentage columns
inter_pro$no_percentage <- inter_pro$No.schooling/inter_pro$Population*100
inter_pro$primary_percentage <- inter_pro$Primary.school/inter_pro$Population*100
inter_pro$junior_percentage <- inter_pro$Junior.high.school/inter_pro$Population*100
inter_pro$senior_percentage <- inter_pro$Senior.high.school/inter_pro$Population*100
inter_pro$college_percentage <- inter_pro$Some.college/inter_pro$Population*100
inter_pro$master_percentage <- inter_pro$Master.and.higher/inter_pro$Population*100

inter_pro <- subset(inter_pro, select=c(X.1,no_percentage,primary_percentage,junior_percentage
                                        ,senior_percentage,college_percentage,master_percentage))

intra_pro$no_percentage <- intra_pro$No.schooling/intra_pro$Population*100
intra_pro$primary_percentage <- intra_pro$Primary.school/intra_pro$Population*100
intra_pro$junior_percentage <- intra_pro$Junior.high.school/intra_pro$Population*100
intra_pro$senior_percentage <- intra_pro$Senior.high.school/intra_pro$Population*100
intra_pro$college_percentage <- intra_pro$Some.college/intra_pro$Population*100
intra_pro$master_percentage <- intra_pro$Master.and.higher/intra_pro$Population*100

intra_pro <- subset(intra_pro, select=c(X.1,no_percentage,primary_percentage,junior_percentage
                                        ,senior_percentage,college_percentage,master_percentage))

inter_pro3$no_percentage <- inter_pro3$No.schooling/inter_pro3$Population*100
inter_pro3$primary_percentage <- inter_pro3$Primary.school/inter_pro3$Population*100
inter_pro3$junior_percentage <- inter_pro3$Junior.high.school/inter_pro3$Population*100
inter_pro3$senior_percentage <- inter_pro3$Senior.high.school/inter_pro3$Population*100
inter_pro3$college_percentage <- inter_pro3$Some.college/inter_pro3$Population*100
inter_pro3$master_percentage <- inter_pro3$Master.and.higher/inter_pro3$Population*100

inter_pro3 <- subset(inter_pro3, select=c(X.1,no_percentage,primary_percentage,junior_percentage
                                        ,senior_percentage,college_percentage,master_percentage))

intra_pro3$no_percentage <- intra_pro3$No.schooling/intra_pro3$Population*100
intra_pro3$primary_percentage <- intra_pro3$Primary.school/intra_pro3$Population*100
intra_pro3$junior_percentage <- intra_pro3$Junior.high.school/intra_pro3$Population*100
intra_pro3$senior_percentage <- intra_pro3$Senior.high.school/intra_pro3$Population*100
intra_pro3$college_percentage <- intra_pro3$Some.college/intra_pro3$Population*100
intra_pro3$master_percentage <- intra_pro3$Master.and.higher/intra_pro3$Population*100

intra_pro3 <- subset(intra_pro3, select=c(X.1,no_percentage,primary_percentage,junior_percentage
                                        ,senior_percentage,college_percentage,master_percentage))

### color set for education level
edu_color <- c("#b1fcf9","#2CF8EF","#07e2d8","#05968f","#035d59","#023734")

### position for provinces
positions <- c("Guangdong","Zhejiang","Jiangsu","Shanghai","Beijing","Fujian","Shandong",
               "Sichuan","Liaoning","Hubei","Henan","Inner Mongolia","Hebei","Tianjin",
               "Yunan","Guangxi","Hunan","Anhui","Shaanxi","Shanxi","Xinjiang","Chongqing",
               "Heilongjiang","Guizhou","Jiangxi",
               "Jilin","Gansu","Hainan","Ningxia","Qinghai","Tibet")

### barplot for education composition for inter-provincial flowing population by province of residence
melt_inter <- melt(inter_pro)
ggplot(melt_inter) +aes(x=X.1, y=value, fill=variable) +
       geom_bar(stat="identity") +
       scale_fill_manual(values=c("#b1fcf9","#2CF8EF","#07e2d8","#05968f","#035d59","#023734")) +
       coord_flip() + theme(panel.background = element_rect(fill = "white"))+
       scale_x_discrete(limits = positions)


### barplot for education composition for intra-provincial flowing population by province of residence
melt_intra <- melt(intra_pro)
ggplot(melt_intra) +aes(x=X.1, y=value, fill=variable) +
  geom_bar(stat="identity") +
  scale_fill_manual(values=c("#b1fcf9","#2CF8EF","#07e2d8","#05968f","#035d59","#023734")) +
  coord_flip()+ theme(panel.background = element_rect(fill = "white"))+
  scale_x_discrete(limits = positions)

### barplot for education composition for inter-provincial flowing population by level of residence
melt_inter3 <- melt(inter_pro3)
ggplot(melt_inter3) +aes(x=X.1, y=value, fill=variable) +
  geom_bar(stat="identity") +
  scale_fill_manual(values=c("#b1fcf9","#2CF8EF","#07e2d8","#05968f","#035d59","#023734")) +
  coord_flip() + theme(panel.background = element_rect(fill = "white"))

### barplot for education composition for intra-provincial flowing population by level of residence
melt_intra3 <- melt(intra_pro3)
ggplot(melt_intra3) +aes(x=X.1, y=value, fill=variable) +
  geom_bar(stat="identity") +
  scale_fill_manual(values=c("#b1fcf9","#2CF8EF","#07e2d8","#05968f","#035d59","#023734")) +
  coord_flip() + theme(panel.background = element_rect(fill = "white"))
