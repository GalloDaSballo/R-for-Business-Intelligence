###Alcuni titoli hanno storia minore di 10 anni
n_m_l <- 80 + 30 + 10
n <- 80/n_m_l
m <- 30/n_m_l
l <- 10/n_m_l

##TODO -> Fare analisi dei 10 rimanenti manualmente


##Per Amazon
library(tseries)
library(zoo)
index(Amazon.adj.z) <- as.yearmon(index(Amazon.adj.z))
colnames(Amazon.adj.z) <- "Amazon"
##Sennò si ripete ultimo mese
plot( index(Amazon.adj.z), main="Adjusted Closing Prices Amazon", Amazon.adj.z[,1], xlab="Dates", ylab="Adjusted Closing", type="l")
fit <- stl( Amazon.adj.z[,1], s.window="period" )
plot(fit, main="Fit for Amazon")
returns <- diff( log(Amazon.adj.z) )
plot(returns, main="CC Returns for Amazon")
fitRet <- stl( returns[,1], s.window="period" )
plot(fitRet, main="Fit Ret for Amazon")
##Nome delle righe
attributes( fit )
##Riassunto ARMA
summary( arma( returns) )
#install.packages( "forecast" )
library( forecast )
returnsTrain <- returns[1:(n * length(returns))]  # Train dataset
returnsTest <- returns[(n * length(returns) + 1):(n * length(returns)+ 1 + m * length(returns))]  # Test dataset
fit <- arima(returnsTrain, order = c(2, 0, 2))
arma.preds <- predict(fit, n.ahead = (length(returns) - (n * length(returns))))$pred
arma.forecast <- forecast(fit, h = 35)
plot(arma.forecast, main = "ARMA forecasts for Amazon returns")
print("Accuracy - Amazon")
print(accuracy(arma.preds, returnsTest)[2]) # RMSE values
lines( returnsTest )
par(mfrow=c(1,1))

##Per Walmart
library(tseries)
library(zoo)
index(Walmart.adj.z) <- as.yearmon(index(Walmart.adj.z))
colnames(Walmart.adj.z) <- "Walmart"
##Sennò si ripete ultimo mese
plot( index(Walmart.adj.z), main="Adjusted Closing Prices Walmart", Walmart.adj.z[,1], xlab="Dates", ylab="Adjusted Closing", type="l")
fit <- stl( Walmart.adj.z[,1], s.window="period" )
plot(fit, main="Fit for Walmart")
returns <- diff( log(Walmart.adj.z) )
plot(returns, main="CC Returns for Walmart")
fitRet <- stl( returns[,1], s.window="period" )
plot(fitRet, main="Fit Ret for Walmart")
##Nome delle righeattributes( fit )
##Riassunto ARMA
summary( arma( returns) )
#install.packages( "forecast" )
library( forecast )
returnsTrain <- returns[1:(n * length(returns))]  # Train dataset
returnsTest <- returns[(n * length(returns) + 1):(n * length(returns)+ 1 + m * length(returns))]  # Test dataset
fit <- arima(returnsTrain, order = c(2, 0, 2))
arma.preds <- predict(fit, n.ahead = (length(returns) - (n * length(returns))))$pred
arma.forecast <- forecast(fit, h = 35)
plot(arma.forecast, main = "ARMA forecasts for Walmart returns")
print("Accuracy - Walmart")
print(accuracy(arma.preds, returnsTest)[2]) # RMSE values
lines( returnsTest )
par(mfrow=c(1,1))

##Per Facebook
library(tseries)
library(zoo)
index(Facebook.adj.z) <- as.yearmon(index(Facebook.adj.z))
colnames(Facebook.adj.z) <- "Facebook"
##Sennò si ripete ultimo mese
plot( index(Facebook.adj.z), main="Adjusted Closing Prices Facebook", Facebook.adj.z[,1], xlab="Dates", ylab="Adjusted Closing", type="l")
fit <- stl( Facebook.adj.z[,1], s.window="period" )
plot(fit, main="Fit for Facebook")
returns <- diff( log(Facebook.adj.z) )
plot(returns, main="CC Returns for Facebook")
fitRet <- stl( returns[,1], s.window="period" )
plot(fitRet, main="Fit Ret for Facebook")
##Nome delle righeattributes( fit )
##Riassunto ARMA
summary( arma( returns) )
#install.packages( "forecast" )
library( forecast )
returnsTrain <- returns[1:(n * length(returns))]  # Train dataset
returnsTest <- returns[(n * length(returns) + 1):(n * length(returns)+ 1 + m * length(returns))]  # Test dataset
fit <- arima(returnsTrain, order = c(2, 0, 2))
arma.preds <- predict(fit, n.ahead = (length(returns) - (n * length(returns))))$pred
arma.forecast <- forecast(fit, h = 35)
plot(arma.forecast, main = "ARMA forecasts for Facebook returns")
print("Accuracy - Facebook")
print(accuracy(arma.preds, returnsTest)[2]) # RMSE values
lines( returnsTest )
par(mfrow=c(1,1))

