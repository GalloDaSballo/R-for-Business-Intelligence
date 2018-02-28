library(tseries)

con <- url("http://quote.yahoo.com") 
if(!inherits(try(open(con), silent = TRUE), "try-error")) {
  close(con)
  x <- get.hist.quote(instrument = "^gspc", start = "2008-01-01", quote = "Close")
  
  plot(x) 	
  
  x <- get.hist.quote(instrument = "ibm", quote = c("Cl", "Vol"))
  
  plot(x, main = "International Business Machines Corp")
  spc <- get.hist.quote(instrument = "^gspc", start = "2008-01-01", quote = "Close")
  ibm <- get.hist.quote(instrument = "ibm", start = "2008-01-01", quote = "AdjClose") 
  
  require("zoo") 
  
  # For merge() method.	
  x <- merge(spc, ibm)
  plot(x, main = "IBM vs S&P 500")
}
