# library(datasauRus)
# ggplot(datasaurus_dozen, aes(x=x, y=y, colour=dataset))+
#   geom_point()+
#   theme_void()+
#   theme(legend.position = "none")+
#   facet_wrap(~dataset, ncol=3)
# 


#from Healy

#how ggplot works!



###not sure where bleow is from maybe healy book but found in other folder

library(tidyverse)
library(gapminder)

gapminder %>% filter(year == 2007) -> gapminder07
gapminder07 %>% ggplot(aes(gdpPercap, lifeExp))
gapminder07 %>% ggplot(aes(gdpPercap, lifeExp)) + geom_point()
gapminder07 %>% ggplot(aes(gdpPercap, lifeExp)) + geom_point() + scale_x_log10()
gapminder07 %>% ggplot(aes(gdpPercap, lifeExp, color = continent)) + geom_point() + scale_x_log10()
gapminder07 %>% ggplot(aes(gdpPercap, lifeExp, color = continent, size = pop)) + geom_point() + scale_x_log10()
gapminder07 %>% ggplot(aes(gdpPercap, lifeExp, fill = continent, size = pop)) + geom_point(shape = 21) + scale_x_log10() #changed fill to


gapminder07 %>% ggplot(aes(gdpPercap, lifeExp, fill = continent, size = pop)) + geom_point(shape = 21) + scale_x_log10() +
  labs(x = "gdp", y = "life exp in years")


#one problem it that the bigger circle are behind the smaller ones

gapminder07 %>% arrange(desc(pop) )%>% ggplot(aes(gdpPercap, lifeExp, fill = continent, size = pop)) + geom_point(shape = 21) + scale_x_log10() +
  labs(x = "gdp", y = "life exp in years")
##Maybe not  working








# lots comes from fogarty book

library(foreign)
data <-read.dta("2014 Scottish Social Attitudes.dta")
names(data)
glimpse(data)

party <- table(data$Party_Labels)
barplot(party)

# lets look at ggpplot

data %>% ggplot(aes(x=Party_Labels)) + geom_bar()

data %>% ggplot(aes(x=Party_Labels)) + geom_bar(fill = 'green')
data %>% ggplot(aes(x=Party_Labels, fill = rsex)) + geom_bar()


data %>% mutate(Party_Labels = fct_reorder(Party_Labels, n()))  %>% ggplot(aes(x=Party_Labels)) + geom_bar()



#barplot

#used to look at nominal and oringal level varibales
#usually have spaces between them to indicae taht  vars are not continuus




###

anscombe.1 <- data.frame(x = anscombe[["x1"]], y = anscombe[["y1"]], Set = "Anscombe Set 1")
anscombe.2 <- data.frame(x = anscombe[["x2"]], y = anscombe[["y2"]], Set = "Anscombe Set 2")
anscombe.3 <- data.frame(x = anscombe[["x3"]], y = anscombe[["y3"]], Set = "Anscombe Set 3")
anscombe.4 <- data.frame(x = anscombe[["x4"]], y = anscombe[["y4"]], Set = "Anscombe Set 4")

anscombe.data <- rbind(anscombe.1, anscombe.2, anscombe.3, anscombe.4)

View(anscombe.data)

aggregate(cbind(x, y) ~ Set, anscombe.data, mean)
#sd
aggregate(cbind(x, y) ~ Set, anscombe.data, sd)
#And correlation between x and y
library(plyr)

correlation <- function(data) {
  x <- data.frame(r = cor(data$x, data$y))
  return(x)
}

ddply(.data = anscombe.data, .variables = "Set", .fun = correlation)

#linear regression
model1 <- lm(y ~ x, subset(anscombe.data, Set == "Anscombe Set 1"))
model2 <- lm(y ~ x, subset(anscombe.data, Set == "Anscombe Set 2"))
model3 <- lm(y ~ x, subset(anscombe.data, Set == "Anscombe Set 3"))
model4 <- lm(y ~ x, subset(anscombe.data, Set == "Anscombe Set 4"))

summary(model1)
summary(model2)
summary(model3)
summary(model4)

#####think about how to do this easier?

library(ggplot2)

gg <- ggplot(anscombe.data, aes(x = x, y = y))
gg <- gg + geom_point(color = "black")
gg <- gg + facet_wrap(~Set, ncol = 2)
gg <- gg + geom_smooth(formula = y ~ x, method = "lm", se = FALSE, data = anscombe.data)
gg


library(ggplot2)

gg <- ggplot(anscombe.data, aes(x = x, y = y))
gg <- gg + geom_point(color = "black")
gg <- gg + facet_wrap(~Set, ncol = 2)
gg <- gg + geom_smooth(formula = y ~ x, method = "lm", se = FALSE, data = anscombe.data)
gg