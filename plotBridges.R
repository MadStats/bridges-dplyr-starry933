library(ggplot2)
library(plyr)
library(choroplethr)
library(dplyr)
library(readr)
library(writer)
library(data.table)
library(reshape)

dat1 = read_csv("C:/data/countyBridgeSummaries_Jill.csv") %>%
  filter(MAINTENANCE_021, MAINTENANCE_021 == 1)

year = dat1[["year"]]
print(year)
state_highway = dat1[["count"]]

dat2 = read_csv("C:/data/countyBridgeSummaries_Jill.csv") %>%
  filter(MAINTENANCE_021, MAINTENANCE_021 == 2)
county_highway = dat2[["count"]]

dat3 = read_csv("C:/data/countyBridgeSummaries_Jill.csv") %>%
  filter(MAINTENANCE_021, MAINTENANCE_021 == 3)
town_highway = dat3[["count"]]

dat4 = read_csv("C:/data/countyBridgeSummaries_Jill.csv") %>%
  filter(MAINTENANCE_021, MAINTENANCE_021 == 4)
city_highway = dat4[["count"]]

dat5 = read_csv("C:/data/countyBridgeSummaries_Jill.csv") %>%
  filter(MAINTENANCE_021, MAINTENANCE_021 == 64)
USFS= dat5[["count"]]

dat6 = read_csv("C:/data/countyBridgeSummaries_Jill.csv") %>%
  filter(MAINTENANCE_021, MAINTENANCE_021 == 66)
NPS = dat6[["count"]]

df = data.frame(year, state_highway, county_highway, town_highway, city_highway, USFS, NPS)

ggplot(df, aes(x = year, y=count)) +
  geom_line(aes(y = state_highway, color = "state_highway")) +
  geom_line(aes(y = county_highway, color = "county_highway")) +
  geom_line(aes(y = town_highway, color = "town_highway")) +
  geom_line(aes(y = city_highway, color = "city_highway")) +
  geom_line(aes(y = USFS, color = "USFS")) +
  geom_line(aes(y = NPS, color = "NPS")) 
  