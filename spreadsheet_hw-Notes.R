###
# from https://www.dataquest.io/blog/load-clean-data-r-tidyverse/
library(tidyverse)
library(readxl) # Load Excel files
brooklyn <- read_excel("datasets/rollingsales_brooklyn.xls", skip = 4)
brooklyn

glimpse(brooklyn)

# Q 1 what are the data types here....think about what this means for them


#example of differnce ways of reading in data

brooklyn_csv_base <- read.csv("datasets/rollingsales_brooklyn_csv.csv", skip = 4)
glimpse(brooklyn_csv_base)

brooklyn_csv_readr <- read_csv("datasets/rollingsales_brooklyn_csv.csv", skip = 4)
glimpse(brooklyn_csv_readr)

# what differences do you see?



# bind rows example

brooklyn <- read_excel("rollingsales_brooklyn.xls", skip = 4)
bronx <- read_excel("rollingsales_bronx.xls", skip = 4)
manhattan <- read_excel("rollingsales_manhattan.xls", skip = 4)
staten_island <- read_excel("rollingsales_statenisland.xls", skip = 4)
queens <- read_excel("rollingsales_queens.xls", skip = 4)

# Bind all dataframes into one, save as "NYC_property_sales"
NYC_property_sales <- bind_rows(brooklyn, bronx, manhattan, staten_island, queens)

glimpse(NYC_property_sales)


#cleaning the names

colnames(brooklyn)

# type 1- with str to lower

colnames(brooklyn) <- colnames(brooklyn) %>% str_to_title()
colnames(brooklyn) <- colnames(brooklyn) %>% str_replace_all(" ", "_")


# typ2 replce spaces with _

#type 2 : janiot

#TIDY
DCI <- read_csv("X_Factor_Dataset.csv")
DCI %>% gather(value = X, key = country, Belgium:Iraq)

# next section: Tidy data

# What is tidy data?
#   ___________________________
# 
# it is a way of having the data set so that R can work on it well. the 'oddest' part about tidy data is the way it is set up is often counter to how we normally think of spreadsheets
# 
# for data to be **Tidy**
#   
#   1. each variable gets its own column
# 2. each observation has its own row
# 3. each value has its own cell
# 
# * from my experience, 1&2 are the ones that we need to work on
# 
# ##first, a quick example to show you how it works in *real world*


# Why is this not Tidy?
#   well, the USA/UK/Russia cols are not variables, but values of a variable
# 
# #show image
# 
# how to make it  Tidy?
#   - first, we need a new column with a varibale name. lets call this 'country'. this new varibale name is called the *Key*
#   - then, we need to know the name of the cases. in this example, those values are the ratioed DCI.  i'm going to call it DCI_scaled. this is called the *value*

DCI
DCI %>% gather(value = X, key = country, Belgium:Iraq)
