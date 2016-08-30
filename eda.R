library(dplyr)
library(readr)
library(lubridate)

# data reading
dat <- read_csv("data/sample_careem_trip_data.csv")

glimpse(dat)

# data cleaning
dat %>% mutate(drop_off_time = mdy_hm(drop_off_time), pick_up_time = mdy_hm(pick_up_time))
