##Usa Dati da 16- S&P e HP
#QUANTILI EMPICI

quantile(HPQ.ret.mat)

quantile(HPQ.ret.mat, probs=c(0.01,0.05))

# normal quantiles
qnorm(p=c(0.01,0.05), mean=mean(HPQ.ret.mat), sd=sd(HPQ.ret.mat))

# empirical and normal quantiles for SP500
quantile(SP500.ret.mat)

quantile(SP500.ret.mat,probs=c(0.01,0.05))

qnorm(p=c(0.01,0.05), mean=mean(SP500.ret.mat), sd=sd(SP500.ret.mat))

#QQ plots compare empirical quantiles to those from normal distribution
#QQ plot compares a sample of data on the vertical axis to a statistical population on the horizontal axis
#gn = white noise
par(mfrow=c(2,2)) 
qqnorm(gn, main="GWN", col="blue")
       qqline(gn)
       qqnorm(HPQ.ret.mat, main="HPQ Returns", col="blue")
qqline(HPQ.ret.mat)
qqnorm(SP500.ret.mat, main="SP500 Returns", col="blue")
       qqline(SP500.ret.mat)
       par(mfrow=c(1,1))
       