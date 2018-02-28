install.packages( "forecast" )
library( forecast )

returnsTrain <- returns[1:(0.9 * length(returns))]  # Train dataset
returnsTest <- returns[(0.9 * length(returns) + 1):length(returns)]  # Test dataset
fit <- arima(returnsTrain, order = c(2, 0, 2))

arma.preds <- predict(fit, n.ahead = (length(returns) - (0.9 * length(returns))))$pred
arma.forecast <- forecast(fit, h = 25)
plot(arma.forecast, main = "ARMA forecasts for HPQ returns")

accuracy(arma.preds, returnsTest)[2] # RMSE values

lines( returnsTest )


