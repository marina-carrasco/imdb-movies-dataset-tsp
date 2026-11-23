install.packages(c("tibble", "dplyr", "shiny"))
library(shiny)
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

  # Outliers




  # Duplicates And Inconsistencies




# Data Tansformation

  # Correcting Types
movtib <- mutate(movtib, Gross = as.numeric(gsub(",", "", Gross)))
#Convertir runtime a int????

movtib <- mutate(movtib, Runtime = as.integer(gsub("min", "", Runtime)))


#Released Year a date
#Certificate factor
#Convertir las estrellas en un c()???


# Web App
ui <- fluidPage(
  "imdb movies",
  selectInput("color", "Choose a color", choices = c("pink", "purple", "gray")),
  plotOutput("hist")
)

server <- function(input, output, session) {
  output$hist <- renderPlot({
    hist(movtib$Gross, main= "Movies by gross income", col = input$color)
  })
}

shinyApp(ui, server)

#Para ver la info bien
View(movtib)

