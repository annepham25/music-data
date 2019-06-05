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
               tabPanel("bar", plotOutput("bar")),
               HTML(
                 paste(
                   p("The bar chart above represents the top 9 songs out of 100 in 2017 of the Spotify dataset. It allows the user to choose which feature they are interested in seeing how it plays a role in a song’s popularity."),
                  p("Some interesting results we observed was that the time signature of a song doesn’t really have an impact on how popular a song is. We noticed this because for the top 9 songs, the time signature of all of them were the exact same. When the acousticness feature is picked, it is interesting to see that the top song, “Shape of You”, has a very high acousticness level, but the other songs don’t really have nearly as high of a result. It’s cool to see that one song was able to thrive on acousticness, while the others didn’t need it to become popular. The other features in general have relatively similar results which it’s cool to see the similarities across the top 9 popular songs")
                   )
               )
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
               tabPanel("Plot", plotOutput("plot")),
               HTML(
                 paste(
                   p("This plot outputs the correlation between 2 features.
                      The user has the ability to choose whichever feature he wants to see.
                     According to the outputs, we noticed some interesting results, such as danceability and energy are negatively correlated which means if one of them increases, the other decrease.
                     Another interesting result was  the graph of danceability vs energy showed no correlation which is surprising as we always associate dance with intense activity(energy).")
                 )
               )
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
        tabPanel("pie", plotOutput("pie"),
        HTML(
          paste(
            p(
              "One of the function in our final project is song mood analysis. The mood is based on professionally calculated valence value for each song in our database. The valence values are ranging from 0 to 1. The larger the value the happier the song. I classified songs in to difference mood based on the valence value they have: very sad songs(0-0.2), sad songs(0.2-0.4),neutral songs(0.4-0.6), happy songs(0.6-0, very happy songs(0.8-1). The question answered for this section is that for top 100 songs in 2017, how many percentage of the songs account for each mood. The user can adjust how many input songs to be considered in this analysis. With the help of shiny widget, user can scroll the side bar and select number of songs from 5 - 100 with ease. The data is visualized by a pie chart to show the percentage of each mood that take place in the number of songs selected."
            )
          )
        )
        )
        
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
    ),
    HTML(
      paste(
        p("This table will let you output the number of songs you choose ordered by their danceability.
          The minimum song you can choose is 0 and the maximum is 20.
          Thanks to this table, you can also search for your favorite song in 2017 and see if it made the list of the top songs you can dance to.")
      )
    )
  )
)
