##Richiede Dati da 24
# hard partitioning
library(skmeans)
hardFit <- skmeans( t(coredata( dataset.z )), 5, control = list(verbose = TRUE) )

# soft partitioning
softFit <- skmeans( t(coredata( dataset.z )), 5, m = 1.1, control = list(nruns = 5, verbose = TRUE))
