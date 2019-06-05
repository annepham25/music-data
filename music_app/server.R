#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(DT)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # to read the music data
  readData <- reactive({
    data <- read.csv("data/featuresdf.csv")
    data
  })
  
  output$plot <- renderPlot({
    music_data <- readData()
    
    select <- input$select
    select2 <- input$select2

    counts <- as.data.frame(table(music_data[select]))
    names(counts)[1] = "Type"

    counts2 <- as.data.frame(table(music_data[select2]))
    names(counts)[1] = "Type2"

    ggplot(counts, aes(x = Type, y = Type2)) +
      geom_bar(stat = "identity") +
      labs(title = paste0("Number of reported UFOs sorted by ", input$select, " in the ", input$select2),x = select ,y = select2)
  })
  
  output$table <-  DT::renderDataTable({
    table <- raw_dataset %>%  select(artists, name, danceability) %>% 
      arrange(desc(danceability))  %>% top_n(input$slider)
    datatable(table, rownames = FALSE)
    
  })
   
  
  
})
