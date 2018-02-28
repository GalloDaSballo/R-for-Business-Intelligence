require(quantmod)
Times <-  NULL
Prices <- NULL
while(1) {
  tryCatch({
    #Carica la quota corrente
    Year <- 1970
    currentYear <- as.numeric(format(Sys.time(),'%Y'))
    while (Year != currentYear) { 
      currentQuote <- getQuote('FTSEMIB.MI')
      Year <- as.numeric(format(currentQuote['Trade Time'],'%Y'))
    }
    
    #Aggiunge la quotazione al dataset
    if (is.null(Times)) {
      Times <- Sys.time()-15*60 #perchè le quote sono in ritardo di 15 min
      Prices <- currentQuote['Last']
    } else {
      Times <- c(Times,Sys.time())
      Prices <- rbind(Prices,currentQuote['Last'])
    } 
    
    
    #Convert to 1-minute 
    Data <- xts(Prices,order.by=Times)
    Data <- na.omit(to.minutes(Data,indexAt='endof'))
    
    #Plot when we have enough data
    if (nrow(Data)>5) { 
      chartSeries(Data,theme='white',TA='addRSI(n=5);addBBands(n=5)')
    }
    
    #Wait 1 second to avoid overwhelming the server
    Sys.sleep(1)
    
    #On errors, sleep 10 seconds 
  },error=function(e) {print(e);Sys.sleep(10)}) 
}
