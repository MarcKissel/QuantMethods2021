# MAKE SURE TO RE-NAME the file 
# Quant_stats_HW_Kendra_Casse
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
sqrt (52)

# part 3 Assigning variables --------------------------------------------------




# a.	How would you create a name  y and assign it the value 334
y <- 334
# b.	how would you add the x and y together to get the sum of the two numbers?
x+y
# c.	how would you create a new variable (z) that stores the result of x +y
z <- (x+y)
# d.	now, change the value of x to be 500 and see what happens when you add x + y together?if you ask for the value of z now what do you get? why?
x <- 500 
x+y
z
# e.	what are the rules for what the name of an object in R can be? This can be found by searching online or using the R help function 



# part 4- Types of data -----------------------------------------------


# a.	assign my_value to be “hello”. then check its class
My_value <- "hello"
class (My_value)


# Part  5: Vectors --------------------------------------------------------

# let’s say you are doing some research and want to record the biological sex of the skeletons in your study. After analyzing them you decide that this is the correct designation
# male male female male female female female


# a.	make a new object called my_study and make it a vector of the recorded biological sex *** < - this is harder than it might look.
My_study <- c("male", "male", "female", "male", "female", "female", "female")

# b.	how would you get the sex of the third skeleton?
My_study[3]

# c.	can you figure out how, in one line of code, to get the sex of the 1st and 4th skeleton?
My_study[c(1,4)]

names(My_study) <- c("one", "two", "three", "four", "five", "six", "seven")

# d. print my_study now and see how it differs.




#Part 6: matrices -------------------------------------------------------



# a.	how would you make a matrix by row rather than column (use Google  if need be)



# b.	There are others ways to make a matrix look at the code below and figure out how it works



# c.	now, create your own matrix with made up data…give the code you used to make this
freq <- c(14,17,83,11,26,5,41,19,41,99,117,3,34,27,2,9)
color <- c("black", "brown", "blonde", "red")
texture <- c("straight", "wavy", "curly", "coily")
freqmat <- matrix(freq, nr=4, nc=4, byrow=TRUE)
dimnames(freqmat)[[1]] <- color
dimnames(freqmat)[[2]] <- texture
freqmat

#Part 7: data frame 

# a.	run the code below. it should show an error. Why? rewrite the code so it works!


num <- c(1,2,3,4,5,6)
food <- c("bread", "butter", "milk", "cheese","coffee", "tea")
quantity <-  c(1,1,3,5,7,1)
shopping <- data.frame(num, food, quantity)



# b.	what is the class type of the different vectors in the my_sample dataframe?
class(num)
class(food)
class(quantity)




# part 8: comparing values ------------------------------------------------


a <- 5
b <- 9
c <- 7
d <- sqrt(49)

# a.	is a bigger than b? 
a > b
# b.	is c equal to d (careful with this one..) 
c == d
# c.	is c less than or equal to b?
c <= b
# d.	make a new vector called temp with the values of 1,5,7,9,11,14,6,8. then write a single line of code that evaluates if 3 is greater than each of the values in the vector
temp <- c(1,5,7,9,11,14,6,8)
3 > temp[c(1:8)]
# e.	how would you ask R if the 5th value in temp is larger than 5?
5 < temp[5]



# Part 9: reading Data into R ---------------------------------------------


