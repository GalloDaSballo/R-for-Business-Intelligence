library(fPortfolio)
library(lpSolve)
library(timeSeries)
##Deve essere timerSeries
Amazon.timeS = as.timeSeries(Amazon.adj.ret)
colnames(Amazon.timeS) <- "Amazon.Adj"
Walmart.timeS = as.timeSeries(Walmart.adj.ret)
colnames(Walmart.timeS) <- "Walmart.Adj"
Facebook.timeS = as.timeSeries(Facebook.adj.ret)
colnames(Facebook.timeS) <- "Facebook.Adj"
Google.timeS = as.timeSeries(Google.adj.ret)
colnames(Google.timeS) <- "Google.Adj"
Comcast.timeS = as.timeSeries(Comcast.adj.ret)
colnames(Comcast.timeS) <- "Comcast.Adj"
Charter.timeS = as.timeSeries(Charter.adj.ret)
colnames(Charter.timeS) <- "Charter.Adj"

##Siccome Alcune stock hanno meno di 10 anni, devo prendere il minimo comune 
Data = cbind(tail(Amazon.timeS,minimo), 
             tail(Walmart.timeS, minimo),
             tail(Facebook.timeS, minimo),
             tail(Google.timeS, minimo),
             tail(Comcast.timeS, minimo),
            tail(Charter.timeS, minimo))
covData <- covEstimator(Data, spec="")

##Calcolo frontiera efficace
pf <- portfolioFrontier(Data)
plot(pf)
##Ho scelto un portfolio moderato
#Amazon.Adj Walmart.Adj Facebook.Adj Google.Adj Comcast.Adj Charter.Adj
#0.0216      0.3316       0.1184     0.2423      0.0617      0.2245

budget <- 1000
## suppose to have a budget of $V at the begin of the l months (with the same value of l previously defined in the forecasting) and decide how to invest your budget to create your portoflio.
peso_amazon <- 0.0216
peso_walmart <- 0.3316
peso_facebook <- 0.1184
peso_google <- 0.2423
peso_comcast <- 0.0617
peso_charter <- 0.2245

transaction_cost <- 15 #1.5% transaction cost
transazioni <- 6 #Compro le stock una volta
## compute your return (you must consider transaction costs) at the end of the period according to your investment decisions
ritorni_netti <- sum((sum(tail(Amazon.adj.ret, minimo * l)) * peso_amazon * budget),
                     (sum(tail(Walmart.adj.ret, minimo * l)) * peso_walmart * budget),
                     (sum(tail(Facebook.adj.ret, minimo * l)) * peso_facebook * budget),
                     (sum(tail(Google.adj.ret, minimo * l)) * peso_google * budget),
                     (sum(tail(Comcast.adj.ret, minimo * l)) * peso_comcast * budget),
                     (sum(tail(Charter.adj.ret, minimo * l)) * peso_charter * budget),
                     -transaction_cost * transazioni)
##> ritorni_netti
##[1] 35.27504 = 3.527504%                  

