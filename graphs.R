library(dplyr)
library(ggplot2)
library(DT)
raw_dataset <- read.csv("data/featuresdf.csv", stringsAsFactors = FALSE)

list <- c("tempo")
# ggplot(raw_dataset)+
#   geom_bar(mapping = aes(x = name, y = danceability), stat = "identity")

plot <- ggplot(raw_dataset, aes(x = list[1], y = danceability)) +
         geom_point() +
          geom_smooth(method = lm)



table <- raw_dataset %>%  select(artists, name, danceability) %>%  arrange(desc(danceability)) %>% top_n(3)
datatable(table, rownames = FALSE)



  


