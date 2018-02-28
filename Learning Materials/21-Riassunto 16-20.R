#Riassume da 16 a 20
##Usa Dati da 16- S&P e HP
par(mfrow=c(2,2))
##Histogramma dei ritorni composti
hist(HPQ.ret.mat, main="HPQ monthly cc returns", probability=T, ylab="cc return", col="red")
##Boxplot dei ritorni composti -> Mostra outliers
boxplot(HPQ.ret.mat, ylab="cc return", col="red")
##Mostra Densità dei ritorni composti -> Mostra outliers
plot(HPQ.density,type="l",xlab="cc return", col="red", lwd=2, ylab="density estimate", main="Smoothed density")
##QQ Plot teorico vs reale
qqnorm(HPQ.ret.mat, col="blue")
qqline(HPQ.ret.mat)
par(mfrow=c(1,1))