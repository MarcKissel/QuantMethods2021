# Part 1
#a.
6+7
#b.
9+1
#c.
365+1986
# Part 2
#a.
3-4
#b.
7/10
#c.
6*89
#d.
8^7
#e.
52^1/2
# Part 3
x<-42
#a.
y<-334
#b.
x+y
#c.
z<-x+y
#d.
x<-500
x+y
# the value of z has increased because the value of x has increased.
# e.
# One of the rules for naming in R includes that it must start with a letter/dot
# Another rule is that it should only include letters, numbers, underscores, & dots
# The last rule is that there are certain special keywords that cannot be used.
# Part 4
x<-42
class(x)
xx<-42L
is.integer(xx)
#a.
a<-1.33
is.integer(a)
class(a)
b<-TRUE
is.character(b)
class(b)
c<-"my name is"
is.character(c)
class(c)
d<-Sys.Date()#tricky
is.complex(d)
class(d)
#Part 5
#a.
my_study<-c("male","male","female","male","female","female","female")
my_study[2]
#b. 
my_study[3]
#c.
my_study[1,4]
#d. 
#I cannot print this because my printer is out of toner
#Part 6
cx1980 <- c(7, 13, 8, 13, 5, 35, 9)
cx1988 <- c(9, 11, 15, 8, 9, 38, 0)
chimp <- cbind(cx1980, cx1988)
class(chimp)
chimp[1,]
chimp[3,2] 
#a. Go up and down? I have no idea how to make a matrix by row rather than column
#b. I have no idea how this code works.
#c. I have no idea what this data is supposed to be or how to do this.
# Part 7
bone <- c("humerus", "radius", "ulna", "femur", "tibia", "fibula")
size_inches <- c(14.4, 10.4, 11.1, 19.9, 16.9, 15.9)
injury <- sample(c("yes","no"),6,replace=TRUE)
sample_letter <- LETTERS[1:6]
my_sample <- data.frame(bone, size_inches, injury, sample_letter)
my_sample
View(my_sample)
my_sample$bone
num <- c(1,2,3,4,5)
#a.
food <- c("bread", "butter", "milk", "cheese","coffee", "tea")
quantity <-  c(1,1,3,5,7,1)
shopping <- data.frame(num, food, quantity)
# The code does not work because of an error in data frame
# I am not sure how to fix this.
#b.
#I have no idea what the class type is or how to find it with the data frame
#Part 8
a<-5
b<-9
c<-7
d<-sqrt(49)
#a.
a>b
#b.
#I am not sure how to program this one
#c.
c<b
#d.
temp<-c(1,5,7,9,11,14,6,8)
3>temp<-c(1,5,7,9,11,14,6,8)
#e.
temp(5)>5
#Part 10
#1. The most challenging part was the end. I could not figure out the end parts.
#2. The last parts could be more clear but everything else was good.
#3. I think I am getting there but still not super confident in my R abilities.
#4. I would explain classes as something that you can easily find from programming in R but still do not make a lot of sense.
#5. Just getting more comfortable with some of the data functions in R.