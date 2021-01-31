gender <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-19/gender.csv')
crops <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-19/crops.csv')
households <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-19/households.csv')


gender %>% summarise_at(vars(Male, Female, Intersex), list(total =sum, mean = mean, median = median))
households %>% summarise_at(vars(Population, NumberOfHouseholds, 
                                 AverageHouseholdSize), 
                            list(total = sum, mean = mean, median = median)) %>% View()

clean <- crops %>% janitor::clean_names() %>% pivot_longer(tea:khat_miraa,names_to = "crop", values_to = "count")

clean  %>% mutate(sub_county = str_to_title(sub_county))

clean  %>% mutate(sub_county = str_to_title(sub_county)) %>% filter(!is.na(farming)) %>% ggplot(aes(x=crop, y = count)) + 
  geom_col() + facet_wrap(~sub_county, scales = "free_y")
