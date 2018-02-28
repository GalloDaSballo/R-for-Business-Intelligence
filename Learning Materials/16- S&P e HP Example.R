library("zoo")
library("tseries")
# get monthly adjusted closing price for Hewlett-Packard Company (HPQ) and SP500 from Yahoo from  Jan 1998 through Sept 2014. 

HPQ.z = get.hist.quote(instrument="HPQ", start="1998-01-01",end="2014-09-30", quote="AdjClose",
                       provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo")

SP500.z = get.hist.quote(instrument="^gspc", start="1998-01-01", end="2014-09-30", quote="AdjClose",
                         provider="yahoo", origin="1970-01-01", compression="m", retclass="zoo")

index(SP500.z) = as.yearmon(index(SP500.z))
index(HPQ.z) = as.yearmon(index(HPQ.z))
colnames(HPQ.z)
# add column names 
colnames(HPQ.z) = "HPQ"
colnames(SP500.z) = "SP500"
# merge
HPQ_SP500.z = merge(HPQ.z, SP500.z)
head(HPQ_SP500.z, n=3)

#Adjusted Closing Prices
plot(HPQ_SP500.z, main="Adjusted Closing Prices",  lwd=2, col="blue")

# cc returns 
HPQ.ret = diff(log(HPQ.z))
SP500.ret = diff(log(SP500.z))
colnames(HPQ.ret) = "HPQ"
colnames(SP500.ret) = "SP500"
HPQ_SP500.ret = merge(HPQ.ret,SP500.ret)

head(HPQ_SP500.ret,n=3)
class(HPQ_SP500.ret)

# plot cc returns on 2 charts; add to each chart a horizontal line
?plot.zoo
plot(HPQ_SP500.ret, main="Monthly cc returns on HPQ and SP500", lwd=2, col="blue", panel = function(...){lines(...); abline(h=0);} )


# plot cc returns on the same plot
plot(HPQ_SP500.ret, plot.type="single",main="Monthly cc returns on HPQ and SP500", col=c("red", "blue"), lty=c("dashed", "solid"), lwd=2, ylab="CC Returns")
abline(h=0)
legend(x="bottomright", legend=c("HPQ","SP500"), lty=c("dashed", "solid"), lwd=2, col=c("red","blue"))

#PARAGONA CON WHITE NOISE
set.seed(27)
gn = rnorm(length(HPQ.ret),mean=mean(HPQ.ret),sd=sd(HPQ.ret))
gn.ret = zoo(gn, index(HPQ.ret))
HPQ_GWN.ret=merge(HPQ.ret, gn.ret)
colnames(HPQ_GWN.ret)=c("HPQ","GWN")
plot(HPQ_GWN.ret, lwd=2, col="blue", main="", panel = function(...){lines(...); abline(h=0);} )