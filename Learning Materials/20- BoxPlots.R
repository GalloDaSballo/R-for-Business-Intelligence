##Usa Dati da 16- S&P e HP
#a convenient way of graphically depicting groups of numerical data through their quartiles.
boxplot(HPQ.ret.mat, main="Boxplot of monthly cc returns HPQ",
        ylab="monthly cc return", col="red")
boxplot(gn, HPQ.ret.mat, SP500.ret.mat,names=c("gwn","HPQ","SP500"),col="red",
        main="Comparison of return distributions", ylab="monthly cc return")
