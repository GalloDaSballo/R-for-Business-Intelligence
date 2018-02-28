##Richiede 24
##A comprehensive implementation of Dynamic Time Warping (DTW) algorithms in R.
##DTW computes the optimal (least cumulative distance) alignment between points of two time series.
##Common DTW variants covered include local (slope) and global (window) constraints, subsequence matches, arbitrary distance definitions, normalizations, minimum variance matching, and so on.
##Provides cumulative distances, alignments, specialized plot styles, etc. 
install.packages("dtwclust")
library(dtwclust)

# time-series clustering
#  - partitioning with Euclidean distance ("L2")
#  - centroids: medoids ("pam")  / centroids ("mean")
dtwFit <- dtwclust( t(coredata(dataset.z)), k = 4, type= "partitional", distance = "L2", centroid = "pam" )  


# time-series clustering
#  - agglomerative with Euclidean distance ("L2")
#  - prototypes: centroids ("means") 
dtwFit <- dtwclust( t(coredata(dataset.z)), k = 4, type= "hierarchical", distance = "L2", prototypes = "mean" )

