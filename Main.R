install.packages(c("tibble", "dplyr"))
library(tibble)
library(dplyr)


movies <- read.csv(file="imdb_top_1000.csv", na.strings = c("", "NA"))
movies

movtib <- tibble(movies, )
movtib <- movtib[complete.cases(movtib),]
movtib

movtib <- mutate(movtib, Gross = as.numeric(gsub(",", "", Gross)))
# Data cleaning
View(filter(movtib, Gross >= 0))