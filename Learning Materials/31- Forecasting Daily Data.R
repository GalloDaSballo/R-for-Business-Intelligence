library(quantmod)
getSymbols("HPQ", src="yahoo", from="2018-1-1")
input <- merge(lag(HPQ$HPQ.Close,1), lag(HPQ$HPQ.Close,2), lag(HPQ$HPQ.Close,3), lag(HPQ$HPQ.Close,4), lag(HPQ$HPQ.Close,5), lag(HPQ$HPQ.Close,6), lag(HPQ$HPQ.Close,7), lag(HPQ$HPQ.Close,8), lag(HPQ$HPQ.Close,9), lag(HPQ$HPQ.Close,10), all=FALSE )

data <- merge( input, HPQ$HPQ.Close, all=FALSE )
data <- na.omit( data )
colnames( data ) <- c("lag1", "lag2", "lag3", "lag4", "lag5", "lag6", "lag7", "lag8", "lag9", "lag10",  "TARGET" )

trainIndex <- 1:(nrow(data)*0.75)
training <- as.data.frame( data[trainIndex] )
rownames(training) <- NULL
test <- as.data.frame( data[-trainIndex] )
rownames(test) <- NULL


##Pagina 2
library(caret)
bootControl <- trainControl(number=100)
preProc <- c("center", "scale")
set.seed(2)
indexTrn = ncol(training)


##Pagina 3
library(kernlab)
svmFit <- train( training[,-indexTrn], training[,indexTrn], method="svmRadial", tuneLength=5, trControl=bootControl, preProc=preProc )

svmFit
svmBest <- svmFit$finalModel
svmBest


library(nnet)

nnetFit <- train( training[,-indexTrn], training[,indexTrn], method="nnet", tuneLength=5, trace=FALSE, trControl=bootControl, preProc=preProc )
nnetFit
nnetBest <- nnetFit$finalModel
summary( nnetBest )

##Pagina 4
predsvm <- predict( svmBest, test[ ,-ncol(test) ] )
prednet <- predict( nnetBest, test[ ,-ncol(test) ], type="raw" )


library(Metrics)

actualTS <- test[ , ncol(test) ]
predictedTS <- predsvm

library(ModelMetrics)
#Mean Square Error
mse( actual=actualTS, predicted=predictedTS )
#Mean Absolute Error
mae(actual=actualTS, predicted=predictedTS )

predictedTS <- prednet
mse( actual=actualTS, predicted=predictedTS )
mae(actual=actualTS, predicted=predictedTS )


##Pagina 5

library(xts)
predictedTS <- xts( predictedTS, order.by=index(data[-trainIndex]))
actualTS <- xts( actualTS, order.by=index(data[-trainIndex]))
plot(actualTS)
lines(predictedTS, col="blue")
plot(data)
lines(predictedTS, col="blue")


##Pagina 6
actualRets <- diff( log(actualTS) )
predictedRets <- diff( log(predictedTS) )
plot( actualRets )
lines( predictedRets, col="blue" )