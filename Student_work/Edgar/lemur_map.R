#lemur_map
library(readxl)
library(tidyverse)
install.packages("ggmap")
library(ggmap)# note that the 'regular' version of this requires registering a credit card with Google api
# i found a workaround that should make this step not necessary..
install.packages("janitor")

#below reads in an edited version of the lemur data. i added a lat/long in decimal degrees
#you will have to  change the path to make it work where you put the data....in this case, i have a folder of student_work and then put the data in a folder of your code etc
# if you have trouble finding out how to get the path let me know.
#
path <- ("Student_work/Edgar/data/Lemur_data_for_analysis_ALL_LEMURS_tem.xlsx")
lemur <- ("data/Lemur_data_for_analysis_ALL_LEMURS_tem.xlsx") %>%
  excel_sheets() %>%
  set_names() %>%
  map_df(~ read_excel(path = "data/Lemur_data_for_analysis_ALL_LEMURS_tem.xlsx", sheet = .x, na = "X"), .id = "sheet", col_types = "character") %>% janitor::clean_names()


#take a look at the points

lemur %>% filter(!is.na(species))  %>% ggplot(aes(x=longitude, y = latitude, color=species)) + geom_point()

lemur %>%  filter(longitude < 70,
                latitude < -17.88,
                longitude >49.14)  %>% ggplot(aes(x=longitude, y = latitude, color=species)) + geom_point()

#lets cut the ones that seem to be misplotted? 

lem_short <- lemur %>%  filter(longitude < 70,
                             latitude < -17.88,
                             longitude >49.14)  

# now we need the base map. to get this we use the get_stamenmap function from ggmap
# the box argument gives the bounding box for the map. play around to edit
# can also mess with the zoom
# 

madmap2 <- ggmap(get_stamenmap(bbox = c(left = 49.175, bottom = -17.93, right =
                                          49.25, top = -17.875), zoom = 11))

#now we use the madmap2 object and the put the points over it
# I set color and shape to the 'sheet' column which has the species info
#  the labs function lets you label things (color = "Species", shape = "Species")
# lets the caption be renamed
# 

madmap2 +  geom_point(aes(x=longitude, y = latitude, color=sheet, shape = sheet), size=2, data = lem_short) +
  labs(color = "Species", shape = "Species", title = "Lemurs in Betampona")



