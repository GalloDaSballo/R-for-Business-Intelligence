library(dygraphs)
dygraph(GSPC)
dygraph(GSPC) %>%
  dySeries(name="GSPC.Open", label = "Open") %>%
  dySeries(name="GSPC.Close", label = "Close") %>%
  dyOptions(stackedGraph = TRUE) %>%
  dyRangeSelector(height = 20)

#ESEMPIO SERIO
require(quantmod)
require(dygraphs)

getSymbols("IBM",src = "yahoo",  from = as.Date("2015-01-01"), to = as.Date("2015-09-04"))
ibm_xts<-xts(IBM)

#Si vedono solo i volumi = inutile
dygraph(IBM) %>%
  dySeries(name="IBM.Open", label = "Open") %>%
  dySeries(name="IBM.Close", label = "Close") %>%
  dyOptions(stackedGraph = TRUE) %>%
  dyRangeSelector(height = 20)


require(quantmod)
require(dygraphs)

getSymbols("IBM",src = "yahoo",  from = as.Date("2015-01-01"), to = as.Date("2015-09-04"))
ibm_xts<-xts(IBM)

#Meglio, si vede tutto
dySeries(dygraph(Op(IBM), main= "IBM Open Values"),name="IBM.Open", label = "IBM Open") %>%
  dyOptions(stackedGraph = TRUE) %>%
  dyRangeSelector(height = 20)


require(quantmod)
require(dygraphs)

getSymbols("IBM",src = "yahoo",  from = as.Date("2015-01-01"), to = as.Date("2015-09-04"))
getSymbols("AAPL",src = "yahoo",  from = as.Date("2015-01-01"), to = as.Date("2015-09-04"))

dataset= cbind(AAPL,IBM)


dygraph(dataset) %>%
  dySeries(name="IBM.Open", label = "IBM Open") %>%
  dySeries(name="AAPL.Open", label = "AAPL Open") %>%
  dyOptions(stackedGraph = TRUE) %>%
  dyRangeSelector(height = 20)
