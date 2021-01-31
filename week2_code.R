#install.packages(tidyverse) note: only need this if you don't have this package installed!
library(tidyverse)


artwork <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-12/artwork.csv')
artists <- readr::read_csv("https://github.com/tategallery/collection/raw/master/artist_data.csv")

artists %>% View() 


artists %>% count(gender, sort = TRUE)

artists %>% filter(is.na(gender)) %>% View()
artists %>% ggplot(aes(x=yearOfBirth)) + geom_histogram()

artists %>% count(placeOfBirth, sort = TRUE) %>% ggplot(aes(x= placeOfBirth, y = n)) + geom_col() + coord_flip()


artists %>% filter(!is.na(placeOfBirth))  %>% count(placeOfBirth, sort = TRUE) %>% head(25)  %>% ggplot(aes(x= placeOfBirth, y = n)) + geom_col() + coord_flip()


artists %>% filter(!is.na(placeOfBirth))  %>% count(placeOfBirth, sort = TRUE) %>% head(25) %>% mutate(placeOfBirth = fct_reorder(placeOfBirth,n ))   %>% ggplot(aes(x= placeOfBirth, y = n)) + geom_col() + coord_flip()

artists %>% filter(!is.na(placeOfBirth))  %>% count(placeOfBirth, sort = TRUE) %>% head(25) %>% mutate(placeOfBirth = fct_reorder(placeOfBirth,n ))   %>% ggplot(aes(x= placeOfBirth, y = n, fill = placeOfBirth)) + geom_col() + coord_flip()

artists %>% filter(!is.na(placeOfBirth))  %>% count(placeOfBirth, sort = TRUE) %>% head(25) %>% 
  separate(col = placeOfBirth, into = c("city", "country"), remove = FALSE, fill = "right") %>% mutate(placeOfBirth = fct_reorder(placeOfBirth,n ))   %>% ggplot(aes(x= placeOfBirth, y = n, fill = country)) + geom_col() + coord_flip()



artists %>% filter(!is.na(placeOfBirth))  %>% count(placeOfBirth, sort = TRUE) %>% 
  separate(col = placeOfBirth, into = c("city", "country"), remove = FALSE, fill = "right") %>% count(country, sort=T)

artwork %>% count(artist, sort = T)  %>%  head(30) %>% ggplot(aes(x= artist, y = n)) + geom_col() + coord_flip()
