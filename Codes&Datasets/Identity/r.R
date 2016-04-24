setwd("C:\\Users\\fdp8\\Desktop\\March\\Incarcerated\\NYLS\\NEW")
library(foreign)
library(ggplot2)
library(reshape2)
library(stringr)
library(devtools)
install_github("mbojan/alluvial", force=T)
library(alluvial)
raw <- read.csv("default.csv")

# remove people who are never incarcerated
raw <- subset(raw, raw$incar!=-4)

# remove females
raw <- subset(raw, raw$sex==1)

#recode employment status
for (i in 1:1073) {
  raw[,i] <- ifelse(raw[,i]==1 | raw[,i]==5, -1, 
                         ifelse(raw[,i]==2, 0, 
                                ifelse(raw[,i]==3 | raw[,i]>=7, 1,
                                       ifelse(raw[, i]==4, 0, NA))))
}

# melt into long table
employment_status <- melt(raw, id=c("incar", "length","id", "sex","birth_year"),na.rm=T)
employment_status$variable <- as.character(employment_status$variable)
employment_status$ref_week <- substring(employment_status$variable,2)
employment_status$ref_week <- as.numeric(employment_status$ref_week)

#calculate for month of release
employment_status$incar_order <- employment_status$incar%/%100*12+ employment_status$incar%%100
employment_status$release_order <- employment_status$incar_order+employment_status$length
employment_status$release <- ifelse(employment_status$release_order%%12==0,
  employment_status$release_order%/%12*100+employment_status$release_order%%12-88,
  employment_status$release_order%/%12*100+employment_status$release_order%%12)

#calculate week of release (last week of the month of release) and the difference between
#week of release and reference week
mer <- read.csv("merge.csv")
employment_status <- merge(employment_status, mer, by = "release")
employment_status$Continuous..Week.Number <- as.numeric(employment_status$Continuous..Week.Number)
employment_status$after <- employment_status$ref_week - employment_status$Continuous..Week.Number
colnames(employment_status)[12] <- "release_week"

#calculate one week before incarceration
employment_status$before_incar <- ifelse(employment_status$incar%%100==1, 
                                         employment_status$incar-89, 
                                         employment_status$incar-1)
colnames(mer)[2] <- "before_incar"
employment_status <- merge(employment_status, mer, by="before_incar")
colnames(employment_status)[15] <- "before_incar_week"

#keep reference weeks that are within one month (four weeks) after week of release
#or the week before incarceration
after_incar <- subset(employment_status, 
                      (employment_status$after>=1 & employment_status$after<=4)|
                        employment_status$ref_week==employment_status$before_incar_week)

#create subsets for each week after release
one <- subset(after_incar, after_incar$after==1)
one <- one[,c(5,9)]
colnames(one)[2] <- "one"
two <- subset(after_incar, after_incar$after==2)
two <- two[,c(5,9)]
colnames(two)[2] <- "two"
three <- subset(after_incar, after_incar$after==3)
three <- three[,c(5,9)]
colnames(three)[2] <- "three"
four <- subset(after_incar, after_incar$after==4)
four <- four[,c(5,9)]
colnames(four)[2] <- "four"
before <- subset(after_incar, after_incar$ref_week==after_incar$before_incar_week)
before <- before[,c(5,9)]
colnames(before)[2] <- "before"

#merge these subsets
after_incar2 <- merge(before, one, by="id")
after_incar2 <- merge(after_incar2, two, by="id")
after_incar2 <- merge(after_incar2, three, by="id")
after_incar2 <- merge(after_incar2, four, by="id")
after_incar2$count <- 1

#create aggregated dataset for graph
## color by employment status before incarceration
after_incar3 <- aggregate( count ~ before + one + two + three + four, data=after_incar2, sum)
after_incar3$color <- "#5e5e5e"
after_incar3$color[after_incar3$before==1] <- "#D8D2C4"
after_incar3$color[after_incar3$before==-1] <- "red"
## color by employment status of the first week after release
after_incar4 <- aggregate(count ~ one + two + three + four, data=after_incar2, sum)
after_incar4$color <- "#5e5e5e"
after_incar4$color[after_incar4$one==1] <- "#D8D2C4"
after_incar4$color[after_incar4$one==-1] <- "red"

#GRAPH!
## color by employment status before incarceration
alluvial( after_incar3[,1:5], freq=after_incar3$count, xw=0.0, alpha=0.6,
          gap.width=0.1, col= after_incar3$color)
## color by employment status of the first week after release
alluvial( after_incar4[,1:4], freq=after_incar4$count, xw=0.0, alpha=0.7,
          gap.width=0.1, col= after_incar4$color)
## ## color by employment status of the first week after release, curve
alluvial( after_incar4[,1:4], freq=after_incar4$count, alpha=0.7,
          gap.width=0.1, col= after_incar4$color)