#Più Veloce
library(tseries)
SBUX.z = get.hist.quote(instrument="sbux", start="2014-03-01",end="2015-03-01", quote="AdjClose",provider="yahoo", origin="1970-01-01", compression="d", retclass="zoo")
