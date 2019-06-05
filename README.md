# Music Data
## Click [HERE](https://marwa10.shinyapps.io/music_app/) to access the app!
### How the app works:
#### This is an interactive visual display of music data pulled from [Kaggle.com!](https://www.kaggle.com/nadintamer/top-tracks-of-2017?fbclid=IwAR0JMLruUXRQSuFSFHP95vAEg8XoAakttjmohRvMV43EZzuoDEYwjucOtto)
#### When you open to the app you have a couple of options and you can select which graph you want to look at by clicking through the tabs at the top of the app!

 * How do the most popular songs show popularity?
    + The first bar chart will allow you to visualize the top 9 most popular songs, and filter through different factors that will allow the user to visualize how the most popular songs exemplify certain characteristics such as Danceability, Tempo, Acousticness, and more!
 * How do all the songs in the dataset exemplify certain characteristics?
    + The second plot will allow the user to choose different song characteristics and plot them against each other to visualize a distribution.
 * Are certain artists more popular than others?
    + The third pie chart allows you to visualize in a pie chart an input amount of the users choice anywhere from 0-100 songs, and will display fraction(s) of those songs by mood
 * What songs can I dance to?
    + The final table allows the user to select how many songs they want to display and then showing that number of the top songs by danceability!

### The Columns:
* Song ID:
    + The Spotify URL of a song.
* Name:
    + The name of a song.
* Artist(s):
    + The artist(s) in a song.
* Danceability:
    + How suitable a track is for dancing based on a combination of musical elements.
* Energy:
    + A measure (from 0-1) that describes a measure of intensity and activity.
* Key:
    + What key the song is in (by number) with 0 being C, 1 is C#, 3 is D and so on.
* Loudness:
    + How 'loud' a song is (measured in decibels)
* Mode:
    + Indicates the modality (major or minor and represented in 0s and 1s respectively) of a track.
* Speechiness:
    + Detects how often there are words in the track (0-1 with .66ish being absolutely all speech)
* Acousticness:
    + How likely it is that the track is fully acoustic with 1.0 being very confident that the track is acoustic.
* Instrumentaless:
    + Can predict how likely it is that a track contains vocals or not. In this context certain vocal noises like "ooh, ahh" are treated as instrumental sounds.
* Liveness:
    + Can detect the presence of a live audience in the background of a song track. a value of .8+ is a strong likelihood that a track is live.
* Valence:
    + A measure of the 'musical positveness' conveyed by a track. a higher valence closer to 1 indicates that a song is more positive i.e. 'happy' or 'cheerful'
* Tempo:
    + The overall estimated tempo of a track in BPM, this is the pace or speed of a song.
* Duration:
    + How many milliseconds long the track is.
 duration_msThe duration of the track in milliseconds.
* Time Signature:
    + The time signature ex. 4/4 or 3/4 of the song.
