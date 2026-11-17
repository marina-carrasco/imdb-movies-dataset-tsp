install.packages(c("tibble", "dplyr"))
library(tibble)
library(dplyr)


movies <- read.csv(file="imdb_top_1000.csv", na.strings = c("", "NA"))
movies

movtib <- tibble(movies, )
movtib <- movtib[complete.cases(movtib),]
movtib

mutate(Gross = as.integer(Gross))

# Data cleaning
filter(movtib, Gross>=0)
