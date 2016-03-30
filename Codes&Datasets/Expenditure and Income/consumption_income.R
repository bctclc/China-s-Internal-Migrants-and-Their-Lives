setwd("E:\\—ßœ∞œ‡πÿ\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets\\Expenditure and Income")
library(treemap)

# income tree map
raw <- read.csv("income.csv")
raw <- subset(raw[-8,])

treemap(raw, index=c("level.1", "level.2"), vSize="value", vColor="value",
        palette = c("#EAFEFD", "#035d59"), aspRatio = 1.7,
        overlap.labels=1, force.print.labels=T)

# expenditure tree map
raw <- read.csv("expenditure.csv")
raw <- subset(raw[-17,])

treemap(raw, index=c("level.1", "level.2"), vSize="value", vColor="value",
        palette = c("#EAFEFD", "#035d59"), aspRatio=1.7,
        overlap.labels=1, force.print.labels=T)
