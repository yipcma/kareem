library(dplyr)
library(readr)
library(lubridate)
library(tmap)

# data reading
dat <- read_csv("data/sample_careem_trip_data.csv")

glimpse(dat)

# data cleaning
dat <- dat %>% mutate(drop_off_time = mdy_hm(drop_off_time), pick_up_time = mdy_hm(pick_up_time))

# data verification (570 incongruencies in duration time)
dat %>% na.omit() %>% mutate(test = (drop_off_time - pick_up_time)/60 != duration_time) %>% summarize(sum(test))

# ignore duration_time and readable_trip_duration and NAs
dat <- dat %>% select(-duration_time, -readable_trip_duration) %>% na.omit()

summary(dat)
