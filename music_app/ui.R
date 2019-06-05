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
  tabPanel("Bar chart",
           titlePanel("Music Features Impact on Top 9 Song's Popularity"),
           sidebarLayout(
             sidebarPanel(
               radioButtons("factor", "Please pick a music feature:", 
                  choices = c("danceability", "duration_ms", "time_signature", "tempo", "acousticness"))
             ),
             mainPanel(
               tabPanel("bar", plotOutput("bar"))
             )
             )
           ),
  
  
  
  tabPanel("Plot",
           sidebarLayout(
             sidebarPanel(
               selectInput("select1", label =("choose first variable"), 
                           choices = c("energy", "speechiness", "acousticness", "tempo",
                                       "loudness", "instrumentalness", "danceability", "liveness")),
               selectInput("select2", label =("choose second variable"), 
                           choices = c("energy", "speechiness", "acousticness", "tempo",
                                       "loudness", "instrumentalness", "danceability", "liveness"))
             ),
             mainPanel(
               tabPanel("Plot", plotOutput("plot"))
             )
           )
  ),
  
  tabPanel(
    "Song mood analysis",
    sidebarLayout(
      sidebarPanel(
        sliderInput("num", label = h3("number of input songs"), min = 5,
                    max = 100, value = 50)
      ),
      mainPanel(
        tabPanel("pie", plotOutput("pie"))
      )
    )
  ),
  
  tabPanel(
    "Table",
    sidebarLayout(
      sidebarPanel(
        sliderInput("slider", label = "Best songs to dance to", min = 0, 
                    max = 20, value = 5)
      ),
      mainPanel(
          tabPanel("Table",  DT::dataTableOutput("table"))
      )
    )
  )
  
)
