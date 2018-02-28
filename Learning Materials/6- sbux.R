sbux.df = read.csv("SBUX.csv", header = TRUE, stringsAsFactors = FALSE)
colnames(sbux.df) #i nomi delle colonne
class(sbux.df$Date)
class(sbux.df$Volume)
class(sbux.df$Adj.Close)
sbux.ts = ts(data=sbux.df$Adj.Close, frequency = 12,start=c(2010,3), end=c(2015,3))
class(sbux.ts)
plot(sbux.ts, col="blue", lwd=2, ylab="Adjusted close", main="Monthly closing price of SBUX")


msft.df = read.csv("MSFT.csv", header = TRUE, stringsAsFactors = FALSE)
msft.ts = ts(data=msft.df$Adj.Close, frequency = 12, start=c(2010,3), end=c(2015,3))

index = seq(as.Date("2010/3/1"), as.Date("2014/3/1"), "days")
sbux.z = zoo(sbux.df, index)