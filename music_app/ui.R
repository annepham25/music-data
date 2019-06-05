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
        selectInput("select1", label =("choose first variable"), 
                    choices = c("energy", "speechiness", "acousticnes", "tempo",
                                   "loudness", "instrumentalness", "danceability", "liveness")),
        selectInput("select2", label =("choose second variable"), 
                    choices = c("energy", "speechiness", "acousticnes", "tempo",
                                   "loudness", "instrumentalness", "danceability", "liveness")),
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
