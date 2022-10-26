CARData= read.csv(file.choose())
CARData


MinYear= min(CARData$Year)
MinYear

PriceSD=sd(CARData$Price,na.rm=TRUE)
PriceSD

CARData[,(2)]
