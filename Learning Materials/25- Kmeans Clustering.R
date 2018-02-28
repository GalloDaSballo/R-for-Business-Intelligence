##Richiede Dati 24
##Dopo aver normalizzato andiamo di Clustering con K-means
# Determine number of clusters
for( i in 2:7 )
  wss[i-1] <- sum( kmeans( t(coredata( dataset.z )), centers=i )$withinss )
plot( 2:7, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares" )

# K-Means Cluster Analysis
fit <- kmeans( t(coredata( dataset.z )), 5 ) # 5 cluster solution
# get cluster means 
aggregate( t(coredata( dataset.z )), by=list( fit$cluster ), FUN=mean )
# append cluster assignment
clusteredData <- data.frame( t(coredata( dataset.z )), fit$cluster )
