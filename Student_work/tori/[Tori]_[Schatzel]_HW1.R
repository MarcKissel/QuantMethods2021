#   1: Introduction
#a.
#to send a command to the console pane i can go to the end of the line and hit the run button or for my computer i can use the command and return keys at the same time

#b.
9+1

#c.
365+1986

#   2: Math
#a.
3-4

#b.
7/10

#c.
6*89

#d.
8^7

#e.
sqrt(52)

#   3: Assigning Variables

#a.
y <- 334

#b.
x+y

#c.
z <- x+y

#d.
x <- 500
x+y
z
#when asking for the value of z i got 834 because it used the function x+y to get the value of z

#e.
#names must start with a letter or a dot
#names should only contain letters, numbers,underscore characters, and dots
#there are some special keywords that cannot be used
#names should add meaning to your code

#   4: Types of Data

#a.
my_value <- "hello"
is.character(my_value)

a <- 1.333
is.numeric(a)
b <- TRUE
is.logical(b)
c <- "my name is"
is.character(c)
d <- Sys.Date()

#   5: Vectors

#a.
my_study <- c("male", "male", "female", "male", "female", "female", "female")

#b.
my_study[3]

#c.
my_study[1,4]
names(my_study)<- c("one", "two", "three", "four", "five", "six", "seven")

#d.
print(my_study)

#   6: Matrices

#a.
#to make a matrix by row use rbind instead of cbind

#b.

#c.
freq <- c(7,7,7,7, 4,4,4,4, 10,10,10,10)
hair <- c("white", "brown", "black")
eyes <- c("brown", "black", "blue")
freqmat <- matrix(freq, nr=3, nc=3, byrow=TRUE)
dimnames(freqmat)[[1]] <- hair
dimnames(freqmat)[[2]] <- eyes
freqmat

#   7: Data Frame

#a.
num <- c(1,2,3,4,5)
food <- c("bread", "butter", "milk", "cheese", "coffee", "tea")
quantity <- c(1,1,3,5,7,1)
shopping <- data.frame(num, food, quantity)
#it show up as an error because num has 5 entries but the others have 6
num <- c(1,2,3,4,5,6)
food <- c("bread", "butter", "milk", "cheese", "coffee", "tea")
quantity <- c(1,1,3,5,7,1)
shopping <- data.frame(num, food, quantity)

#b.
#the class type for num is integers, food is characters, quantity is integers

#   8: Comparing Values

a <- 5
b <- 9
c <- 7
d <- sqrt(49)

#a.
a>b

#b.
c==d

#c.
c<=b

#d.
temp <- c(1,5,7,9,11,14,6,8)
3>temp

#e.
temp [5]>5

#   9: getting data into R

#   10: How Did You Do

#1.
#the most challenging part of this hw was on certain problems i had trouble and it was hard to find the right help

#2.
#i think it would be helpful if you pointed out more clearly where to find help 

#3.
#yes but it is definitely difficult sometimes

#4.
#a class is a way of distributing different objects to other objects that have the same properties

#5.
#making sure the data is recorded correctly and into the right categories 