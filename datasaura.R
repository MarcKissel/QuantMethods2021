library(datasauRus)

ggplot(datasaurus_dozen, aes(x=x, y=y, colour=dataset))+
  geom_point()+
  theme_void()+
  theme(legend.position = "none")+
  facet_wrap(~dataset, ncol=3)



# from https://github.com/rahulvenugopal/TidyTuesday/blob/master/data_and_script/dinosaurus/tidytuesday_dino.R


# Loading required libraries
library(datasauRus)
library(ggplot2)
library(psych)
library(dplyr)
install.packages("patchwork")
library(patchwork)
install.packages("ggtext")
library(ggtext)

# Loading data
data <- datasaurus_dozen
# Converting dataset variable into factor
data$dataset <- as.factor(data$dataset)

# Inspecting data
head(data)
tail(data)
summary_descriptives <- describeBy(data, group =data$dataset)

# Grid plots
scatters <- ggplot(data = data, aes(x = x, y = y, color = dataset)) + 
  geom_point() + 
  geom_smooth(method = lm, se = FALSE, color = "black") +
  facet_wrap(~ dataset, nrow = 3) + 
  theme(plot.background = element_rect(fill = '#fdfff5')) +
  theme_minimal() +
  theme(
    strip.background = element_blank(),
    strip.text = element_textbox(
      size = 8,
      color = "white", fill = "#5D729D", box.color = "#4A618C",
      halign = 0.5, linetype = 1, r = unit(5, "pt"), width = unit(1, "npc"),
      padding = margin(2, 0, 1, 0), margin = margin(3, 3, 3, 3)
    )
  )

violins <- ggplot(data = data, aes(x = x, y = y, color = dataset)) + 
  geom_violin() +
  facet_wrap(~ dataset, nrow = 3) +
  theme(plot.background = element_rect(fill = '#fdfff5')) +
  theme_minimal() +
  theme(
    strip.background = element_blank(),
    strip.text = element_textbox(
      size = 8,
      color = "white", fill = "#5D729D", box.color = "#4A618C",
      halign = 0.5, linetype = 1, r = unit(5, "pt"), width = unit(1, "npc"),
      padding = margin(2, 0, 1, 0), margin = margin(3, 3, 3, 3)
    )
  )

# Patching up plots
scatters + theme(legend.position = "none") + labs (title = "Lies, damned lies, and statistics") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  violins + theme(legend.position = "none") + labs (title = "Now you see me") +
  theme(plot.title = element_text(hjust = 0.5))

# One can add boxplots also
boxes <- ggplot(data = data, aes(x = y, y = x, color = dataset)) + 
  geom_boxplot() +
  facet_wrap(~ dataset, nrow = 3) +
  theme(plot.background = element_rect(fill = '#fdfff5')) +
  theme_minimal() +
  theme(
    strip.background = element_blank(),
    strip.text = element_textbox(
      size = 8,
      color = "white", fill = "#5D729D", box.color = "#4A618C",
      halign = 0.5, linetype = 1, r = unit(5, "pt"), width = unit(1, "npc"),
      padding = margin(2, 0, 1, 0), margin = margin(3, 3, 3, 3)
    )
  )


## from https://github.com/CSHoggard/-TidyTuesday/blob/master/R/w42_2020.R

library(rcartocolor)
library(tidyverse)
library(extrafont)
library(gganimate)
library(ggtext)
library(here)

datasaurus <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-13/datasaurus.csv')
colours <- c(carto_pal(12, "Vivid"), "#000000")

p <- datasaurus %>%
  group_by(dataset) %>%
  summarise(mean_x = mean(x),
            mean_y = mean(y),
            sd_x   =   sd(x),
            sd_y   =   sd(y),
            coefficient  = cor(x, y, method = "pearson")) %>%
  left_join(datasaurus) %>%
  ggplot(aes(x = x, y = y)) +
  coord_equal(clip = "off") +
  geom_point(aes(colour = dataset, group = 1L), size = 3, alpha = 0.6) +
  scale_color_manual(values = colours, guide = "none") +
  scale_x_continuous(limits = c(0, 120), breaks = seq(0, 120, by = 20)) +
  scale_y_continuous(limits = c(0, 140), breaks = seq(0, 100, by = 20)) +
  geom_text(aes(x = 60, y = 136, label = paste("mean (x):", round(mean_x,4)), family = "Commissioner"), hjust = 0.5, size = 4.5, color = "grey70") +
  geom_text(aes(x = 60, y = 132, label = paste("mean (y):", round(mean_y,4)), family = "Commissioner"), hjust = 0.5, size = 4.5, color = "grey70") +
  geom_text(aes(x = 60, y = 128, label = paste("standard deviation (x):", round(sd_x,4)), family = "Commissioner"), hjust = 0.5, size = 4.5, color = "grey70") +
  geom_text(aes(x = 60, y = 124, label = paste("standard deviation (y):", round(sd_y,4)), family = "Commissioner"), hjust = 0.5, size = 4.5, color = "grey70") +
  geom_text(aes(x = 60, y = 120, label = paste("correlation", round(coefficient,4)), family = "Commissioner"), hjust = 0.5, size = 4.5, color = "grey70") +
  labs(title = "The Importance of Data Visualisation",
       subtitle = "<b style='font-size:24pt;'>Case Study: The DataSaurus Dozen</b><br><br>The DataSaurus Dozen highlights the importance of visualising data; while summary statistics (means, standard deviations and correlation measures) for various datasets can be the same, their distributions can be significantly varied. This was first elegantly demonstrated in 1973 by the English statistician Francis John Anscombe. Anscombe's four datasets (<span style = 'color:#068a84;'>Anscombe's Quartet</span>) appeared to be similar when using typical summary statistics, yet told four different stories when graphed. <br><br>In 2016, Alberto Cairo developed the DataSaurus Dozen: a series of 13 different datasets with almost-identical summary statistics and different visualisations. This was published, together with other datasets, by Justin Matejka and George Fitzmaurice in 2017.",
       caption = "• Produced by @CSHoggard  |   #TidyTuesday Week 42 • \n • Data: Francis Anscombe, Alberto Cairo, Justin Matejka & George Fitzmaurice •") +
  theme_minimal() +
  theme(plot.title = element_text(family = "Commissioner", 
                                  size = 42,
                                  color = "#068a84", 
                                  hjust = 0.5,
                                  margin = margin(15, 0, 40, 0)),
        plot.title.position = "plot",
        plot.subtitle = element_textbox_simple(family = "Commissioner", 
                                               size = 12,
                                               color = "grey30", 
                                               halign = 0.5,
                                               lineheight = 1.2,
                                               margin = margin(10, 0, 0, 0)),
        plot.caption = element_text(family = "Commissioner",
                                    size = 12,
                                    colour = "grey30",
                                    lineheight = 1.2,
                                    hjust = 0.5,
                                    margin = margin(40, 0, 20, 0)),
        plot.caption.position = "plot",
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.margin = margin(90, 70, 90, 70),
        plot.background = element_rect(color = "white", fill = "white")) +
  transition_states(dataset, 10, 3) + 
  ease_aes('cubic-in-out') 

animate(p, nframes = 120, fps = 8, detail = 10, width = 900, height = 1100)
anim_save("Datasaurus.gif", animation = last_animation())
