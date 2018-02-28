library(tseries)
library(zoo)
dataset.z <- get.hist.quote( instrument="HPQ", start="2000-01-01", quote="AdjClose", provider="yahoo", origin="1970-01-01", compression="m", retclass="zoo")
index(dataset.z) <- as.yearmon(index(dataset.z))
colnames(dataset.z) <- "HPQ"
plot( index(dataset.z), dataset.z$HPQ, xlab="Dates", ylab="Adjusted Closing", type="l")
returns <- diff( log(dataset.z$HPQ )  )
plot( returns )

input <- merge( lag(returns,1), lag(returns,2), lag(returns,3), dataset.z$HPQ, lag(dataset.z$HPQ,1), lag(dataset.z$HPQ,2), all=FALSE )
data <- merge( input, returns, all=FALSE )
colnames( data ) <- c("lag.1", "lag.2", "lag.3", "HPQ", "HPQ.1", "HPQ.2", "TARGET")

##Pagina 2
library(caret)
index <- 1:nrow(data)
trainIndex <- createDataPartition(index, p=0.75, list=FALSE)
training <- as.data.frame( data[trainIndex] )
rownames(training) <- NULL
test <- as.data.frame( data[-trainIndex] )
rownames(test) <- NULL

bootControl <- trainControl(number=200)
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
mse( actual=actualTS, predicted=predictedTS )
mae(actual=actualTS, predicted=predictedTS )
predictedTS <- prednet
mse( actual=actualTS, predicted=predictedTS )
mae(actual=actualTS, predicted=predictedTS )



