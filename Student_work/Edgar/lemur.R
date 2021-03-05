# make sure you put the excel sheet in your working directod of R
# to see the working directory you can use the getwd() function. 
# or create a new R project and then put the excel sheet there

#install.packages("readxl")
#install.packages("janitor")
library(readxl)
fur <- read_xlsx("Lemur_data_for_analysis_ALL_LEMURS.xlsx", sheet = "P.furficer")
indri <- read_xlsx("Lemur_data_for_analysis_ALL_LEMURS.xlsx", sheet = "I.indri", na = "X")

### add the rest and put in one sheet
###

path <- ("Student_work/Edgar/data/Lemur_data_for_analysis_ALL_LEMURS_tem.xlsx")
#path <- ("Lemur_data_for_analysis_ALL_LEMURS_tem.xlsx")
lem <- path %>%
  excel_sheets() %>%
  set_names() %>%
  map_df(~ read_excel(path = path, sheet = .x, na = "X"), .id = "sheet") %>% janitor::clean_names()



lem <- "data/Lemur_data_for_analysis_ALL_LEMURS_tem.xlsx" %>%
  excel_sheets() %>%
  set_names() %>%
  map_df(~ read_excel(path = "data/Lemur_data_for_analysis_ALL_LEMURS_tem.xlsx", col_types = cols(Date = col_date()) ,sheet = .x, na = "X"), .id = "sheet") %>% janitor::clean_names()



col_types = cols(Date = col_date())
#look at E.aldifrons Elevation XXXX
# ir removed it on temp just to check

#map
lem %>% filter(!is.na(species))  %>% ggplot(aes(x=longitude, y = latitude, color=species)) + geom_point()

lem %>%  filter(longitude < 70,
                latitude < -17.88,
                longitude >49.14)  %>% ggplot(aes(x=longitude, y = latitude, color=species)) + geom_point()

lem_short <- lem %>%  filter(longitude < 70,
                             latitude < -17.88,
                             longitude >49.14)  


lem_short
###map other

library(maps)
install.packages("mapdata")
library(mapdata)


#########################################


leaflet(data = lem_short) %>% addTiles() %>%
  addCircleMarkers(~longitude, ~latitude, color=~pal(sheet) , popup = ~as.character(sheet), label = ~as.character(sheet))

pal <- colorFactor(c("navy", "red", "green", "yellow"), domain = lem_short$sheet)

####tmap
install.packages("tmap")
library(tmap)  
library(sf)
library(raster)
library(dplyr)
install.packages("spData")
library(spData)
#install.packages("spDataLarge")
install.packages("spDataLarge", repos = "https://nowosad.github.io/drat/", type = "source")
library(spDataLarge)

tm_shape(71) +
  tm_fill() 

tm_shape(world)

########
library(leaflet)
leaflet(data = lem_short) %>% addTiles() + add_markers( x= longitude, y =latitude)

####
SpatialPoints(lem_short)

