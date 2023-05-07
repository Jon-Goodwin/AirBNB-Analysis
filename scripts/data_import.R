# Loading packages
library(tidyverse)
library(here)


# Reading in CSV
data  <- read_csv(here("inputs//listings_gz.csv"))

# Data Preparation

data1 <- data %>% mutate(room_type = as.factor(room_type))
data1 <- data1  %>%
  mutate(license = as.factor(license))
data1 <- data1 %>%
  filter(number_of_reviews > 0)
data1 <- data1 %>%
  filter(availability_365 > 0)
data1 <- data1 %>%
  mutate(price = parse_number(price))
data1 <- data1 %>%
  filter(!is.na(bedrooms & !is.na))
write_csv(data1, file = here("inputs/data_prep.csv"))

data2 <- read_csv(here("inputs//listings.csv"))

data2 <- data2 %>%
  select(-neighbourhood_group)

data2 %>% names()
