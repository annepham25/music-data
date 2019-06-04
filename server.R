# MUSIC
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  readData <- reactive({
    data <- read.csv("data/featuresdf.csv")
    data
  })
  
  output$plot <- renderPlot({
    ggplot(readData()) +
      geom_bar(mapping = aes(x = name, y = danceability, stat = "identity"))
  })
})