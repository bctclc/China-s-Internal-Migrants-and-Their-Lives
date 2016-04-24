setwd("E:\\学习相关\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets\\Class")
library(foreign)
library(reshape2)
library(ggplot2)


raw <- read.dta("class.dta")
raw$s41 <- as.character(raw$s41)
raw$province[raw$a221==""] <- raw$s41
raw <- subset(raw, raw$a18!="农业户口" | raw$a221!="")
raw$migrant <-1
raw$migrant[raw$a221==""] <- 0

general <- data.frame(cat=c("MMale", "MFemale", "LMale", "LFemale"))
general$before <- 0
general[1,2] <- mean(raw$a43b[raw$a2=="男"&raw$migrant==1])
general[2,2] <- mean(raw$a43b[raw$a2=="女"&raw$migrant==1])
general[3,2] <- mean(raw$a43b[raw$a2=="男"&raw$migrant==0])
general[4,2] <- mean(raw$a43b[raw$a2=="女"&raw$migrant==0])
general$now <- 0
general[1,3] <- mean(raw$a43a[raw$a2=="男"&raw$migrant==1])
general[2,3] <- mean(raw$a43a[raw$a2=="女"&raw$migrant==1])
general[3,3] <- mean(raw$a43a[raw$a2=="男"&raw$migrant==0])
general[4,3] <- mean(raw$a43a[raw$a2=="女"&raw$migrant==0])
general$later <- 0
general[1,4] <- mean(raw$a43c[raw$a2=="男"&raw$migrant==1])
general[2,4] <- mean(raw$a43c[raw$a2=="女"&raw$migrant==1])
general[3,4] <- mean(raw$a43c[raw$a2=="男"&raw$migrant==0])
general[4,4] <- mean(raw$a43c[raw$a2=="女"&raw$migrant==0])

melt_gen <- melt(general)
melt_gen$var <- 0
melt_gen$var[melt_gen$variable=="before"] <- 10
melt_gen$var[melt_gen$variable=="now"] <- 20
melt_gen$var[melt_gen$variable=="later"] <- 30
melt_gen$var[(melt_gen$cat=="LFemale" | melt_gen$cat=="MFemale") 
             & melt_gen$variable=="before"] <- 13
melt_gen$var[(melt_gen$cat=="LFemale" | melt_gen$cat=="MFemale")
             & melt_gen$variable=="now"] <- 23
melt_gen$var[(melt_gen$cat=="LFemale" | melt_gen$cat=="MFemale")
             & melt_gen$variable=="later"] <- 33
ggplot(melt_gen, aes(x=var, y=value, color=cat)) +
  geom_step(size=1.5)+
  theme(legend.position="right",panel.background = element_rect(fill = "white"),
        panel.border= element_blank())+
  geom_text(aes(label = round(value,2)), size = 5)

## urban origin vs rural origin
migrant <- subset(raw, raw$migrant==1)
bothm <- data.frame(cat=c("RMale", "RFemale", "UMale", "UFemale"))
bothm$before <- 0
bothm[1,2] <- mean(migrant$a43b[migrant$a2=="男"&migrant$a18=="农业户口"])
bothm[2,2] <- mean(migrant$a43b[migrant$a2=="女"&migrant$a18=="农业户口"])
bothm[3,2] <- mean(migrant$a43b[migrant$a2=="男"&migrant$a18!="农业户口"])
bothm[4,2] <- mean(migrant$a43b[migrant$a2=="女"&migrant$a18!="农业户口"])
bothm$now <- 0
bothm[1,3] <- mean(migrant$a43a[migrant$a2=="男"&migrant$a18=="农业户口"])
bothm[2,3] <- mean(migrant$a43a[migrant$a2=="女"&migrant$a18=="农业户口"])
bothm[3,3] <- mean(migrant$a43a[migrant$a2=="男"&migrant$a18!="农业户口"])
bothm[4,3] <- mean(migrant$a43a[migrant$a2=="女"&migrant$a18!="农业户口"])
bothm$later <- 0
bothm[1,4] <- mean(migrant$a43c[migrant$a2=="男"&migrant$a18=="农业户口"])
bothm[2,4] <- mean(migrant$a43c[migrant$a2=="女"&migrant$a18=="农业户口"])
bothm[3,4] <- mean(migrant$a43c[migrant$a2=="男"&migrant$a18!="农业户口"])
bothm[4,4] <- mean(migrant$a43c[migrant$a2=="女"&migrant$a18!="农业户口"])

melt_m <- melt(bothm)
melt_m$var <- 0
melt_m$var[melt_m$variable=="before"] <- 10
melt_m$var[melt_m$variable=="now"] <- 20
melt_m$var[melt_m$variable=="later"] <- 30
melt_m$var[(melt_m$cat=="UFemale" | melt_m$cat=="RFemale") 
             & melt_m$variable=="before"] <- 13
melt_m$var[(melt_m$cat=="UFemale" | melt_m$cat=="RFemale")
             & melt_m$variable=="now"] <- 23
melt_m$var[(melt_m$cat=="UFemale" | melt_m$cat=="RFemale")
             & melt_m$variable=="later"] <- 33
ggplot(melt_m, aes(x=var, y=value, color=cat)) +
  geom_step(size=1.5)+
  theme(legend.position="right",panel.background = element_rect(fill = "white"),
        panel.border= element_blank())+
  geom_text(aes(label = round(value,2)), size = 5)


