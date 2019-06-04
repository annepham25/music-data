library(dplyr)
library(ggplot2)

raw_dataset <- read.csv("data/featuresdf.csv", stringsAsFactors = FALSE)

ggplot(raw_dataset)+
  geom_bar(mapping = aes(x = name, y = danceability), stat = "identity")
