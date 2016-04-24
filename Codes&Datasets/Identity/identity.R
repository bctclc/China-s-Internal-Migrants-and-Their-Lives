setwd("E:\\学习相关\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets\\Identity")
#library(devtools)
#install_github("mbojan/alluvial", force=T)
library(alluvial)
library(foreign)
library(reshape2)
library(ggplot2)

raw <- read.dta("identity.dta")
raw$s41 <- as.character(raw$s41)
raw$province[raw$a221==""] <- raw$s41
raw <- subset(raw, raw$a18!="农业户口" | raw$a221!="")
raw$migrant <-1
raw$migrant[raw$a221==""] <- 0
raw$cat[raw$migrant==0] <- 1
raw$cat[raw$migrant==1&raw$a18!="农业户口"] <- 2
raw$cat[raw$migrant==1&raw$a18=="农业户口"] <- 3

raw$rich_poor <- 0
raw$rich_poor[raw$b7a=="富人"] <- 1
raw$rich_poor[raw$b7a=="穷人"] <- -1
raw$cadre_common <- 1
raw$cadre_common[raw$b7b=="说不清"] <- 0
raw$cadre_common[raw$b7b=="群众"] <- -1
raw$urban_rural <- 1
raw$urban_rural[raw$b7c=="说不清"] <- 0
raw$urban_rural[raw$b7c=="乡下人"] <- -1
raw$prop_prol <- 1
raw$prop_prol[raw$b7d=="说不清"] <- 0
raw$prop_prol[raw$b7d=="无产者"] <- -1
raw$manage <- 1
raw$manage[raw$b7e=="说不清"] <- 0
raw$manage[raw$b7e=="被管理者"] <- -1
raw$education <- 1
raw$education[raw$b7f=="说不清"] <- 0
raw$education[raw$b7f=="低学历者"] <- -1
raw$class <- 1
raw$class[raw$b7g=="说不清"] <- 0
raw$class[raw$b7g=="工人阶层"] <- -1

raw$count <- 1
identity <- aggregate( count ~ cat+rich_poor+cadre_common+urban_rural+prop_prol+manage+education+class,
                       data=raw, sum)
identity$color <- "#bcbcbc"
identity$color[identity$cat==2] <- "#2CF8EF"
identity$color[identity$cat==3] <- "#035d59"
alluvial( identity[,2:8], freq=identity$count, border=0,
          gap.width=0.1, col= identity$color, layer=3-identity$cat, 
          hide=identity$count<=20)