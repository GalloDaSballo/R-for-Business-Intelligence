# wdir = "<path>" #Save the Path to WD in a variable

#setwd(wdir)
init(quantmod); init(xts) #loads quantmod, to get financial data, and xts=extensible time series
getSymbols("AAPL", src="yahoo")
saveRDS(AAPL, file="Apple.rds") #saves the RDS in WD
Apple = readRDS("Apple.rds") #reads and loads APPL in Apple var
chartSeries(Apple) #Displays chart of rds


#ESEMPIO AVANZATO
#Log Returns
library(quantmod)
getSymbols("AAPL", from="2007-01-03", to="2011-12-02")
AAPL.rtn = diff(log(AAPL$AAPL.Adjusted)) #Compute Log Returns
chartSeries(AAPL.rtn,theme="white")

#Treasury Bonds
getSymbols("^TNX",from="2007-01-03",to="2011-12-02")
TNX.rtn = diff(TNX$TNX.Adjusted)
chartSeries(TNX.rtn)

#Euro Dollaro
getSymbols("DEXUSEU", src="FRED")
USEU.rtn=diff(log(DEXUSEU$DEXUSEU))
chartSeries(DEXUSEU)
chartSeries(USEU.rtn)


#ESEMPIO PIU AVANZATO
getSymbols("GS") #Goldman from Yahoo
chartSeries(GS, TA = NULL) #TA indicator calls, null -> don't draw (no volume etc)

chartSeries(GS, TA="addVo(); addBBands(); addCCI()") #Con volume, bollinger bands and commodity channel index


