chart.ex <-
  function() {
    par(ask=TRUE)
    require(quantmod)
    getSymbols("AAPL",src="yahoo")
    barChart(AAPL)
    candleChart(AAPL,multi.col=TRUE,theme="white")
    chartSeries(to.monthly(AAPL), name="AAPL", up.col="white", dn.col="blue")
    getSymbols("XPT/USD",src="oanda") 
    chartSeries(XPTUSD,name="Platinum (.oz) in $USD")
    chartSeries(to.weekly(XPTUSD),name="Platinum (.oz) in $USD",up.col="white",dn.col="blue")
    par(ask=FALSE)
  }
