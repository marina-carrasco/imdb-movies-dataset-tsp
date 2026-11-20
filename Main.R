install.packages(c("tibble", "dplyr"))
library(tibble)
library(dplyr)

# Data Loading
movies <- read.csv(file="imdb_top_1000.csv", na.strings = "")
movtib <- tibble(movies)

# Data Cleaning
  # Missing Values
movtib <- na.omit(movtib)
movtib <- filter(movtib, Gross >= 0 & Released_Year >= 1888 & Released_Year <= 2026
                 & IMDB_Rating >= 0 & IMDB_Rating <= 10 & Meta_score >= 0 & Meta_score <= 100
                 & No_of_Votes >= 0)

  # Correcting Types
movtib <- mutate(movtib, Gross = as.numeric(gsub(",", "", Gross)))
#Convertir runtime a int????
#Released Year a date
#Certificate factor

  # Outliers

  # Duplicates And Inconsistencies


#Para ver la info bien
View(movtib)

