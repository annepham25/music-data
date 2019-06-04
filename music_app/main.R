
library(dplyr)

# raw_dataset <- read.csv("data/age_dataset.csv", stringsAsFactors = FALSE)
# 
# new_dataset <- raw_dataset %>% filter(hisp.id == "totpop", GEO.display.label != "United States") %>% 
#   select(-hisp.id, -hisp.display.label, -year.id, -GEO.id, -GEO.id2)




library(readr)
music <- read_csv("music_data/data/music.csv")
colnames(music)


