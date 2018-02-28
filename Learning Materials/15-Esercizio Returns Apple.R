aapl.df = read.csv("AAPL.csv", header = TRUE, stringsAsFactors = FALSE)
n = nrow(aapl.df)
g = aapl.df$Adj.Close[2:n]
f = aapl.df$Adj.Close[1:n-1]
class(g)
class(f)
aapl.ret = as.numeric(g)/as.numeric(f) -1

msft.df = read.csv("MSFT.csv", header = TRUE, stringsAsFactors = FALSE)
l = nrow(msft.df)
print(l)
#From 2 to end
g = msft.df$Adj.Close[2:n]
#From 1 to end-1
f = msft.df$Adj.Close[1:n-1]
#month-to-month returns
msft.ret = as.numeric(g)/as.numeric(f) -1

#Continuosly compounded returns
msft.ccret = log(1 + msft.ret)


#QUANDO HAI UNO ZOO
aaplRet.z = diff(aapl.z)/lag(aapl.z, k=-1)
aaplRetcc.z = diff(log(aapl.z))

#CON PERFORMANCE ANALYTICS
aaplmsftRet.z = CalculateReturns(aaplmsft.z , method="simple")
aaplmsftRetcc.z = CalculateReturns(aaplmsft.z, method="compound")
