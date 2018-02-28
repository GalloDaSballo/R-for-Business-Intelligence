##DATA SUMMARY
#Si connette a yahoo, e restituisce il valore della stock (passato tramite name)
library(tseries)
get <- function(name){
        x <- get.hist.quote(instrument = name, start = "2008-01-01", end="2017-10-01",
                            quote = c("Adjusted"), compression="m")
		}
##c("Open", "High", "Low", "Close", "Adjusted", "Volume")
#get.his.quote returns a zoo
Amazon.adj.z <- get("AMZN") #amazon
Walmart.adj.z <- get("WMT") #walmart
Facebook.adj.z <- get("FB") #facebook 
Google.adj.z <- get("GOOGL") #Alphabet inc, owner of Google 
Comcast.adj.z <- get("CMCSA") #Comcast
Charter.adj.z <- get("CHTR") #Charter


tutti <- cbind(Amazon.adj.z, 
               Walmart.adj.z, 
               Facebook.adj.z, 
               Google.adj.z, 
               Comcast.adj.z, 
               Charter.adj.z)

##Visualizza i prezzi adjusted
library(dygraphs)
##Mostra con dygraph, cambia data, width 100% per lables, selettore in basso
dygraph(tutti, main="Adjusted Monthly Prices of chosen Stock") %>%
  dySeries(name="Adjusted.Amazon.adj.z", label = "\nAmazon Adj") %>%
  dySeries(name="Adjusted.Walmart.adj.z", label = "Walmart Adj") %>%
  dySeries(name="Adjusted.Facebook.adj.z", label = "Facebook Adj") %>%
  dySeries(name="Adjusted.Google.adj.z", label = "Google Adj") %>%
  dySeries(name="Adjusted.Comcast.adj.z", label = "Comcast Adj") %>%
  dySeries(name="Adjusted.Charter.adj.z", label = "Charter Adj") %>%
  dyRangeSelector(height = 20) %>% 
  dyOptions(stackedGraph = TRUE) %>%
  dyLegend(width = "100%")