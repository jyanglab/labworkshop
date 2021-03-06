#This code is for the Day1 Exercise in Introduction of R programming
#This code was written by Zhikai Yang on 8/14/2017

# Question 1

(14+2)*((3/4)^2)                            #Q1.a	(14+2)*(3/4)^2

factorial(4)/(factorial(5)+factorial(3))    #Q1.b 4!/(5!+3!)

X<--12                                      #Q1.c(|X|+3Y)�((X+2)/vY) where X = -12 and Y = 4
Y<-4             
(abs(X)+3*Y)*((X+2)/sqrt(Y))


# Question 2

c(1:20)                                                      #Q2.a	Integers from 1 to 20 

c(seq(from=0,to=10,by=0.5))                                  #Q2.b	From 0 to 10 by 0.5

c("Hakuna","Matata","what","a","wonderful","phrase")         #Q2.c Individual words of the first line of the song Hakuna Matata



# Question 3 

x<-c(seq(from=1, to=19, by=2))                                                          #Q3.a Create a vector of 10 odd numbers from 1 to 19

y<-c("Alex","Bob","Conway","David","Emma","Frank","Gabby","Helen","Iric","Kevin")       #Q3.b	Create another vector of 10 names 

my.data<-as.data.frame(x)                                                               #Q3.c Merge these two vectors into two columns, but maintain the data type 
colnames(my.data)<-c("ID")
my.data$Name<-c(y)



# Question 4

my.trees<-read.csv("treesR.csv", header = T)                                        #read in and assign to an object                                          

head(my.trees, 10)                                                                  #Q4.a Select the first 10 rows and last 10 rows of data

tail(my.trees,10)                                                                   #Q4.b	Remove Lat/Lon columns

tree1.data<-as.data.frame(head(my.trees, 10))                                       
tree2.data<-as.data.frame(tail(my.trees, 10))
my.trees2.data<-rbind(tree1.data,tree2.data)
my.trees3<-my.trees2.data[, c("PLOT","QUAD","MAPLE","ASH","OAK","TYPE")]      
write.csv(my.trees3,"treesR_new.csv", row.names = F)                                #Q4.c	Save as a new csv file, open in Excel



# Question 5

my.newtree<-read.csv("treesR_new.csv")                          #Q5.a 	Import from the newly saved csv

z<-c(sample(1:20,10,replace=F))                                 #Q5.b   Create a vector of 10 random numbers from 1 to 20

my.newtree1<-my.newtree[z,]                                     #Q5.c 	Select the rows of data that correspond to these rows 

my.rowOAK<-my.newtree1[,"OAK"]                                  #Q5.d   Convert OAK (cm2/ha) to OAK_ft (ft2/acre) and add it as a new column
my.rowOAK1<-0.000435*my.rowOAK
my.newtree1$OAK_ft<-c(my.rowOAK1)

write.csv(my.newtree1,"my.newtree_OAK_ft.csv")
