##Usa Dati da 16- S&P e HP
library("PerformanceAnalytics")
# use mean, var, sd, skewness and kurtosis functions
mean(HPQ.ret.mat)

var(HPQ.ret.mat)

sd(HPQ.ret.mat)

skewness(HPQ.ret.mat) # from library ("PerformanceAnalytics")

kurtosis(HPQ.ret.mat)  #excess kurtosis from library ("PerformanceAnalytics")

summary(HPQ.ret.mat)

#Uso APPLY per matrici con più colonne, dove ogni colonna è il return di una stock
apply(HPQ_SP500.ret.mat, 2, mean)

apply(HPQ_SP500.ret.mat, 2, var)

apply(HPQ_SP500.ret.mat, 2, sd)

apply(HPQ_SP500.ret.mat, 2, skewness)

apply(HPQ_SP500.ret.mat, 2, kurtosis)

apply(HPQ_SP500.ret.mat, 2, summary)


apply(HPQ_SP500.ret.mat, 2, mean) # apply over a matrix column wise function mean()
