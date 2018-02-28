##Richiede I precedenti F2, F1 e GetData

##Covariance Matrix
#Siccome alcune stock hanno dati storici più brevi, ci serve il minimo
minimo <- min(nrow(Amazon.ret.mat), 
    nrow(Walmart.ret.mat), 
    nrow(Facebook.ret.mat), 
    nrow(Google.ret.mat),
    nrow(Comcast.ret.mat),
    nrow(Charter.ret.mat)
    )
Amazon.coda = coredata(tail(Amazon.ret.mat, minimo))
Walmart.coda = tail(Walmart.ret.mat, minimo)
Facebook.coda = tail(Facebook.ret.mat, minimo)
Google.coda = tail(Google.ret.mat, minimo)
Comcast.coda = tail(Comcast.ret.mat, minimo)
Charter.coda = tail(Charter.ret.mat, minimo)

##Rename
colnames(Amazon.coda) <- "AmazonRetCC"
colnames(Walmart.coda) <- "WalmartRetCC"
colnames(Facebook.coda) <- "FacebookRetCC"
colnames(Google.coda) <- "GoogleRetCC"
colnames(Comcast.coda) <- "ComcastRetCC"
colnames(Charter.coda) <- "CharterRetCC"

##Covariance Matrix
var(cbind(Amazon.coda,
          Walmart.coda,
          Facebook.coda,
          Google.coda,
          Comcast.coda,
          Charter.coda))


##Correlation Matrix
cor(cbind(Amazon.coda,
          Walmart.coda,
          Facebook.coda,
          Google.coda,
          Comcast.coda,
          Charter.coda))



#PAIRWISE SCATTERPLOT
pairs(cbind(Amazon.coda,
             Walmart.coda,
             Facebook.coda,
             Google.coda,
             Comcast.coda,
             Charter.coda), col="blue", pch=18, cex=1.5, cex.axis=1.5)