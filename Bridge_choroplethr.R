library(readr)
library(ggplot2)

install.packages("ggplot2")
install.packages("plyr")
install.packages("choroplethr")
install.packages("dplyr")

library(plyr)
library(choroplethr)
library(dplyr)
library(readr)
library(data.table)

bridges = read_csv("http://pages.stat.wisc.edu/~karlrohe/classes/data/countyBridgeSummaries.csv")

str(bridges)

(total_mean = mean(bridges$good))

bridges %>% group_by(fips) %>% summarize(mean = mean(good)) %>%
  mutate(condition = ifelse(mean > total_mean, 1, 2)) %>%
  transmute(region = fips, value = condition) %>%
  county_choropleth()

bridges %>% group_by(fips) %>% summarize(mean = mean(good, na.rm=TRUE)) %>%
  mutate(condition = ifelse(mean > total_mean, 1, 2)) %>%
  transmute(region = fips, value = condition) %>%
  county_choropleth(legend = "bridge condition")



