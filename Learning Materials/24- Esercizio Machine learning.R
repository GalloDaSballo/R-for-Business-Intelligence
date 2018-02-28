#Download Data
library(tseries)
library(zoo)
symbols <- c("HPQ", "AAPL", "MSFT", "^GSPC", "^DJI", "^IXIC", "NOK", "E")
for( i in 1:length(symbols) ) {
  data.z <- get.hist.quote( instrument=symbols[i], start="2000-01-01", quote="AdjClose", provider="yahoo", origin="1970-01-01", compression="m", retclass="zoo")
  index( data.z ) <- as.yearmon( index( data.z ) )
  colnames( data.z ) <- symbols[i]
  if( !exists("dataset.z") )
    dataset.z <- data.z
  else
    dataset.z <- merge( dataset.z, data.z )
}
##Covarianza e Correlazione
cat( " * * * Covarianza (totale) * * * ", "\n")
print( var( coredata(dataset.z) ) )

cat( "\n", " * * * Correlazione (totale) * * * ", "\n")
print( cor( coredata(dataset.z) ) )

cat( "\n", " * * * Covarianza (in finestra selezionata) * * *", "\n")
print( var( coredata(dataset.z)[ 102:length(index(dataset.z)), ] ) )

cat( "\n", " * * * Correlazione (in finestra selezionata) * * *", "\n")
print( cor( coredata(dataset.z)[ 102:length(index(dataset.z)), ] ) )

##Pair Scatter Plots
pairs( coredata(dataset.z), col = "blue", cex = 0.5 )

pairs( coredata(dataset.z[102:length(index(dataset.z)),]), col = "blue", cex = 0.5 )

##Plot Symbols Price Trends
par( mfrow=c(2,1) )
plot( dataset.z, plot.type="single", type="l", col=rainbow(dim(coredata(dataset.z))[2]) )
legend( index(dataset.z)[15], max( coredata(dataset.z) ), lty=1, colnames(coredata(dataset.z)), col=rainbow(dim(coredata(dataset.z))[2]), cex=0.6 )
plot( dataset.z[ 102:length(index(dataset.z)),], plot.type="single", type="l", col=rainbow(dim(coredata(dataset.z))[2] ) )
par( mfrow=c(1,1) )



##Distanza Euclidea e normalizzata ???
cat( "\n", " * * * Distanza Euclidea * * *", "\n" )	
N <- dim(coredata(dataset.z))[2]
eucl <- matrix( 0, N, N ) 
rownames( eucl ) <- symbols
colnames( eucl ) <- symbols
for( i in 1:(N-1) )
  for( j in (i+1):N ) {
    eucl[i,j] <- sqrt(sum(coredata(dataset.z)[i,] - coredata(dataset.z)[j,])^2)
    eucl[j,i] <- eucl[i,j]
  }
print( eucl )
cat( "Min Euclidean Distance", min(eucl[eucl>0]), "\n" )

# --- Normalising data ----
originalDataset.z <- dataset.z 
for( i in 1:dim(coredata(dataset.z))[2] ) {
  max_i <- max( (coredata(dataset.z))[,i] )
  min_i <- min( (coredata(dataset.z))[,i] )
  coredata(dataset.z)[,i] <- (coredata(dataset.z)[,i]-min_i)/(max_i-min_i) 		
}
cat( "\n", " * * * Distanza Euclidea Normalizzata * * *", "\n" )	
N <- dim(coredata(dataset.z))[2]
euclNorm <- matrix( 0, N, N ) 
rownames( euclNorm ) <- symbols
colnames( euclNorm ) <- symbols
for( i in 1:(N-1) )
  for( j in (i+1):N ) {
    euclNorm[i,j] <- sqrt(sum(coredata(dataset.z)[i,] - coredata(dataset.z)[j,])^2)
    euclNorm[j,i] <- euclNorm[i,j]
  }
print( euclNorm )
cat( "Min Normalised Euclidean Distance", min(euclNorm[euclNorm>0]), "\n" )

##Plotting Trends
# --- Plotting original data -------------------------------
par( mfrow=c(2,1) )
plot( originalDataset.z, plot.type="single", type="l", col=rainbow(dim(coredata(originalDataset.z))[2]) )
legend( index(originalDataset.z)[15], max( coredata(originalDataset.z) ), lty=1, colnames(coredata(originalDataset.z)), col=rainbow(dim(coredata(originalDataset.z))[2]), cex=0.6 )
plot( originalDataset.z[ 102:length(index(dataset.z)),], plot.type="single", type="l", col=rainbow(dim(coredata(originalDataset.z))[2] ) )
par( mfrow=c(1,1) )

# --- Plotting normalized data -------------------------------
par( mfrow=c(2,1) )
plot( dataset.z, plot.type="single", type="l", col=rainbow(dim(coredata(dataset.z))[2]) )
legend( index(dataset.z)[15], max( coredata(dataset.z) ), lty=1, colnames(coredata(dataset.z)), col=rainbow(dim(coredata(dataset.z))[2]), cex=0.6 )
plot( dataset.z[ 102:length(index(dataset.z)),], plot.type="single", type="l", col=rainbow(dim(coredata(dataset.z))[2] ) )
par( mfrow=c(1,1) )



