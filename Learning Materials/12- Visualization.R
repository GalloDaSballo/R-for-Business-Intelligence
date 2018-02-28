#Visualization with QuantMod
library(quantmod)
getSymbols("IBM")
chartSeries(IBM); addBBands()

#Bollinger bands
addBBands()

#Moving Average Convergence Divergence
addMACD(32,50,12)
#Redisegna con sottoinsieme
reChart(subset= "2009",theme= "white", type= "candles")

"Un indicatore tecnico sviluppato da Gerald Appel che è calcolato sottraendo la media mobile esponenziale a 26 periodi di un determinato strumento dalla sua media mobile esponenziale a 12 periodi. Comparando le medie mobili, il MACD mostra caratteristiche di trend follower, e disegnando la differenza delle medie mobili su di un oscillatore, MACD mostra caratteristiche di indicatore di momentum.
"