##Usa Dati da 16- S&P e HP
#PDF = Probability Density Function
HPQ.ret.mat = coredata(HPQ.ret)
SP500.ret.mat = coredata(SP500.ret)
HPQ_SP500.ret.mat = coredata(HPQ_SP500.ret)
hist(HPQ.ret.mat,main="Histogram of CC HPQ monthly returns", probability=TRUE, col="red")

hist(gn,main="Histogram of GWN same Mean and SD as HPQ CC monthly returns", probability=TRUE, col="red")

# define  breakpoints for both HPQ histogram object in R
HPQ.b = hist(HPQ.ret.mat,pplot=F,breaks=20)
names(HPQ.b)
par(mfrow=c(2,1))
hist(HPQ.ret.mat,main="HPQ",probability=TRUE, col="red", xlab="returns")
hist(SP500.ret.mat,main="SP500", probability=TRUE, col="red", xlab="returns", breaks=HPQ.b$breaks)
par(mfrow=c(1,1))

#Density Plot -> Migliore di istogramma per PDF
# use density() to plot smoothed pdf
HPQ.density = density(HPQ.ret.mat)
plot(HPQ.density,type="l",xlab="returns", col="blue", lwd=2,
      ylab="density estimate",main="Smoothed HPQ histogram")

# put hist(()) and density() plot 
hist(HPQ.ret.mat,main="", xlab="HPQ returns", col="red", probability=TRUE, ylim=c(0,8))
points(HPQ.density,type="l", col="blue", lwd=2)

#plot cc returns and estimated densities over histograms for HPQ & GWN
par(mfrow=c(2,2))
plot(HPQ.ret, main="Monthly cc returns on HPQ", xlab="", ylab="cc returns",lwd=2, col="blue")
abline(h=0)

plot(gn.ret, main="Monthly cc returns on GWN", xlab="", ylab="cc returns", lwd=2, col="blue")
abline(h=0)

hist(HPQ.ret.mat, main="", xlab="HPQ returns", col="red", probability=TRUE, ylim=c(0,5))
points(HPQ.density,type="l", col="blue", lwd=2)

hist(gn, main="", xlab="GWN returns", col="red", probability=TRUE, ylim=c(0,5), breaks=HPQ.b$breaks)
points(density(gn), type="l", col="blue", lwd=2)
par(mfrow=c(1,1))
