geoIP <-
function(x){
  options(warn=-1)
  y <- data.frame(t(rep(NA,11)))
  y <- y[-1,]
  colnames(y) <- c("ipAddress","statusCode","latitude","longitude","statusMessage","countryCode","countryName","regionName","cityName","zipCode","timeZone")
  library(rjson)
  temp01 <- paste("http://api.ipinfodb.com/v3/ip-city/?key=6c8674baa7ea5e3be60472a0cecc7e874fe7be450e83a265c9be67ce8a847e71&ip=",x,"&format=json",sep="",collapse=NULL)
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
