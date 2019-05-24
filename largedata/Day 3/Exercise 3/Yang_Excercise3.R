#This code is for the Day2 Exercise in Introduction of R programming
#This code was written by Zhikai Yang on 8/17/2017 

library(moments)             #use package "moments"

#########Q1##################

speciesarea<-read.csv("speciesarea.csv")

x <- speciesarea[,2]  ## Area                    #1a.	Calculate the correlation between A and M
y <- speciesarea[,3]  ## Mammals
cor.test(x,y)

lnA<-log(x)                                      #1b.	Calculate the correlation between lnA and lnM
lnM<-log(y)
cor.test(lnA,lnM)


bird<-read.csv("bird.csv", header=T)             #1c. merge and calculate the correlation between M and B
MB<-merge(bird, speciesarea, by=c("Name"))
z<-MB[,2]             ## Bird
cor.test(z,y)



#########Q2##################

rm(list=ls(all=TRUE)) ##clean the memory         #2a.ANOVA of infant mortality and region
infant<-read.csv("infantmortality.csv")

y<-infant[,3] ## infant mortality
trt<-infant[,4]## region
boxplot(y~trt, ylab="infant mortality") 
summary(aov(y~trt)) 



rm(list=ls(all=TRUE)) ##clean the memory         #2b.ANOVA of infant mortality and oil-exporting or not
infant<-read.csv("infantmortality.csv")

y<-infant[,3] ## infant mortality
trt<-infant[,5]## oil-exporting or not
boxplot(y~trt, ylab="infant mortality") 
summary(aov(y~trt)) 



rm(list=ls(all=TRUE)) ##clean the memory         #2c.linear regression of income and infant mortality
infant<-read.csv("infantmortality.csv")

x <- infant[,2]  ## income
y <- infant[,3]  ## infant mortality
lm(y~x) ## linear model regression
summary(lm(y~x)) ## summarize all results of the linear model regression
plot(x,y, xlab="per-capital income", ylab="infant mortality rate" ) ## plot the data
abline(lm(y~x)) ##include the regression line in the plot




#########Q3##################

rm(list=ls(all=TRUE)) ##clean the memory 
justice<-read.csv("justice.csv",header=T, row.names=2)

x <- justice[,5]  ## First Amendment                    #3a.	Calculate the correlation between First Amendment  and Economic
y <- justice[,7]  ## Economic
cor.test(x,y)

                                                        #3b.  hc cluster analysis
d<-dist(justice,method="euclidean") ##calculate the Euclidean distance between each data point
hc<-hclust(d,method="complete") ## do the cluster analysis
plot(hc) ##plot the result of cluster analysis




##########Q4#################

y <- c("q", "w", "e", "r", "z", "c")
for (x in y) { 
  print(x) ##task statement
}



##########Q5#################

rm(list=ls(all=TRUE)) ##clean the memory 

a = matrix(c(1:1000000), nrow =100000  , ncol = 10)            # for loop without apply
SUM = NULL
y<-c(1:100000)
for (x in y){
  SUM[x]=sum(a[x,])
}


rm(list=ls(all=TRUE)) ##clean the memory                      # apply method

a = matrix(c(1:1000000), nrow =100000  , ncol = 10)

apply(a,1,sum)