sp1 <- SpatialPoints(cbind(lem_short$longitude , lem_short$latitude), proj4string=CRS("+init=epsg:4326 +proj=longlat +ellps=WGS84
+datum=WGS84 +no_defs +towgs84=0,0,0"))

leaflet(data = sp1) %>% addTiles() + add_markers( x= coords.x1, y =coords.x2)


# convert utm to lat/long
install.packages('rgdal')

#help : https://mhallwor.github.io/_pages/basics_SpatialPoints

# sputm <- SpatialPoints(randompoints, proj4string=CRS("+proj=utm +zone=??? +datum=WGS84")) 
# spgeo <- spTransform(sputm, CRS("+proj=longlat +datum=WGS84"))

library(rgdal)
library(tidyverse)
points <- lemur %>% filter(!is.na(utm_y)) %>%  select(utm_y, utm_x) %>% mutate(y =as.numeric(utm_y),
                                                                               x= as.numeric(utm_x)) %>% select(x,y)
#  longitude is the X value and latitude is the Y valu
spoints <- SpatialPoints(cbind(points$x, points$y), proj4string=CRS("+proj=utm +zone=39C +datum=WGS84 +datum=WGS84 +units=m +ellps=WGS84"))
spoints_latlong <-spTransform(spoints, CRS("+proj=longlat +datum=WGS84"))
spoints_latlong_tb <- spoints_latlong %>% as_tibble() %>% filter(x<10)                        

spoints_latlong_tb %>% ggplot(aes(x,y)) + geom_point()
#####
#####trying a dif way since not converting right


mapdata <- points

coordinates(mapdata) <- ~x+y #similar to SpatialPoints

proj4string(mapdata) <- CRS("+proj=utm +zone=39C") #assign projection and coordinate reference system

longlats <- spTransform(mapdata, CRS("+proj=longlat")) #transform

# note:  UTM zone 39S

str(spoints)
############################################################

#sf package with downloade shapefile

library(sf)

sf_mad_basic <- read_sf("Student_work/Edgar/data/shapefile/mdg_admbnda_adm0_BNGRC_OCHA_20181031.shp")

sf_mad_basic <- read_sf("Student_work/Edgar/data/shapefile/mdg_admbnda_adm2_BNGRC_OCHA_20181031.shp")

a <- read_sf("Student_work/Edgar/data/shapefile/mdg_admbnda_adm1_BNGRC_OCHA_20181031.shp")
#Toamasina Province 


toam <-  a %>% filter(OLD_PROVIN == "Toamasina")

toam_small <- toam %>%  filter(ADM1_EN =="Atsinanana")

ggplot(toam_small) + geom_sf() + geom_point(aes(x=longitude, y = latitude, color=species), data = lem_short) + coord_sf(ylim = c(-17.94, -17.85), xlim = c(49.1, 49.3))

ggplot(toam_small) + geom_sf()

ggplot(toam_small) + geom_sf() + geom_point(aes(x=longitude, y = latitude, color=species), data = lem_short)
 

### ggmap

install.packages("ggmap")

library(ggmap)



#plots
lem %>% ggplot(aes(x=behavior, y = species, fill=species)) 

#test ggmap

myLocation <- "University of Washington"

myMap <- ggmap(get_googlemap(center = c(lon = -122.335167, lat = 47.608013),
                             zoom = 11, scale = 2,
                             maptype ='terrain',
                             color = 'color'))

AIzaSyBYoMc0eWxh2La6pwWcVIW8dkTX6CJeqBg
ggmap::register_google(key = "AIzaSyCjMfmvoNDQg926M-uuS5Ol7yVB8e-JVi0")

##ok i need to givegoogle a creddit card....
#https://stackoverflow.com/questions/52704695/is-ggmap-broken-basic-qmap-produces-arguments-imply-differing-number-of-rows/52710855#52710855

library(tmaptools)

ggmap(get_stamenmap(rbind(as.numeric(paste(geocode_OSM("madagascar")$bbox))), zoom = 11))

#below is bounding box
ggmap(get_stamenmap(bbox = c(left = -95.80204, bottom = 29.38048, right =
                               -94.92313, top = 30.14344), zoom = 11))


ggmap(get_stamenmap(bbox = c(left = 45, bottom = -24, right =
                               50, top = -12.1), zoom = 5))


#https://boundingbox.klokantech.com/
# L, bottom, right,top
#49.0032,-18.1095,49.3855,-17.7688
# abov is close

madmap <-ggmap(get_stamenmap(bbox = c(left = 45, bottom = -24, right =
                               50, top = -12.1), zoom = 9))

madmap <- ggmap(get_stamenmap(bbox = c(left = 49.1, bottom = -18, right =
                               49.3, top = -17.8), zoom = 11))

#

madmap +  geom_point(aes(x=longitude, y = latitude, color=species), data = lem_short)

madmap2 <- ggmap(get_stamenmap(bbox = c(left = 49.175, bottom = -17.93, right =
                                         49.25, top = -17.875), zoom = 11))


madmap2 +  geom_point(aes(x=longitude, y = latitude, color=species), data = lem_short)

#


####
bbox <- c(left = -97.1268, bottom = 31.536245, right = -97.099334, top = 31.559652)

ggmap(get_stamenmap(bbox), zoom = )


coord_sf(ylim = c(-17.94, -17.85), xlim = c(49.1, 49.3))



#or https://dominicroye.github.io/en/2018/accessing-openstreetmap-data-with-r/

#############################################################################
lem %>% filter(!is.na(species)) %>%   ggplot(aes(x=behavior, y = species, fill=species)) + geom_col()



lem %>% filter(!is.na(species)) %>%  ggplot(aes(x=behavior, y = species, fill=species)) + geom_col() + facet_wrap(~ species)



both <- bind_rows(fur, indri) %>% janitor::clean_names()


##############

mutate(date = as.Date(date, origin = "1900-01-01"))
lemtemp <- read_csv("data/Lemur_data_for_analysis_temp.csv")

lemtemp %>% mutate(date = as.Date(date, origin = "1900-01-01"))

lemtemp %>%  mutate(date = janitor::excel_numeric_to_date(date))
lemtemp$Date













###
lemur_raw <- read_csv("data/Lemur_data_for_analysis_temp.csv")

lemur <- lemur_raw %>% filter(!is.na(Sample.Label))

library(lubridate)

lemur_raw <- read_csv("data/Lemur_data_for_analysis_temp.csv", col_types = cols(Dates = col_date()))

col_types = cols(Date = col_date())





