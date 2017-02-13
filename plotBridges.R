library(ggplot2)
library(plyr)
library(choroplethr)
library(dplyr)
library(readr)
library(data.table)

dat = read_csv("C:/data/countyBridgeSummaries_Jill.csv") %>%
  filter(MAINTENANCE_021, MAINTENANCE_021 == 1)

ggplot(data = dat, mapping = aes(y = count, x = year)) +
  geom_line()

dat = read_csv("C:/data/countyBridgeSummaries_Jill.csv") %>%
  filter(MAINTENANCE_021, MAINTENANCE_021 == 2)

ggplot(data = dat, mapping = aes(y = count, x = year)) +
  geom_line()