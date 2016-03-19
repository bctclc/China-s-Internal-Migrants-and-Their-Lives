setwd("E:\\—ßœ∞œ‡πÿ\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets")
library(lattice)

# load income data for all
all <- read.csv("income_all.csv")

# create color for different groups (all)
all$color <- ifelse(all$migrants>all$home_locals & all$migrants>all$residence_locals, "#023734",
                    ifelse(all$migrants>all$home_locals & all$migrants<all$residence_locals,"#05968f",
                           ifelse(all$migrants<all$home_locals & all$migrants>all$residence_locals,
                                  "#07e2d8",
                                  ifelse(all$migrants<all$home_locals & all$migrants<all$residence_locals,
                                         "#2CF8EF", "#000000"))))

# parallel line plot for all
parallelplot(all[,4:6], horizontal.axis=F, col=all$color)

#load income data for urban origins
urban <- read.csv("income_urban_origin.csv")

# create color for different groups (urban origins)
urban$color <- ifelse(urban$migrants>urban$home_locals & urban$migrants>urban$residence_locals, "#023734",
                    ifelse(urban$migrants>urban$home_locals & urban$migrants<urban$residence_locals,"#05968f",
                           ifelse(urban$migrants<urban$home_locals & urban$migrants>urban$residence_locals,
                                  "#07e2d8",
                                  ifelse(urban$migrants<urban$home_locals & urban$migrants<urban$residence_locals,
                                         "#2CF8EF", "#000000"))))

# parallel line plot for urban origins
parallelplot(urban[,4:6], horizontal.axis=F, col=urban$color)

# load income data for rural origins
rural <- read.csv("income_rural_origin.csv")

# create color for different groups (rural origins)
rural$color <- ifelse(rural$migrants>rural$home_locals & rural$migrants>rural$residence_locals, "#023734",
                    ifelse(rural$migrants>rural$home_locals & rural$migrants<rural$residence_locals,"#05968f",
                           ifelse(rural$migrants<rural$home_locals & rural$migrants>rural$residence_locals,
                                  "#07e2d8",
                                  ifelse(rural$migrants<rural$home_locals & rural$migrants<rural$residence_locals,
                                         "#2CF8EF", "#000000"))))

# parallel line plot for rural origins
parallelplot(rural[,4:6], horizontal.axis=F, col=rural$color)

# load income data for intra-province floating population
intra <- read.csv("income_intra_province.csv")

# create color for different groups (all)
intra$color <- ifelse(intra$migrants>intra$home_locals & intra$migrants>intra$residence_locals, "#023734",
                    ifelse(intra$migrants>intra$home_locals & intra$migrants<intra$residence_locals,"#05968f",
                           ifelse(intra$migrants<intra$home_locals & intra$migrants>intra$residence_locals,
                                  "#07e2d8",
                                  ifelse(intra$migrants<intra$home_locals & intra$migrants<intra$residence_locals,
                                         "#2CF8EF", "#000000"))))

# parallel line plot for intra-province floating population
parallelplot(intra[,4:6], horizontal.axis=F, col=intra$color)

# load income data for inter-province floating population
inter <- read.csv("income_inter_province.csv")

# create color for different groups (all)
inter$color <- ifelse(inter$migrants>inter$home_locals & inter$migrants>inter$residence_locals, "#023734",
                      ifelse(inter$migrants>inter$home_locals & inter$migrants<inter$residence_locals,"#05968f",
                             ifelse(inter$migrants<inter$home_locals & inter$migrants>inter$residence_locals,
                                    "#07e2d8",
                                    ifelse(inter$migrants<inter$home_locals & inter$migrants<inter$residence_locals,
                                           "#2CF8EF", "#000000"))))

# parallel line plot for inter-province floating population
parallelplot(inter[,4:6], horizontal.axis=F, col=inter$color)

# load income data for males
male <- read.csv("income_male.csv")

# create color for different groups (all)
male$color <- ifelse(male$migrants>male$home_locals & male$migrants>male$residence_locals, "#023734",
                      ifelse(male$migrants>male$home_locals & male$migrants<male$residence_locals,"#05968f",
                             ifelse(male$migrants<male$home_locals & male$migrants>male$residence_locals,
                                    "#07e2d8",
                                    ifelse(male$migrants<male$home_locals & male$migrants<male$residence_locals,
                                           "#2CF8EF", "#000000"))))

# parallel line plot for males
parallelplot(male[,4:6], horizontal.axis=F, col=male$color)

# load income data for females
female <- read.csv("income_female.csv")

# create color for different groups (all)
female$color <- ifelse(female$migrants>female$home_locals & female$migrants>female$residence_locals, "#023734",
                     ifelse(female$migrants>female$home_locals & female$migrants<female$residence_locals,"#05968f",
                            ifelse(female$migrants<female$home_locals & female$migrants>female$residence_locals,
                                   "#07e2d8",
                                   ifelse(female$migrants<female$home_locals & female$migrants<female$residence_locals,
                                          "#2CF8EF", "#000000"))))

# parallel line plot for females
parallelplot(female[,4:6], horizontal.axis=F, col=female$color)

# parallel line plot for individual provinces
province <- subset(all, all$residence=="Anhui")
province[8,] <- 0
province[9,] <- 2240
parallelplot(province[,4:6], horizontal.axis=F, col=province$color)

province <- subset(all, all$residence=="Chongqing")
province[9,] <- 0
province[10,] <- 2000
parallelplot(province[,4:6], horizontal.axis=F, col=province$color)

province <- subset(all, all$residence=="Guangdong")
province[11,] <- 0
province[12,] <- 3000
parallelplot(province[,4:6], horizontal.axis=F, col=province$color)

province <- subset(all, all$residence=="Henan")
province[9,] <- 0
province[10,] <- 3450
parallelplot(province[,4:6], horizontal.axis=F, col=province$color)

province <- subset(all, all$residence=="Hubei")
province[9,] <- 0
province[10,] <- 4167
parallelplot(province[,4:6], horizontal.axis=F, col=province$color)

province <- subset(all, all$residence=="Jiangsu")
province[10,] <- 0
province[11,] <- 2510
parallelplot(province[,4:6], horizontal.axis=F, col=province$color)

province <- subset(all, all$residence=="Shanghai")
province[10,] <- 0
province[11,] <- 3000
parallelplot(province[,4:6], horizontal.axis=F, col=province$color)

province <- subset(all, all$residence=="Sichuan")
province[6,] <- 0
province[7,] <- 1678
parallelplot(province[,4:6], horizontal.axis=F, col=province$color)

province <- subset(all, all$residence=="Zhejiang")
province[10,] <- 0
province[11,] <- 2257
parallelplot(province[,4:6], horizontal.axis=F, col=province$color)