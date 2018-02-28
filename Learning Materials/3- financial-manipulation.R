library(quantmod)
library(xts)
getSymbols("NFLX")
saveRDS(NFLX , file="NFLX.rds") #saves the RDS in WD
NFLX = readRDS("NFLX.rds") #reads and loads APPL in NFLX var
getSymbols("AMZN")
saveRDS(AMZN, file="AMZN.rds") #saves the RDS in WD
AMZN = readRDS("AMZN.rds") #reads and loads APPL in AMZN var

combine.ts = ts(data=c(NFLX$NFLX.Adjusted, AMZN$AMZN.Adjusted), frequency = 365,start=c(2007,1), end=c(2007,12))



plot(combine.ts, plot.type="multiple", main="Monthly closing prices on XX and YYY",ylab="Adjusted close price",col=c("blue", "red"), lty=1:2)
