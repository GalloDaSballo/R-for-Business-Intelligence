##Usa Dati da 16- S&P e HP
#var() #variance
#cov() #covariance
#cor() #Correlation
#plot() #scatter plot
#pairs() #Pairwise scatter

cov(SP500.ret.mat, HPQ.ret.mat)

cor(SP500.ret.mat, HPQ.ret.mat)

# compute covariance and correlation matrix
var(cbind(gn, HPQ.ret.mat, SP500.ret.mat))
cor(cbind(gn, HPQ.ret.mat, SP500.ret.mat))

#SCATTERPLOT
plot(SP500.ret.mat,HPQ.ret.mat,main="Monthly cc returns on HPQ and SP500",  pch=18,  col="blue")
#PAIRWISE SCATTERPLOT
pairs(cbind(gn,HPQ.ret.mat,SP500.ret.mat), col="blue", pch=18, cex=1.5, cex.axis=1.5)