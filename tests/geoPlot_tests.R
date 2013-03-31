# geoPlot Test Script
# dev by Randall Shane, PhD
# rshane@basexvi.com
# 31 March 2013

rm(list= ls(all=TRUE))
#install.packages("geoPlot",dependencies=TRUE)
#library(geoPlot)

#Functions:
addrListLookup <-
  function(x){
    y <- data.frame(t(rep(NA,4)))
    colnames(y) <- c("id","address","latitude","longitude")
    y <- y[-1,]
    for (i in 1:nrow(x)) {
      input <- x[i,]
      x[1,]#
      geoAddress(x[1,])#
      y <- rbind(y,geoAddress(input))}
    return(y)}


degrees2radians <-
  function(x){
    radians <- (x * 0.0174532925)
    return( radians)}


geoAddress <-
  function(x) {
    y <- data.frame(t(rep(NA,4)))
    y <- y[-1,]
    colnames(y) <- c("id","address","latitude","longitude")
    temp00 <- data.frame(lapply(x[2:6],as.character), stringsAsFactors=FALSE)
    y[1,1] <- x[1]
    temp01 <- paste("http://maps.googleapis.com/maps/api/geocode/xml?address=",
                    paste(gsub(" ","+",temp00),collapse="+"),
                    "&sensor=false", sep="", collapse=NULL)
    y[1,2] <- paste(temp00,collapse=" ")
    library(XML)
    options(warn = (-1))
    temp02 <- xmlTreeParse(readLines(temp01), getDTD = FALSE)
    temp03 <- xmlRoot(temp02)
    temp04 <- temp03[[2]][["geometry"]][["location"]]
    resp <- xmlSApply(temp03[1][["status"]], xmlValue)
    if (resp=='OK'){
      tmplat <- xmlSApply(temp04, xmlValue)[1] # latitude
      tmplong <- xmlSApply(temp04, xmlValue)[2]  # longitude
    } else { 
      tmplat <- 0 
      tmplong <- 0}
    if(!is.na(unlist( tmplat))){
      y[1,3] <- as.double(unlist( tmplat))
    } else { lat <- 0 }
    if(!is.na(unlist( tmplong))){
      y[1,4] <- as.double(unlist( tmplong))
    } else { long <- 0 }
    return(y)}


geoIP <-
  function(x){
    options(warn=-1)
    y <- data.frame(t(rep(NA,11)))
    y <- y[-1,]
    colnames(y) <- c("ipAddress","statusCode","latitude","longitude",
                     "statusMessage","countryCode","countryName","regionName",
                     "cityName","zipCode","timeZone")
    library(rjson)
    temp01 <- paste("http://api.ipinfodb.com/v3/ip-city/",
                    "?key=6c8674baa7ea5e3be60472a0cecc7e874fe7be450e83a265c9be67ce8a847e71&ip=",
                    x,"&format=json",sep="",collapse=NULL)
    temp02 <- fromJSON(paste(readLines(temp01), collapse=""))
    y[1,1] <- temp02[3]
    y[1,2] <- temp02[1]
    if(!is.na(as.double(temp02[9]))){
      y[1,3] <- as.double(unlist( temp02[9]))
    } else {  y[1,3] <- 0 }
    if(!is.na(as.double(temp02[10]))){
      y[1,4] <- as.double(unlist( temp02[10]))
    } else {  y[1,4] <- 0 }
    y[1,5] <- temp02[2]
    y[1,6] <- temp02[4]
    y[1,7] <- temp02[5]
    y[1,8] <- temp02[6]
    y[1,9] <- temp02[7]
    y[1,10] <- temp02[8]
    y[1,11] <- temp02[11]
    return(y)}


geoPlot <-
  function(x, zoom=6, maptype="mobile", color="red"){
    temp01 <- x[abs(x[3]) > 0,]
    center <- c(sapply(temp01[3],mean), sapply(temp01[4],mean))
    library(RgoogleMaps)
    mapTemp <- GetMap.bbox(latR=center[1], lonR=center[2], zoom=zoom, destfile="MapTemp.png", maptype=maptype)
    PlotOnStaticMap( mapTemp, lat=temp01[,3], lon=temp01[,4], destfile="GeoPlot.png", 
                     zoom=NULL, size=c(640,640), add=FALSE, GRAYSCALE=FALSE, 
                     pch=16, col=color)}


haversine <-
  function(xLat,xLon,yLat,yLon){
    earthR <- 6371 #using mean radius
    mLat <- as.double(xLat)
    bLat <- as.double(yLat)
    mLong <- as.double(xLon)
    bLong <- as.double(yLon)
    changeLat <- degrees2radians(mLat - bLat)
    changeLong <- degrees2radians(mLong - bLong)  
    a <- sin(changeLat/2) * sin(changeLat/2) + cos(degrees2radians(mLat)) * 
      cos(degrees2radians(bLat)) * sin(changeLong/2) * sin(changeLong/2)
    c <- 2 * atan2(sqrt(a), sqrt(1-a))
    distKm <- earthR * c
    distMi <- as.double(distKm * 0.621371192)
    output <- c(xLat,xLon,yLat,yLon,distKm,distMi)
    return(output)}


ipListLookup <-
  function(x){
    y <- data.frame(t(rep(NA,11)))
    y <- y[-1,]
    colnames(y) <- c("ipAddress","statusCode","latitude","longitude",
                     "statusMessage","countryCode","countryName","regionName",
                     "cityName","zipCode","timeZone")
    for (i in 1:nrow(x)) {
      input <- x[i,]
      y <- rbind(y,geoIP(input))}
    return(y)}




#To geocode and plot a single address:
x <- geoAddress(c("001","202 South Central Avenue","Flagler Beach","FL","32136","US"))
geoPlot(x)

#To geocode and plot a list of addresses:
id <- c('96600016','96600021','96600022','96600025','96600026')
address <- c('537 LINDEN AVENUE','4163 KENWOOD PLACE','4670 POINTE LANE','4077 MARIGOLD LANE','193 MULBERRY LANE')
city <- c('ORLANDO','JUPITER','POMPANO BEACH','MIAMI','JUPITER')
stateprov <- c('FL','FL','FL','FL','FL')
postal <- c('32805','33478','33060','33179','33458')
country <- c('US','US','US','US','US')
addresses <- data.frame(id,address,city,stateprov,postal,country)

geoAddresses <- addrListLookup(addresses)
geoPlot(geoAddresses,zoom=6,maptype="hybrid",color="red")

#To geocode and plot a single ip address:
y <- geoIP("38.122.8.198")
geoPlot(y)

#To geocode and plot a list of ip addresses:
x <- c('108.128.64.50','108.223.56.106','108.230.22.18','108.231.204.187','108.66.55.227')
ips <- data.frame(x)
geoIPs <- ipListLookup(ips)
geoPlot(geoIPs,zoom=3,maptype="roadmap",color="blue")


#To determine the distance between 2 points:
haversine("28.54703","-81.30292","26.93422","-80.09421")

#To determine the distance between 2 points resolved above:
haversine(geoAddresses[1,3],geoAddresses[1,4],geoAddresses[2,3],geoAddresses[2,4])
haversine(geoIPs[1,3],geoIPs[1,4],geoIPs[2,3],geoIPs[2,4])
