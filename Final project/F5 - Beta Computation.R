##Richiede F1, F2 e GetData.r
##Tutte le stock appartengono all'S&P500 quindi userò questo come paragone
##@Attribution: http://danialk.github.io/images/code_bg.png?1515390733
SP500.adj.z <- get("^GSPC")
SP500.adj.ret = diff(SP500.adj.z)/lag(SP500.adj.z, k=-1)

SP500.coda = coredata(tail(SP500.adj.ret, minimo))
##Amazon
Amazon.fit <- lm(Amazon.coda ~ SP500.coda)
Amazon.result <- summary(Amazon.fit)
Amazon.beta <- Amazon.result$coefficients[2,1]
print(Amazon.beta) ##1.447283

##Walmart
Walmart.fit <- lm(Walmart.coda ~ SP500.coda)
Walmart.result <- summary(Walmart.fit)
Walmart.beta <- Walmart.result$coefficients[2,1]
print(Walmart.beta) ##0.3011598

##Facebook
Facebook.fit <- lm(Facebook.coda ~ SP500.coda)
Facebook.result <- summary(Facebook.fit)
Facebook.beta <- Facebook.result$coefficients[2,1]
print(Facebook.beta) ##0.5864851

##Google
Google.fit <- lm(Google.coda ~ SP500.coda)
Google.result <- summary(Google.fit)
Google.beta <- Google.result$coefficients[2,1]
print(Google.beta) ##0.9406731

##Comcast
Comcast.fit <- lm(Comcast.coda ~ SP500.coda)
Comcast.result <- summary(Comcast.fit)
Comcast.beta <- Comcast.result$coefficients[2,1]
print(Comcast.beta) ##1.041464

##Charter
Comcast.fit <- lm(Charter.coda ~ SP500.coda)
Comcast.result <- summary(Comcast.fit)
Comcast.beta <- Comcast.result$coefficients[2,1]
print(Comcast.beta) ##1.084275


##Interpretare
##Beta = 1 volatile come il mercato
##Beta < 1 meno volatile del 1-x%
##Beta > 1 più volatile del x-1%

###Compute the Beta measure of the volatility in comparison to the market (usually also available on Yahoo Finance) for each one of the assets you have chosen

##Provide considerations about the variations of Beta over time, focusing on the periods with high volatility

#Use the value of Beta to calculate the expected return of your portfolio and compare it with the effective return obtained


##Fatto con performance analytics
CAPM.beta(Amazon.adj.ret, SP500.adj.ret, Rf = 0)
CAPM.beta(Walmart.adj.ret, SP500.adj.ret, Rf = 0)
CAPM.beta(Facebook.adj.ret, SP500.adj.ret, Rf = 0)
CAPM.beta(Google.adj.ret, SP500.adj.ret, Rf = 0)
CAPM.beta(Comcast.adj.ret, SP500.adj.ret, Rf = 0)
CAPM.beta(Charter.adj.ret, SP500.adj.ret, Rf = 0)