##Per Google
library(tseries)
library(zoo)
index(Google.adj.z) <- as.yearmon(index(Google.adj.z))
colnames(Google.adj.z) <- "Google"
##Sennò si ripete ultimo mese
plot( index(Google.adj.z), main="Adjusted Closing Prices Google", Google.adj.z[,1], xlab="Dates", ylab="Adjusted Closing", type="l")
fit <- stl( Google.adj.z[,1], s.window="period" )
plot(fit, main="Fit for Google")
returns <- diff( log(Google.adj.z) )
plot(returns, main="CC Returns for Google")
fitRet <- stl( returns[,1], s.window="period" )
plot(fitRet, main="Fit Ret for Google")
##Nome delle righeattributes( fit )
##Riassunto ARMA
summary( arma( returns) )
#install.packages( "forecast" )
library( forecast )
returnsTrain <- returns[1:(n * length(returns))]  # Train dataset
returnsTest <- returns[(n * length(returns) + 1):(n * length(returns)+ 1 + m * length(returns))]  # Test dataset
fit <- arima(returnsTrain, order = c(2, 0, 2))
arma.preds <- predict(fit, n.ahead = (length(returns) - (n * length(returns))))$pred
arma.forecast <- forecast(fit, h = 35)
plot(arma.forecast, main = "ARMA forecasts for Google returns")
print("Accuracy - Google")
print(accuracy(arma.preds, returnsTest)[2]) # RMSE values
lines( returnsTest )
par(mfrow=c(1,1))

##Per Comcast
library(tseries)
library(zoo)
index(Comcast.adj.z) <- as.yearmon(index(Comcast.adj.z))
colnames(Comcast.adj.z) <- "Comcast"
##Sennò si ripete ultimo mese
plot( index(Comcast.adj.z), main="Adjusted Closing Prices Comcast", Comcast.adj.z[,1], xlab="Dates", ylab="Adjusted Closing", type="l")
fit <- stl( Comcast.adj.z[,1], s.window="period" )
plot(fit, main="Fit for Comcast")
returns <- diff( log(Comcast.adj.z) )
plot(returns, main="CC Returns for Comcast")
fitRet <- stl( returns[,1], s.window="period" )
plot(fitRet, main="Fit Ret for Comcast")
##Nome delle righeattributes( fit )
##Riassunto ARMA
summary( arma( returns) )
#install.packages( "forecast" )
library( forecast )
returnsTrain <- returns[1:(n * length(returns))]  # Train dataset
returnsTest <- returns[(n * length(returns) + 1):(n * length(returns)+ 1 + m * length(returns))]  # Test dataset
fit <- arima(returnsTrain, order = c(2, 0, 2))
arma.preds <- predict(fit, n.ahead = (length(returns) - (n * length(returns))))$pred
arma.forecast <- forecast(fit, h = 35)
plot(arma.forecast, main = "ARMA forecasts for Comcast returns")
print("Accuracy - Comcast")
print(accuracy(arma.preds, returnsTest)[2]) # RMSE values
lines( returnsTest )
par(mfrow=c(1,1))

##Per Charter
library(tseries)
library(zoo)
index(Charter.adj.z) <- as.yearmon(index(Charter.adj.z))
colnames(Charter.adj.z) <- "Charter"
##Sennò si ripete ultimo mese
plot( index(Charter.adj.z), main="Adjusted Closing Prices Charter", Charter.adj.z[,1], xlab="Dates", ylab="Adjusted Closing", type="l")
fit <- stl( Charter.adj.z[,1], s.window="period" )
plot(fit, main="Fit for Charter")
returns <- diff( log(Charter.adj.z) )
plot(returns, main="CC Returns for Charter")
fitRet <- stl( returns[,1], s.window="period" )
plot(fitRet, main="Fit Ret for Charter")
##Nome delle righeattributes( fit )
##Riassunto ARMA
summary( arma( returns) )
#install.packages( "forecast" )
library( forecast )
returnsTrain <- returns[1:(n * length(returns))]  # Train dataset
returnsTest <- returns[(n * length(returns) + 1):(n * length(returns)+ 1 + m * length(returns))]  # Test dataset
fit <- arima(returnsTrain, order = c(2, 0, 2))
arma.preds <- predict(fit, n.ahead = (length(returns) - (n * length(returns))))$pred
arma.forecast <- forecast(fit, h = 35)
plot(arma.forecast, main = "ARMA forecasts for Charter returns")
print("Accuracy - Charter")
print(accuracy(arma.preds, returnsTest)[2]) # RMSE values
lines( returnsTest )
par(mfrow=c(1,1))
