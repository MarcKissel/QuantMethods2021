#eda

library(tidyverse)
library(readxl)
germany <- read_xlsx("data/Germany - NSDAP Cabinet - 1933-1945.xlsx")
hungary <- read_xlsx("data/Hungary - MSzMP Politburo - 1947-90.xlsx")
poland <- read_xlsx("data/Poland - PZPR Politburo - 1944-1989.xlsx") #
################
germany
poland
hungary


germany <- read_xlsx("data/Germany - NSDAP Cabinet - 1933-1945.xlsx") %>%  janitor::clean_names()
hungary <- read_xlsx("data/Hungary - MSzMP Politburo - 1947-90.xlsx") %>% janitor::clean_names()
poland <- read_xlsx("data/Poland - PZPR Politburo - 1944-1989.xlsx") %>% janitor::clean_names()


colnames(poland) == colnames(germany)
bind_rows(poland, germany)


#what is going on. lets first fix the differnt types
# germany <- germany %>% mutate(reg_start = as.character(reg_start),
#                    reg_end = as.character(reg_end))
# 
# 

# fix poland

View(poland)


poland <- read_xlsx("data/Poland - PZPR Politburo - 1944-1989.xlsx", na = "?") %>% janitor::clean_names()



##################
# poland %>% mutate(elite_reenter = parse_datetime(elite_reenter)) %>% View()
# 
# 
# poland <- read_xlsx("data/Poland - PZPR Politburo - 1944-1989.xlsx", col_types = cols(ELITE_REENTER = col_datetime()))
# 
# ###
# poland <- read_csv("data/pol.csv", col_types = cols(ELITE_REENTER = col_date()))
# ######
# 
# ####


gh <- bind_rows(germany, hungary)
gh





############
poland
colnames(poland)
colnames(germany)
colnames(hungary) == colnames(poland)

hungary <- hungary %>% mutate(country = "Hungary")
poland <- poland %>% mutate(country = "Poland") %>% mutate(ELITE_REENTER = xx)


#join

bind_rows(hungary, poland)
# Error: Can't combine `..1$ELITE_REENTER` <datetime<UTC>> and `..2$ELITE_REENTER` <character>.
View(poland)
#i edtied new dataset to fix ploand whic has a ? in one entry. thnk about how to fix in R?
#poland <- read_xlsx("data/Poland - PZPR Politburo - 1944-1989(b).xlsx")


###
hungary
View(hungary)
