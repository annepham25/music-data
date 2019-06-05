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
  
  raw_dataset <- read.csv("data/featuresdf.csv", stringsAsFactors = FALSE)
  
  output$plot <- renderPlot({
    ggplot(raw_dataset, aes_string(x = input$select1 , y = input$select2)) +
      geom_point() +
      geom_smooth(method = lm)
  })
  
  output$table <-  DT::renderDataTable({
    table <- raw_dataset %>%  select(artists, name, danceability) %>% 
      arrange(desc(danceability))  %>% top_n(input$slider)
    datatable(table, rownames = FALSE)
  })
  
  top_five <- head(raw_dataset, 9)
  top_five$name <- factor(top_five$name, levels = top_five$name)
  
  output$bar <- renderPlot({
    top_five %>%
      ggplot(aes_string(x="name", y=input$factor, fill="name")) +
      geom_bar(stat='identity') +
      theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5)) +
      scale_fill_hue(l=92)
    
  })
  
  output$pie <- renderPlot({
    
  })
  
  
  
  
})