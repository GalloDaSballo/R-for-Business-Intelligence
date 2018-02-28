##Richiede F0 per i dati
####DA FARE -> MONTHLY NON GIORNALIERI
library(zoo)
##Amazon
#Simple Returns
Amazon.adj.ret = diff(Amazon.adj.z)/lag(Amazon.adj.z, k=-1)
#CC Returns
Amazon.adj.retCC = diff(log(Amazon.adj.z))

##Walmart
#Simple Returns
Walmart.adj.ret = diff(Walmart.adj.z)/lag(Walmart.adj.z, k=-1)
#CC Returns
Walmart.adj.retCC = diff(log(Walmart.adj.z))

##Facebook
#Simple Returns
Facebook.adj.ret = diff(Facebook.adj.z)/lag(Facebook.adj.z, k=-1)
#CC Returns
Facebook.adj.retCC = diff(log(Facebook.adj.z))

##Google
#Simple Returns
Google.adj.ret = diff(Google.adj.z)/lag(Google.adj.z, k=-1)
#CC Returns
Google.adj.retCC = diff(log(Google.adj.z))

##Comcast
#Simple Returns
Comcast.adj.ret = diff(Comcast.adj.z)/lag(Comcast.adj.z, k=-1)
#CC Returns
Comcast.adj.retCC = diff(log(Comcast.adj.z))

##Charter
#Simple Returns
Charter.adj.ret = diff(Charter.adj.z)/lag(Charter.adj.z, k=-1)
#CC Returns
Charter.adj.retCC = diff(log(Charter.adj.z))


##Mostra Simple Returns su un grafico
Returns = cbind(Amazon.adj.ret,
                Walmart.adj.ret,
                Facebook.adj.ret,
                Google.adj.ret,
                Comcast.adj.ret,
                Charter.adj.ret)


library(dygraphs)
dygraph(Returns, main="Adjusted Simple Returns for chosen stocks") %>%
  dySeries(name="Adjusted.Amazon.adj.ret", label = "\nAmazon Simple Returns") %>%
  dySeries(name="Adjusted.Walmart.adj.ret", label = "Walmart Simple Returns") %>%
  dySeries(name="Adjusted.Facebook.adj.ret", label = "Facebook Simple Returns") %>%
  dySeries(name="Adjusted.Google.adj.ret", label = "Google Simple Returns") %>%
  dySeries(name="Adjusted.Comcast.adj.ret", label = "Comcast Simple Returns") %>%
  dySeries(name="Adjusted.Charter.adj.ret", label = "Charter Simple Returns") %>%
  dyRangeSelector(height = 20) %>% 
  dyLegend(width = "100%")

##Mostra CC Returns su un grafico
CCReturns = cbind(Amazon.adj.retCC,
                Walmart.adj.retCC,
                Facebook.adj.retCC,
                Google.adj.retCC,
                Comcast.adj.retCC,
                Charter.adj.retCC)

dygraph(CCReturns, main="CC Returns for chosen stocks") %>%
  dySeries(name="Adjusted.Amazon.adj.retCC", label = "\nAmazon CC Returns") %>%
  dySeries(name="Adjusted.Walmart.adj.retCC", label = "Walmart CC Returns") %>%
  dySeries(name="Adjusted.Facebook.adj.retCC", label = "Facebook CC Returns") %>%
  dySeries(name="Adjusted.Google.adj.retCC", label = "Google CC Returns") %>%
  dySeries(name="Adjusted.Comcast.adj.retCC", label = "Comcast CC Returns") %>%
  dySeries(name="Adjusted.Charter.adj.retCC", label = "Charter CC Returns") %>%
  dyRangeSelector(height = 20) %>% 
  dyLegend(width = "100%")

##Istogrammi per ciascun CC RET
boxplot(coredata(Amazon.adj.retCC), main="Amazon Boxplot CC Returns")
boxplot(coredata(Walmart.adj.retCC), main="Walmart Boxplot CC Returns")
boxplot(coredata(Facebook.adj.retCC), main="Facebook Boxplot CC Returns")
boxplot(coredata(Google.adj.retCC), main="Google Boxplot CC Returns")
boxplot(coredata(Comcast.adj.retCC), main="Comcast Boxplot CC Returns")
boxplot(coredata(Charter.adj.retCC), main="Charter Boxplot CC Returns")

