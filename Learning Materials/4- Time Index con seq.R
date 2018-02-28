timeIndex <- seq(as.Date("2010/3/1"), as.Date("2014/3/1"), "days")
td <- seq(as.Date("2010/3/1"), as.Date("2014/3/1"), "months")
library(quantmod)
getSymbols("MSFT")
msft.df <- MSFT

library(zoo)

zoo1 <- zoo(msft.df, timeIndex)

msft.z = zoo(x=msft.df$MSFT.Adjusted, order.by=td)

PAGINA 18 del ppt 4