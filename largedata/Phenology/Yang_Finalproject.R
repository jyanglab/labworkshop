#This code is for the Final project in Introduction of R programming
#This code was written by Zhikai Yang on 8/18/2017 

############regression between year and temperature################

rm(list=ls(all=TRUE)) ##clean the memory  
PS<-read.csv("PS.csv",header=T)

x <- PS[,4]  ## Year
y <- PS[,6]  ## Temperature
lm(y~x) ## linear model regression
summary(lm(y~x)) ## summarize all results of the linear model regression
plot(x,y, xlab="Year", ylab="Temperature (Celsius) " ) ## plot the data
abline(lm(y~x)) ##include the regression line in the plot


############regression between year and mean temperature for a year################
rm(list=ls(all=TRUE)) ##clean the memory  
PS<-read.csv("PS.csv",header=T)
yearmean<-as.data.frame(tapply(PS$Temperature..Celsius.,PS$Year,mean))
yearmean$year<-rownames(yearmean)
colnames(yearmean)[1]<-"mean"
x <- as.numeric(yearmean$year)  ## Year
y <- as.numeric(yearmean$mean)  ## Temperature
lm(y~x) ## linear model regression
summary(lm(y~x)) ## summarize all results of the linear model regression
plot(x,y, xlab="Year", ylab="Temperature (Celsius) " ) ## plot the data
abline(lm(y~x)) ##include the regression line in the plot


############regression between Temperature and Flowering Date################

rm(list=ls(all=TRUE)) ##clean the memory         
PS<-read.csv("PS.csv",header=T)

x <- PS[,6]  ## Temperature
y <- PS[,7]  ## Flowering Date
lm(y~x) ## linear model regression
summary(lm(y~x)) ## summarize all results of the linear model regression
plot(x,y, xlab="Temperature (Celsius)", ylab="Flowering Date(Day of Year)" ) ## plot the data
abline(lm(y~x)) ##include the regression line in the plot




############regression Temperature(low temperature range) and Flowering Date################

rm(list=ls(all=TRUE)) ##clean the memory  
LT<-read.csv("Low.csv",header=T)

x <- LT[,6]  ## Temperature
y <- LT[,7]  ## Flowering Date
lm(y~x) ## linear model regression
summary(lm(y~x)) ## summarize all results of the linear model regression
plot(x,y, xlab="Low Temperature (Celsius)", ylab="Flowering Date(Day of Year)" ) ## plot the data
abline(lm(y~x)) ##include the regression line in the plot




############regression between Temperature(high temperature range) and Flowering Date############

rm(list=ls(all=TRUE)) ##clean the memory  
HT<-read.csv("High.csv",header=T)

x <- HT[,6]  ## Temperature
y <- HT[,7]  ## Flowering Date
lm(y~x) ## linear model regression
summary(lm(y~x)) ## summarize all results of the linear model regression
plot(x,y, xlab="High Temperature (Celsius)", ylab="Flowering Date(Day of Year)" ) ## plot the data
abline(lm(y~x)) ##include the regression line in the plot




#############ANOVA of different species and flowering date###################
rm(list=ls(all=TRUE)) ##clean the memory         
PS<-read.csv("PS.csv", header = T)

y<-PS[,7] ## Flowering date
trt<-PS[,1]## species
boxplot(y~trt, ylab="Flowering Date(Day of year)") 
summary(aov(y~trt)) 