#### Richiede F0 e F1

###Descriptive 2/3
##4 Boxplots
#Amazon
Amazon.ret.mat = coredata(Amazon.adj.retCC)
Amazon.density = density(coredata(Amazon.adj.retCC))
par(mfrow=c(2,2))
##Grafico dei monthly returns
plot(Amazon.adj.retCC, main="Monthly cc returns on Amazon", xlab="", ylab="cc returns",lwd=2, col="blue")
abline(h=0)
#Histogramma distribuzione rispetto a normale
hist(Amazon.ret.mat, main="Monthly cc returns on Amazon", xlab="Amazon.adj.retCC", col="red", probability=TRUE, ylim=c(0,8))
points(Amazon.density,type="l", col="blue", lwd=2)
#Boxplot
boxplot(Amazon.ret.mat, main="Amazon Boxplot CC Returns")
##Disegna i quantili teorici vs quelli veri + linea dei quantili
qqnorm(Amazon.ret.mat, main="Amazon Returns", col="blue")
qqline(Amazon.ret.mat)
par(mfrow=c(1,1))

#Walmart
Walmart.ret.mat = coredata(Walmart.adj.retCC)
Walmart.density = density(coredata(Walmart.adj.retCC))
par(mfrow=c(2,2))
##Grafico dei monthly returns
plot(Walmart.adj.retCC, main="Monthly cc returns on Walmart", xlab="", ylab="cc returns",lwd=2, col="blue")
abline(h=0)
#Histogramma distribuzione rispetto a normale
hist(Walmart.ret.mat, main="Monthly cc returns on Walmart", xlab="Walmart.adj.retCC", col="red", probability=TRUE, ylim=c(0,8))
points(Walmart.density,type="l", col="blue", lwd=2)
#Boxplot
boxplot(Walmart.ret.mat, main="Walmart Boxplot CC Returns")
##Disegna i quantili teorici vs quelli veri + linea dei quantili
qqnorm(Walmart.ret.mat, main="Walmart Returns", col="blue")
qqline(Walmart.ret.mat)
par(mfrow=c(1,1))

#Facebook
Facebook.ret.mat = coredata(Facebook.adj.retCC)
Facebook.density = density(coredata(Facebook.adj.retCC))
par(mfrow=c(2,2))
##Grafico dei monthly returns
plot(Facebook.adj.retCC, main="Monthly cc returns on Facebook", xlab="", ylab="cc returns",lwd=2, col="blue")
abline(h=0)
#Histogramma distribuzione rispetto a normale
hist(Facebook.ret.mat, main="Monthly cc returns on Facebook", xlab="Facebook.adj.retCC", col="red", probability=TRUE, ylim=c(0,8))
points(Facebook.density,type="l", col="blue", lwd=2)
#Boxplot
boxplot(Facebook.ret.mat, main="Facebook Boxplot CC Returns")
##Disegna i quantili teorici vs quelli veri + linea dei quantili
qqnorm(Facebook.ret.mat, main="Facebook Returns", col="blue")
qqline(Facebook.ret.mat)
par(mfrow=c(1,1))

#Google
Google.ret.mat = coredata(Google.adj.retCC)
Google.density = density(coredata(Google.adj.retCC))
par(mfrow=c(2,2))
##Grafico dei monthly returns
plot(Google.adj.retCC, main="Monthly cc returns on Google", xlab="", ylab="cc returns",lwd=2, col="blue")
abline(h=0)
#Histogramma distribuzione rispetto a normale
hist(Google.ret.mat, main="Monthly cc returns on Google", xlab="Google.adj.retCC", col="red", probability=TRUE, ylim=c(0,8))
points(Google.density,type="l", col="blue", lwd=2)
#Boxplot
boxplot(Google.ret.mat, main="Google Boxplot CC Returns")
##Disegna i quantili teorici vs quelli veri + linea dei quantili
qqnorm(Google.ret.mat, main="Google Returns", col="blue")
qqline(Google.ret.mat)
par(mfrow=c(1,1))

#Comcast
Comcast.ret.mat = coredata(Comcast.adj.retCC)
Comcast.density = density(coredata(Comcast.adj.retCC))
par(mfrow=c(2,2))
##Grafico dei monthly returns
plot(Comcast.adj.retCC, main="Monthly cc returns on Comcast", xlab="", ylab="cc returns",lwd=2, col="blue")
abline(h=0)
#Histogramma distribuzione rispetto a normale
hist(Comcast.ret.mat, main="Monthly cc returns on Comcast", xlab="Comcast.adj.retCC", col="red", probability=TRUE, ylim=c(0,8))
points(Comcast.density,type="l", col="blue", lwd=2)
#Boxplot
boxplot(Comcast.ret.mat, main="Comcast Boxplot CC Returns")
##Disegna i quantili teorici vs quelli veri + linea dei quantili
qqnorm(Comcast.ret.mat, main="Comcast Returns", col="blue")
qqline(Comcast.ret.mat)
par(mfrow=c(1,1))

#Charter
Charter.ret.mat = coredata(Charter.adj.retCC)
Charter.density = density(coredata(Charter.adj.retCC))
par(mfrow=c(2,2))
##Grafico dei monthly returns
plot(Charter.adj.retCC, main="Monthly cc returns on Charter", xlab="", ylab="cc returns",lwd=2, col="blue")
abline(h=0)
#Histogramma distribuzione rispetto a normale
hist(Charter.ret.mat, main="Monthly cc returns on Charter", xlab="Charter.adj.retCC", col="red", probability=TRUE, ylim=c(0,8))
points(Charter.density,type="l", col="blue", lwd=2)
#Boxplot
boxplot(Charter.ret.mat, main="Charter Boxplot CC Returns")
##Disegna i quantili teorici vs quelli veri + linea dei quantili
qqnorm(Charter.ret.mat, main="Charter Returns", col="blue")
qqline(Charter.ret.mat)
par(mfrow=c(1,1))

##Analisi Univariata
library("PerformanceAnalytics")
#Amazon
mean(Amazon.ret.mat)
var(Amazon.ret.mat)
sd(Amazon.ret.mat)
skewness(Amazon.ret.mat) 
kurtosis(Amazon.ret.mat)
summary(Amazon.ret.mat)

#Walmart
mean(Walmart.ret.mat)
var(Walmart.ret.mat)
sd(Walmart.ret.mat)
skewness(Walmart.ret.mat) 
kurtosis(Walmart.ret.mat)
summary(Walmart.ret.mat)

#Facebook
mean(Facebook.ret.mat)
var(Facebook.ret.mat)
sd(Facebook.ret.mat)
skewness(Facebook.ret.mat) 
kurtosis(Facebook.ret.mat)
summary(Facebook.ret.mat)

#Google
mean(Google.ret.mat)
var(Google.ret.mat)
sd(Google.ret.mat)
skewness(Google.ret.mat) 
kurtosis(Google.ret.mat)
summary(Google.ret.mat)

#Comcast
mean(Comcast.ret.mat)
var(Comcast.ret.mat)
sd(Comcast.ret.mat)
skewness(Comcast.ret.mat) 
kurtosis(Comcast.ret.mat)
summary(Comcast.ret.mat)

#Charter
mean(Charter.ret.mat)
var(Charter.ret.mat)
sd(Charter.ret.mat)
skewness(Charter.ret.mat) 
kurtosis(Charter.ret.mat)
summary(Charter.ret.mat)


