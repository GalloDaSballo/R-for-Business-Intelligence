#Richiede di avere i file AAPL.csv e MSFT.csv scaricati manualmente da yahoo

aapl.df = read.csv("AAPL.csv", header=TRUE, stringsAsFactors=FALSE)
msft.df = read.csv("MSFT.csv", header=TRUE, stringsAsFactors=FALSE)
td_aapl = as.Date(aapl.df$Date, format="%Y-%m-%d")
td_msft = as.Date(msft.df$Date, format="%Y-%m-%d")
class(td_msft)

td_msft = td_msft+60
td_aapl

td_msft

library(zoo)
aapl.z = zoo( x=aapl.df$Adj.Close, order.by=td_aapl)
msft.z = zoo( x=msft.df$Adj.Close, order.by=td_msft)

#Dopo aver shifato di 60 giorni, mergia e plotta
plot(merge(aapl.z, msft.z))