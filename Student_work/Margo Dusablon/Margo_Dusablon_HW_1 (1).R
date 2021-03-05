# MAKE SURE TO RE-NAME the file 
# Quant_stats_HW_Marc_Kissel
#
#
# I set this up as a way to make doing the first homework easier
# let me know if something is not clear

#to answer the questions use this format
#   for code just type it below the question
#   for prose just write out the answer and
#   use # to make it a comment


#protip: in a few weeks we will work on ways to do 
#this differenly but for now this is the easyiest, but
#not the most simple way...





# # Part 1 ----------------------------------------------------------------



# a. 
#to send to the console i can go to the end of
# the line and hit the run button
# b.
9+1

# c.
365 + 1986



# part 2: math --------------------------------------------------------------

#how do you do the following
#a. 3 minus 4
3-4

#b. 7 divided by 10
7/10

#c. 6 times 89
6*89

#d. 8 raised to the 7th power
8^7

#e.the square root of 52
sqrt(52)

# part 3 Assigning variables --------------------------------------------------


# a.	How would you create a name  y and assign it the value 334
y <- 334
x <- 42

# b.	how would you add the x and y together to get the sum of the two numbers?
x+y

# c.	how would you create a new variable (z) that stores the result of x +y
z <- x+y
z

# d.	now, change the value of x to be 500 and see what happens when you add x + y together? if you ask for the value of z now what do you get? why?
x <- 500
x+y
z
# Now that x is 500, x+y = 500+334 = 834. However, z is still 376 because the old x+y is still locked in ? So I'd have to change re-assign z with the updated value for x.
z <- x+y
z
# Now z is 834. 

# e.	what are the rules for what the name of an object in R can be? This can be found by searching online or using the R help function 

#Assigning/re-assigning a value to one variable does not change the values of other variables.
# Object names cannot start with a number. R is case sensitive. Certain names cannot be used because they are the same for fundamental functions. 

# part 4- Types of data -----------------------------------------------


# a.	assign my_value to be “hello”. then check its class
my_value <- "hello"
class(my_value)
my_value <- 1+3
class(my_value)
is.numeric(my_value)

my_name <- "Margo Dusablon"
class(my_name)
is.numeric(my_name)
class(my_name)
is.character(my_name)

a <- 1.333
# prediction: numeric
class(a)

b <- TRUE
# prediction: Boolean
class(b)
# Oops, logical is what I meant.

c <- "my name is"
# prediction: character
class(c)
is.character(c)

d <- Sys.Date()
# prediction: categorical
class(d)
is.factor(d)
is.character(d)
is.numeric(d)
is.numeric.Date(d)
# This is a tricky one...
d <- Sys.Date(2/4/2021)
d
# Okay, I see... 
d <- Sys.Date()
class(d)


# Part  5: Vectors --------------------------------------------------------

# let’s say you are doing some research and want to record the biological sex of the skeletons in your study. After analyzing them you decide that this is the correct designation
# male male female male female female female

# a.	make a new object called my_study and make it a vector of the recorded biological sex *** < - this is harder than it might look.
my_study <- c("male","male","female","male","female","female","female")
my_study[2]

# b.	how would you get the sex of the third skeleton?
my_study[3]

# c.	can you figure out how, in one line of code, to get the sex of the 1st and 4th skeleton?
names(my_study) <- c("one", "two", "three", "four", "five", "six", "seven")
my_study[1:4]
my_study[1 & 4]

# d. print my_study now and see how it differs.
my_study



#Part 6: matrices -------------------------------------------------------



# a.	how would you make a matrix by row rather than column (use Google  if need be)
cx1980 <- c(7, 13, 8, 13, 5, 35, 9)
cx1988 <- c(9, 11, 15, 8, 9, 38, 0)
chimp <- rbind(cx1980, cx1988)

chimp

# b.	There are others ways to make a matrix look at the code below and figure out how it works
freg <- c(32,11,10,3,  38,50,25,15,  10,10,7,7,  3,30,5,8)
hair <- c("Black", "Brown", "Red", "Blonde")
eyes <- c("Brown", "Blue", "Hazel", "Green")
fregmat <- matrix(freg, nr=4, nc=4, byrow=TRUE)
dimnames(fregmat)[[1]] <- hair
dimnames(fregmat)[[2]] <- eyes

fregmat

# The vector freg has four sets of data seperated by a double space that corresponds to the four categories in the hair and eyes. 
# fregmat <- matrix (freg, nr=4, nc=4, byrow=TRUE) tells R to organize in 4 rows and 4 columns 
# dimnames (fregmat) [[1]] <- hair assigns the columns as hair categories
# dimnames (fregmat) [[2]] <- eyes assigns the rows as eye color


# c.	now, create your own matrix with made up data…give the code you used to make this
yr1999 <- c(5, 8, 4, 2, 7)
yr2000 <- c(10, 11, 6, 7, 12)
cats <- cbind(yr1999, yr2000)

cats

#Part 7: data frame 

# a.	run the code below. it should show an error. Why? rewrite the code so it works!

num <- c(1,2,3,4,5)
food <- c("bread", "butter", "milk", "cheese","coffee", "tea")
quantity <-  c(1,1,3,5,7,1)
shopping <- data.frame(num, food, quantity)

# There is an error because a data frame is a list of variables of the same length. Since we have six foods in six quantities, we need to have num <- c(1,2,3,4,5,6)

num <- c(1,2,3,4,5,6)
food <- c("bread", "butter", "milk", "cheese","coffee", "tea")
quantity <-  c(1,1,3,5,7,1)
shopping <- data.frame(num, food, quantity)

shopping


# b.	what is the class type of the different vectors in the my_sample dataframe?

bone <- c("humerus", "radius", "ulna", "femur", "tibia", "fibula")
size_inches <- c(14.4, 10.4, 11.1, 19.9, 16.9, 15.9)
injury <- sample(c("yes","no"),6,replace=TRUE)
sample_letter <- LETTERS[1:6]
my_sample <- data.frame(bone, size_inches, injury, sample_letter)
my_sample

class(bone)
# character
class(size_inches)
# numeric
class(injury)
# character
class(sample_letter)
# character

# part 8: comparing values ------------------------------------------------

a <- 5
b <- 9
c <- 7
d <- sqrt(49)

# a.	is a bigger than b? 
a > b
#false

# b.	is c equal to d (careful with this one..) 
c == d
#true

# c.	is c less than or equal to b?
c <= b
#true

# d.	make a new vector called temp with the values of 1,5,7,9,11,14,6,8. then write a single line of code that evaluates if 3 is greater than each of the values in the vector
temp <- c(1,5,7,9,11,14,6,8)
3 > temp
# true, false, false, false, false, false, false, false

# e.	how would you ask R if the 5th value in temp is larger than 5?
names(temp) <- c("one", "two", "three", "four", "five", "six", "seven", "eight" )
5 < temp["five"]
#true
5 < temp[5]
#true 

# Part 9: reading Data into R ---------------------------------------------
my_data <- read.csv(file.choose(), header=T)
my_data
#data not found because I didn't upload a dataset. 