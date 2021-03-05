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
#is this what you meant with comment a?
#[1] 9+1i
[1] 10
# c.
365 + 1986
[1] 2351
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
> y=334
> y
[1] 334
# b.	how would you add the x and y together to get the sum of the two numbers?
first assign a variable to x and assign a variable to y 
then x+y
# c.	how would you create a new variable (z) that stores the result of x +y 
z=x+y
# d.	now, change the value of x to be 500 and see what happens when you add x + y together? if you ask for the value of z now what do you get? why?
I get the original value assigned to z before I changed the value of x
# e.	what are the rules for what the name of an object in R can be? This can be found by searching online or using the R help function 


# part 4- Types of data -----------------------------------------------


# a.	assign my_value to be “hello”. then check its class

> my_value="hello"
> my_value
[1] "hello"

# Part  5: Vectors --------------------------------------------------------

# let’s say you are doing some research and want to record the biological sex of the skeletons in your study. After analyzing them you decide that this is the correct designation
# male male female male female female female


# a.	make a new object called my_study and make it a vector of the recorded biological sex *** < - this is harder than it might look.
> my_study<- c("male", "male", "female", "male", "female", "female", "female")

# b.	how would you get the sex of the third skeleton?
     #Unknown
# c.	can you figure out how, in one line of code, to get the sex of the 1st and 4th skeleton?
names(my_study) <- c("one", "two", "three", "four", "five", "six", "seven")

     #Unknown
# d. print my_study now and see how it differs.

> my_study
     one      two    three     four     five      six    seven 
  "male"   "male" "female"   "male" "female" "female" "female" 


#Part 6: matrices -------------------------------------------------------


# a.	how would you make a matrix by row rather than column (use Google  if need be)



# b.	There are others ways to make a matrix look at the code below and figure out how it works



# c.	now, create your own matrix with made up data…give the code you used to make this


#Part 7: data frame 

# a.	run the code below. it should show an error. Why? rewrite the code so it works!
  arguments imply differing number of rows: 5, 6
  Whatever is wring is in the shopping section. Depending on what you want changes how it should be rewritten. 
  num <- c(1,2,3,4,5)
> food <- c("bread", "butter", "milk", "cheese","coffee", "tea")
> quantity <-  c(1,1,3,5,7,1)
> shopping <- data.frame(food, quantity)
leads to
> shopping
    food quantity
1  bread        1
2 butter        1
3   milk        3
4 cheese        5
5 coffee        7
6    tea        1
#By writing the shopping as (food, quantity) I get a list of the food items (with a number bullet to the left) listed under food, and the amount needed on the right under the heading of quantity.


 
num <- c(1,2,3,4,5)
food <- c("bread", "butter", "milk", "cheese","coffee", "tea")
quantity <-  c(1,1,3,5,7,1)
shopping <- data.frame(num, food, quantity)

# b.	what is the class type of the different vectors in the my_sample dataframe?
Drinks


# part 8: comparing values ------------------------------------------------

a <- 5
b <- 9
c <- 7
d <- sqrt(49)

# a.	is a bigger than b? 
a>b
# b.	is c equal to d (careful with this one..) 
c=d?
# c.	is c less than or equal to b?
c<=b
# d.	make a new vector called temp with the values of 1,5,7,9,11,14,6,8. then write a single line of code that evaluates if 3 is greater than each of the values in the vector
       #Unknown
# e.	how would you ask R if the 5th value in temp is larger than 5?
       #Unknown
#
# Part 9: reading Data into R ---------------------------------------------