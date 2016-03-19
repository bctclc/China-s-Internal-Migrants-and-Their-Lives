setwd("E:\\—ßœ∞œ‡πÿ\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets")
library(pyramid)

# read in data for the whole population
total <- read.csv("pyramid_total.csv")

# population pyramid for the whole population
pyramid(total, GL=F, Rcol = "white", Lcol = "white")

# read in data for all floating population
floating <- read.csv("pyramid_total_floating.csv")

# population pyramid for all floating population
pyramid(floating, GL=F, Rcol = "#05968f", Lcol = "#05968f")

# read in data for inter-province floating population
inter <- read.csv("pyramid_inter_province.csv")

# population pyramid for all floating population
pyramid(inter, GL=F, Rcol = "#b1fcf9", Lcol = "#b1fcf9")