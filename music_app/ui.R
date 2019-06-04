

library(shiny)




ui <- navbarPage(
  "Music Popularity",
  tabPanel(
    "Overview",
    sidebarLayout(
      sidebarPanel(
        p(""),
        p(""),
        textOutput("summaryText")
        
        
        ),
      mainPanel(
        plotOutput("")
      )
    )
  ),
  
  tabPanel(
    "Data Analysis",
    sidebarLayout(
      sidebarPanel(
        selectInput("select", label =("choose first variable"), 
                    choices = list("Energy" = 1, "Speechiness" = 2, "Acousticnes" = 3, "Tempo" = 4,
                                   "Loudness" = 5, "Instrumentalness" = 6, "Danceability" = 7, "Liveness" = 8), 
                    selected = 1),
        selectInput("select2", label =("choose second variable"), 
                    choices = list("Energy" = 1, "Speechiness" = 2, "Acousticnes" = 3, "Tempo" = 4,
                                   "Loudness" = 5, "Instrumentalness" = 6, "Danceability" = 7, "Liveness" = 8),
                    selected = 4),
        sliderInput("slider", label = "Best songs to dance to", min = 0, 
                    max = 20, value = 5)
   
      ),
      mainPanel(
        tabsetPanel(
          tabPanel("Plot", plotOutput("plot")),
          tabPanel("Table",  DT::dataTableOutput("table"))
          
        
        )
      )
    )
  )
)
