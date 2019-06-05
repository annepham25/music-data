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
           sidebarLayout(
             sidebarPanel(),
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
  
  tabPanel("Pie",
           sidebarLayout(
             sidebarPanel(),
             mainPanel(
               tabPanel("Pie", plotOutput("pie"))
             )
           )),
  
  
  
  
  
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
