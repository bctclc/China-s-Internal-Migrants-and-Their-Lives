setwd("E:\\—ßœ∞œ‡πÿ\\R\\China-s-Internal-Migrants-and-Their-Lives\\Codes&Datasets\\Healthcare")
library(ggplot2)
library(reshape2)

# barplot on annual health insurance payment
raw <- read.csv("payment_with_one_healthinsurance.csv")
raw <- raw[,c(1,4)]

positions <- c("Rural Cooperatives Medical Insurance",
               "Labor Insurance", "Commercial Medical Insurance",
               "Public Health Insurance",
               "Comprehensive Medical Insurance", "Other")
ggplot(raw, aes(x=X, y=average.health.insurance.payment)) +
  geom_bar(stat = "identity") +
  scale_x_discrete(limits = positions)+
  theme(panel.background = element_rect(fill = "white"),
        panel.border= element_blank())

# stacked barplot on annual medical expenditure
raw <- read.csv("payment_with_one_healthinsurance.csv")
raw <- raw[,c(1,2,3)]
raw <- melt(raw)
ggplot(raw, aes(x=X, y=value, fill=variable)) +
  geom_bar(stat = "identity") +
  scale_x_discrete(limits = positions)+
  scale_fill_manual(values=c("#05968f", "#4fc2bd"))+
  theme(panel.background = element_rect(fill = "white"),
        panel.border= element_blank())

# stacked bar on reasons why people don't have health insurance
raw <- read.csv("reason_for_no_healthcare.csv")

ggplot(raw, aes(x=X, y=value, fill=reason)) +
  geom_bar(stat = "identity") +
  coord_flip()+
  scale_fill_grey()+
  theme(panel.background = element_rect(fill = "white"),
        panel.border= element_blank())
