install.packages(c("tibble"))
library(tibble)
movies <- read.csv(file="imdb_top_1000.csv",)
movies

movtib <- tibble(movies)
movtib
