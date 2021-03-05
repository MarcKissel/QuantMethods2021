#1. Introduction.
a. How can you send a command from the Source pane to the Console Pane?
 - Press "Run"
b. What would be the code to add 9 and 1?
  - 9 + 1
c. What would be the code to add 365 and 1986?
  - 365 + 1986

#2. Math. 
a. 3-4
 - -1
b. 7 divided by 10
 - 0.7
c. 6 times 89
 - 534
d. 8 raised to the 7th power
 - 2097152
e. the square root of 52
 - 4 

#3. Assigning Variables
a.How would you create a name  y and assign it the value 334?
 - y <- 334
b. how would you add the x and y together to get the sum of the two numbers?
 - x + y
 - 376
c. how would you create a new variable (z) that stores the result of x +y
- z <- x+y
d. now, change the value of x to be 500 and see what happens when you add x + y together? 
  if you ask for the value of z now what do you get? why?
- The new value is 834. The z value is retains memory of the former value of 
x+y, because it has not been assigned the new value.
e. what are the rules for what the name of an object in R can be?
  This can be found by searching online or using the R help function 
- Names must start with a letter or a dot. If you start a name with a dot, 
the second character can’t be a digit.
- Names should contain only letters, numbers, underscore characters (_), and dots (.).
Although you can force R to accept other characters in names, you shouldn’t,
because these characters often have a special meaning in R.
- There are a few special keywords you can't use as names, such as 
"break, else, or FALSE'

#4. Types of Data
a. Assign my_value to be “hello”. then check its class
- class(my_value) is a "character"

#5. Vectors
a. make a new object called my_study and make it a vector of the recorded
biological sex *** < - this is harder than it might looks.
- my_study <- c("male", "male", "female", "male", "female", "female", "female") 
b. how would you get the sex of the third skeleton?
- my_study [3]
c. can you figure out how, in one line of code,
to get the sex of the 1st and 4th skeleton? 
- my_study[1:4]
d. print my_study now and see how it differs.
- my_study
  one      two    three     four     five      six    seven 
  "male"   "male" "female"   "male" "female" "female" "female" 
  
#6. Matrices
a. how would you make a matrix by row rather than column?
  Use the "byrow=TRUE" argument

c. now, create your own matrix with made up data.
give the code you used to make this

- BEHOLD, the MASTERPIECE:
  (let me know if I did anything wrong)
 
   > View(my_data)
> freq <- c(3,4,7,  25,5,6,  4,7,9,  5,9,7)
> boots <- c("black", "green", "red")
> teeth <- c("white", "yellow", "black")
> freqmat <- matrix(freq, nr=3, nc=3, byrow=TRUE)
> dimnames(freqmat)[[1]] <- boots
> dimnames(freqmat)[[2]] <- teeth
> freqmat
white yellow black
black     3      4     7
green    25      5     6
red       4      7     9
  
#7. Dataframe

a. run the code below. it should show an error on step 4. Why? 
  rewrite the code so it works!
  
 > num <- c(1,2,3,4,5)
> food <- c("bread", "butter", "milk", "cheese","coffee", "tea")
> quantity <-  c(1,1,3,5,7,1)
> shopping <- data.frame(num, food, quantity)

- REASON: Missing value in "num"
- NEW CODE:

  > num <- c(1,2,3,4,5,6)
> food <- c("bread", "butter", "milk", "cheese","coffee", "tea")
> quantity <-  c(1,1,3,5,7,1)
> shopping <- data.frame(num, food, quantity)


b. what is the class type of the different vectors in the my_sample dataframe?
  
num= numeric
food= character
quantity= numeric

#8. Comparing Values
a. is a bigger than b? 
 - a > b
   FALSE
b. is c equal to d
 - c == d
   TRUE
c.  is c less than or equal to b?
  - c <= b
    TRUE
d. make a new vector called temp with the values of 1,5,7,9,11,14,6,8.
then write a single line of code that evaluates 
if 3 is greater than each of the values in the vector
- c >= temp
 TRUE TRUE TRUE FALSE FALSE FALSE TRUE FALSE
e. how would you ask R if the 5th value in temp is larger than 5?
- 5 < temp[5]
  TRUE
  
#9. Getting Data into R
  
  
my_data

Version..1.0
1  RestoreWorkspace: Default
2     SaveWorkspace: Default
3 AlwaysSaveHistory: Default
4    EnableCodeIndexing: Yes
5       UseSpacesForTab: Yes
6         NumSpacesForTab: 2
7            Encoding: UTF-8
8           RnwWeave: Sweave
9            LaTeX: pdfLaTeX


#10. How Did You Do?

1. What the most challenging part of this homework?
- I had issues finding out some of the commands, namely the ones used to 
help solve math equations.
2. What could be more clear? What info might be helpful to include?
- Above stated. Math equation stuff is helpful to know. Maybe I missed
it in a former lesson. 
3. After sitting with this, do you think you have a better idea of 
what R is all about?
- Tentative "yes."
4. Probably the most awful thing about R are the classes.  If you had to explain 
what a class was how would you do that?
- It's a blueprint that tells you what an object is an can do. 
5. Now that we have an idea of how R thinks, next week we are 
 gonna talk a bit about how to store data. 
 Based on what you now know, what might be good practices
  for recording data on a spreadsheet so that others can use them?
- Practices with vectors and how to fit them into dataframes.




  
  


  
  
  
  
  
  
  
  



  
  
