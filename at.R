library(tidyverse)

library(scales)
library(janitor)


artwork <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-12/artwork.csv')
artists <- readr::read_csv("https://github.com/tategallery/collection/raw/master/artist_data.csv")



artists %>% filter(gender == "NA")
artists %>% ggplot(aes(yearOfBirth)) + geom_histogram()
artists %>% count(placeOfBirth, sort = T)

artists %>% filter(!is.na(placeOfBirth)) %>% count(placeOfBirth, sort=T) %>% 
  head(20) %>% ggplot(aes(x=placeOfBirth, y=n)) + geom_col() + coord_flip()


artists %>% filter(!is.na(placeOfBirth)) %>% count(placeOfBirth, sort=T) %>% 
  head(20) %>% mutate(placeOfBirth = fct_reorder(placeOfBirth, n))    %>% ggplot(aes(x=placeOfBirth, y=n)) + geom_col() + coord_flip()

artists %>% filter(!is.na(placeOfBirth)) %>% count(placeOfBirth, sort=T) %>% 
  head(20) %>% mutate(placeOfBirth = fct_reorder(placeOfBirth, n)) %>% ggplot(aes(x=placeOfBirth, y=n, fill = placeOfBirth)) + geom_col() + coord_flip()


artists %>% filter(!is.na(placeOfBirth)) %>% 
separate(placeOfBirth, c("city", "country"), sep =",")



%>% count(placeOfBirth, sort=T) %>% 
  head(20) %>% mutate(placeOfBirth = fct_reorder(placeOfBirth, n)) %>% ggplot(aes(x=placeOfBirth, y=n, fill = placeOfBirth)) + geom_col() + coord_flip()

artists %>% filter(!is.na(placeOfBirth)) %>% 
  count(placeOfBirth, sort=T) %>% 
  head(20) %>% 
  separate(placeOfBirth, c("city", "country"), sep =",", remove = FALSE) %>% 
  mutate(placeOfBirth = fct_reorder(placeOfBirth, n)) %>% 
  ggplot(aes(x=placeOfBirth, y=n, fill = country)) + geom_col() + coord_flip()


artists %>% filter(!is.na(placeOfBirth)) %>% 
  count(placeOfBirth, sort=T) %>% 
  head(20) %>% 
  separate(placeOfBirth, c("city", "country"), sep =",", remove = FALSE, fill = "right") %>% 
  mutate(placeOfBirth = fct_reorder(placeOfBirth, n)) %>% 
  ggplot(aes(x=placeOfBirth, y=n, fill = country)) + geom_col() + coord_flip() + 
  labs(title = "artists in tate", fill = "Country they are from", y= "", x= "Place of birth")


places <- artists %>% filter(!is.na(placeOfBirth)) %>% 
  count(placeOfBirth, sort=T) %>% 
  head(20) %>% 
  separate(placeOfBirth, c("city", "country"), sep =",", remove = FALSE, fill = "right")

places <- artists %>% filter(!is.na(placeOfBirth)) %>% 
  count(placeOfBirth, sort=T) %>% 
  separate(placeOfBirth, c("city", "country"), sep =",", remove = FALSE, fill = "right")


