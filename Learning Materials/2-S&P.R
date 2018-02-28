

# get S&P 500 data from FRED (St. Louis Fed) 
sp500 <- na.omit( getSymbols("SP500", src = "FRED", from = "1949-12-31", auto.assign = FALSE ) )

 # use monthly data 
sp500.monthly <- sp500[endpoints(sp500, on ="months")]
