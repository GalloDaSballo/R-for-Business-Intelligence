#If you're looking for the open, the high, or the series low - 
#it's available: Op, Hi, Lo, Cl, Vo, Ad - 
#extract the columns Open, High, Low, Close, Volume, and Adjusted (Yahoo)

getSymbols("GS") #Goldman OHLC from yahoo

is.OHLC(GS) # does the data contain at least OHL and C?

has.Vo(GS) # how about volume?

Op(GS) # just the Open column please.

seriesHi(GS) # where and what was the high point

#Op, Hi, Lo, Cl, Vo, Ad -> Retrieves Open, High; Low, Close, Volume, Adjusted

OpCl(GS) #daily percent change open to close 
OpOp(GS) #one period open to open change
HiCl(GS) #the percent change from high to close


Lag(Cl(GS)) #One period lag of the close 
Lag(Cl(GS),c(1,3,5)) #One, three, and five period lags 
Next(OpCl(GS)) #The next periods open to close - today! 


Delt(Op(GS),Cl(GS),k=1:3) # Open to close one-day, two-day and three-day lags 


#Subsetting by Date
GS['2007'] #returns all Goldman's 2007 OHLC 
GS['2008'] #now just 2008 
GS['2008-01'] #now just January of 2008 
GS['2007-06::2008-01-12'] #Jun of 07 through Jan 12 of 08 
GS['::'] # everything in GS 
GS['2008::'] # everything in GS, from 2008 onward
non.contiguous <- c('2007-01-10','2007-01-1','2007-1-8') 
GS[non.contiguous]


periodicity(GS)
unclass(periodicity(GS))
to.weekly(GS) 
to.monthly(GS) 
periodicity(to.monthly(GS)) 
ndays(GS); nweeks(GS); nyears(GS) 
# Let's try some non-OHLC to start 
getFX("USD/EUR") 
periodicity(USDEUR) 
to.weekly(USDEUR) 
periodicity(to.weekly(USDEUR))