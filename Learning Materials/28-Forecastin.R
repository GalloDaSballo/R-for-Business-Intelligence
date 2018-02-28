library(tseries)
library(zoo)
index(Amazon.adj.retCC) <- as.yearmon(index(Amazon.adj.retCC))
dataset.z <- Amazon.adj.retCC 
colnames(dataset.z) <- "HPQ"
##Sennò si ripete ultimo mese

plot( index(dataset.z), dataset.z[,1], xlab="Dates", ylab="Adjusted Closing", type="l")
fit <- stl( dataset.z[,1], s.window="period" )
plot(fit)

returns <- diff( log(dataset.z) )
plot(returns)

fitRet <- stl( returns[,1], s.window="period" )
plot(fitRet)

##Nome delle righe?
attributes( fit )

##Riassunto ARMA?
summary( arma( returns, order = c(2, 2) ) )

#install.packages( "forecast" )
library( forecast )

returnsTrain <- returns[1:(0.9 * length(returns))]  # Train dataset
returnsTest <- returns[(0.9 * length(returns) + 1):length(returns)]  # Test dataset
fit <- arima(returnsTrain, order = c(2, 0, 2))

arma.preds <- predict(fit, n.ahead = (length(returns) - (0.9 * length(returns))))$pred
arma.forecast <- forecast(fit, h = 25)
plot(arma.forecast, main = "ARMA forecasts for HPQ returns")

accuracy(arma.preds, returnsTest)[2] # RMSE values




