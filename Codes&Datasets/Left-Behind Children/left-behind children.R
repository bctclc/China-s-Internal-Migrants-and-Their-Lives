setwd("C:\\Users\\fdp8\\Downloads")
library(descr)
library(reshape2)

raw <- read.csv("left-behind children.csv")
raw <- raw[-(8:10),]

melted <- melt(raw, id.vars=c("parents", "living.arrangement"))
melted$count <- 1
melted$value <- melted$value*10000


crosstab(melted$living.arrangement, melted$variable, melted$value)
