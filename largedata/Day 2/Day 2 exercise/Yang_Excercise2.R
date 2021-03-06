#This code is for the Day2 Exercise in Introduction of R programming
#This code was written by Zhikai Yang on 8/16/2017

library(moments)             #use package "moments"

#Read file "cuckoos" for question 1,2

cuckoos<-read.csv("https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/DAAG/cuckoos.csv")

attach(cuckoos)              #If we didn't use attach we would need to use cuckoos$XXX

#Q1

par(mfrow=c(1,1))

hist(length, breaks=seq(19.5,25,0.25))         #1a.	Plot a histogram of egg length.

hist(breadth, breaks=seq(15,17.5,0.125))       #1b.	Plot a histogram of egg length.

skewness(length)                               #1c.	Find the skewness value for egg length and breadth.
skewness(breadth)

kurtosis(length)                               #1d.	Find the kurtosis value for egg length and breadth. 
kurtosis(breadth)

shapiro.test(length)                           #1f.	Run a Shapiro-Wilk on egg length and breadth. 
shapiro.test(breadth)



#Q2
par(mfrow=c(1,1))
boxplot(breadth~species, data=cuckoos, 
        col=c("red","orange","yellow","green","blue", "purple"), ylab="breadth") #2a.	Create a box plot of the egg breadth of each species. 

hedge.sparrow<-subset(cuckoos, species == "hedge.sparrow", select = breadth)     #2b.	Calculate the mean egg breadth for each species. 
meadow.pipit<-subset(cuckoos, species == "meadow.pipit", select = breadth)
pied.wagtail<-subset(cuckoos, species == "pied.wagtail", select = breadth)
robin <-subset(cuckoos, species == "robin", select = breadth)
tree.pipit<-subset(cuckoos, species == "tree.pipit", select = breadth)
wren<-subset(cuckoos, species == "wren", select = breadth)

hedge.sparrowm<-mean(hedge.sparrow$breadth)
meadow.pipitm<-mean(meadow.pipit$breadth)
pied.wagtailm<-mean(pied.wagtail$breadth)
robinm<-mean(robin$breadth)
tree.pipitm<-mean(tree.pipit$breadth)
wrenm<-mean(wren$breadth)

boxplot(length~species, data=cuckoos,                                            #2c.	Create a box plot of the egg length for each species.
        col=c("red","orange","yellow","green","blue", "purple"), ylab="length") 

hedge.sparrow<-subset(cuckoos, species == "hedge.sparrow", select = length)      #2d. Calculate the sd of egg length for each species.
meadow.pipit<-subset(cuckoos, species == "meadow.pipit", select = length)
pied.wagtail<-subset(cuckoos, species == "pied.wagtail", select = length)
robin <-subset(cuckoos, species == "robin", select = length)
tree.pipit<-subset(cuckoos, species == "tree.pipit", select = length)
wren<-subset(cuckoos, species == "wren", select = length)

hedge.sparrowsd<-sd(hedge.sparrow$length)
meadow.pipitsd<-sd(meadow.pipit$length)
pied.wagtailsd<-sd(pied.wagtail$length)
robinsd<-sd(robin$length)
tree.pipitsd<-sd(tree.pipit$length)
wrensd<-sd(wren$length)

breadthstand<-scale(breadth)                                                     #2e.	Create a scatter plot of standardized egg breadth and width. 
lengthstand<-scale(length)
plot(breadthstand,lengthstand)
abline(lm(breadthstand~lengthstand), lty=4)

detach(cuckoos)





#Read file "sugarcane" for question 3,4,5

sugarcane<-read.csv("https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/boot/cane.csv")  

attach(sugarcane)



#Q3Scatter plot

sugarcane$color[sugarcane$block=="A"]<-"tomato2" 
sugarcane$color[sugarcane$block=="B"]<-"dodgerblue4" 
sugarcane$color[sugarcane$block=="C"]<-"orange" 
sugarcane$color[sugarcane$block=="D"]<-"dark green" 

par(mfrow=c(1,1))
plot(r~n, data=sugarcane, col=color,xlab="Total number of shoots in each plot",ylab="The number of diseased shoots", pch=19)
legend("topleft", pch=c(19, 19,19,19), 
       col=c("tomato2", "dodgerblue4","orange","dark green"), 
       legend=c("Block A", "Block B","Block C","Block D"))
abline(lm(r~n), lty=1)

par(mfrow=c(2,2))
sugarcane.A<-sugarcane[sugarcane$block=="A",]
sugarcane.B<-sugarcane[sugarcane$block=="B",]
sugarcane.C<-sugarcane[sugarcane$block=="C",]
sugarcane.D<-sugarcane[sugarcane$block=="D",]

plot(r~n, data=sugarcane.A, col=color, pch=0, 
     xlim=c(min(sugarcane$n), max(sugarcane$n)),
     ylim=c(min(sugarcane$r), max(sugarcane$r)),xlab="Total number of shoots in each plot",
     ylab="The number of diseased shoots", main="Block A")
abline(lm(r~n, data=sugarcane.A),lty=2,lwd=2)

plot(r~n, data=sugarcane.B, col=color, pch=15, 
     xlim=c(min(sugarcane$n), max(sugarcane$n)),
     ylim=c(min(sugarcane$r), max(sugarcane$r)),xlab="Total number of shoots in each plot",
     ylab="The number of diseased shoots",main="Block B")
abline(lm(r~n, data=sugarcane.B),lty=3,lwd=2)

plot(r~n, data=sugarcane.C, col=color, pch=2, 
     xlim=c(min(sugarcane$n), max(sugarcane$n)),
     ylim=c(min(sugarcane$r), max(sugarcane$r)),xlab="Total number of shoots in each plot",
     ylab="The number of diseased shoots",main = "Block C")
abline(lm(r~n, data=sugarcane.C),lty=4,lwd=2)

plot(r~n, data=sugarcane.D, col=color, pch=17, 
     xlim=c(min(sugarcane$n), max(sugarcane$n)),
     ylim=c(min(sugarcane$r), max(sugarcane$r)),xlab="Total number of shoots in each plot",
     ylab="The number of diseased shoots",main="Block D")
abline(lm(r~n, data=sugarcane.D),lty=2,lwd=3)




#Q4 Boxplot

par(mfrow=c(1,1))                                                                                                                                
boxplot(n~block, data=sugarcane, log="y",                                         #log scale y axis
        col=c("tomato2","dodgerblue4","orange","dark green" ), 
        ylab="The number of shoots in each plot[log scale]",xlab="Block",pch=20)




#5 Bar plot

par(mfrow=c(1,1)) 
mean<-tapply(sugarcane$r, sugarcane$block, mean)
sd<-tapply(sugarcane$r, sugarcane$block, sd)
nbr<-tapply(sugarcane$r, sugarcane$block, length)
se<-sd/sqrt(nbr)

par(mfrow=c(1,1))
barplot(mean, col=c("tomato2","dodgerblue4","orange","dark green"), 
        border=c("tomato2","dodgerblue4","orange","dark green"), 
        ylab="The number of diseased shoots",xlab = "Block", ylim=c(0,30))


xx<-barplot(mean, plot=F)                                                   ##### adding error bars
arrows(xx, mean, xx, mean+se, angle=90, 
       col=c("tomato2","dodgerblue4","orange","dark green"), lwd=2)

