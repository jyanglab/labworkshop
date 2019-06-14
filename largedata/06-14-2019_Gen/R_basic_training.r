##R object
variable 
a=1;
a<-1;
1 -> a
b=TRUE
c="key"
##########data type##########
#####vector#############
#logical
x=c(TRUE,FALSE)
class(x)

#Character
x=LETTERS[1:5]

#Numeric
x=c(1.2, 3.5,4.8,5)
names(x)=c("a","b","c")
x["b"]
x[2]
x[-3]
max(x);min(x);sum(x);which.max(x)
1:10
x=sample(1:10,5,replace = F)
x=sort(x)
x>=5
x[x>=5]
x[!x>=5]
y=c("I","am","Student")
paste(y,collapse = " ")


#####matrix###################
a=matrix(1:6,nrow=3)
colnames(a)=c("x","y")
rownames(a)=c("xx","yy","zz")
a[2,];
a[,2];
a[a[,1]>=2,]
subset(a,a[,1]>=2)

########dataframe#################
a=c("A","A","B","B","B","C")
b=1:6
c=month.name[1:6]
d=data.frame(a,b,c)
class(d)
colnames(d)=c("Letter","Number","Month")
subset(d,d[,2]>=3)

#########list###########################
x=c(1.2, 3.5,4.8,5)
b=LETTERS[1:5]
c=matrix(1:6,nrow=3)
lis1=list(a,b,c,d)
lis1[[3]]

#################Basic functions in R
round(c(2.500, 3.5868),2) 
ceiling(c(2.500, 3.5868)) ##returns a numeric vector containing the smallest integers
floor(c(2.500, 3.5868)) #returns a numeric vector containing the largest integers
c(4,5)%%2 ##remainder

x=c(2,3,5,8)
y=c(2,6,8,9,10)
union(x,y)
intersect(x,y)
##statistical function
y=runif(100, min=0, max=1) #Generate 100 random numbers
x=rnorm(100,mean=0,sd=1) ##Generate 100 random numbers that follows the normal distribution

max(x); min(x); range(x)
sum(x); mean(x); median(x); sd(x)
seq(from = 1, to = 20, by = 5) #Generate regular sequences. 

#####################################################
####################Get your input data################
f=read.table("hmp3.test.hmp.txt",head=T,as.is=T,sep="\t",na.strings = "NA",comment.char = "")
f2=read.table("hmp3.test.vcf",skip=26,head=T,as.is=T,sep="\t",na.strings = "NA",comment.char = "")
head(f2)
system.time(read.table("hmp3.test.hmp.txt",head=T,as.is=T,sep="\t",na.strings = "NA",comment.char = ""))
system.time(read.table("hmp3.test.vcf",skip=26,head=T,as.is=T,sep="\t",na.strings = "NA",comment.char = ""))

library(data.table)
f3=fread("hmp3.test.vcf",skip=26,head=T,data.table = F,sep="\t")
system.time(fread("hmp3.test.vcf",skip=26,head=T,data.table = F,sep="\t") )

Sys.time()
f3=fread("hmp3.test.vcf",skip=26,head=T,data.table = F,sep="\t")           
Sys.time()

#######################Get your output file#################
write.table(f2,file="My_out_file.txt",sep="\t",col.names = T,row.names = F,quote=F)
fwrite(f2,file="My_out_file.txt",sep="\t",col.names = T,row.names = F,quote=F)
