library(xts) 
#10 valori di normale, con data
x <- xts(rnorm(10), Sys.Date()+1:10) 
x

last(x,'3 days')
print(first(x, '1 day'))