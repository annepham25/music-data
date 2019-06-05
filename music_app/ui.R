library(shiny)

ui <- navbarPage(
  theme = "style.css",
  "Music Popularity",
  tabPanel(
    "Overview",
    img(src = "image.jpeg"),
      HTML(
        paste(
          h2("Summary:"),'<br/>',
          p("The dataset we will be working with is the Top Spotify tracks of 2017 from Kaggle.com. This dataset includes the names, artists, Spotify URLs and audio features of tracks. With these audio features we are more able to correlate different features with the popularity of songs. These are more detailed in the questions that we will be addressing in our project. These descriptions of audio features were not collected by Kaggle, but from the Spotify Web API as well as the Spotpy Python Library. Through this project we hope to correlate the more ‘fun’ parts of songs with how popular these songs are. These are themes such as ‘danceability’ and ‘loudness.’ We would expect that higher danceability and loudness would lead to an increase in the popularity of the song, but this project will help us prove and further investigate these hypotheses. Other plots help us visualize just how popular some artists are and showing how often they appear in the top 100 list. Our project is mostly aimed at the younger generation i.e. people under the age of 34. This is because not only are a majority of streaming service users in this age group, but also the majority of artists who would appear in this dataset. 
           "),'<br/>',
          h4("Bar Chart:"),
          p("The first bar chart will allow you to visualize the top 9 most popular songs, and filter through different factors that will allow the user to visualize how the most popular songs exemplify certain characteristics such as Danceability, Tempo, Acousticness, and more!"),
          h4("Plot:"),
          p("The second plot will allow the user to choose different song characteristics and plot them against each other to visualize a distribution."),
          h4("Pie Chart:"),
          p("The third pie chart allows you to visualize in a pie chart the amount of times an artists name appears in the top 100 songs!"),
          h4("Table:"),
          p("The final table allows the user to select how many songs they want to display and then showing that number of the top songs by danceability!"),
          h4("Thank you for using the app!!!")
        )
      )
    ),
  tabPanel("Bar Chart",
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
           titlePanel("Correlation between 2 features"), 
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
  
  tabPanel("Pie Chart",
    titlePanel("Song mood analysis"),
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
    verticalLayout(
      titlePanel("Best songs to dance to"),
      sliderInput("slider", label = "Choose your top songs", min = 0, 
                  max = 20, value = 5),
      
      DT::dataTableOutput("table")
    )
  )
  
)
