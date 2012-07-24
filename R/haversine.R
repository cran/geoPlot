haversine <-
function(xLat,xLon,yLat,yLon){
  earthR <- 6371 #using mean radius
  mLat <- as.double(xLat)
  bLat <- as.double(yLat)
  mLong <- as.double(xLon)
  bLong <- as.double(yLon)
  changeLat <- degrees2radians(mLat - bLat)
  changeLong <- degrees2radians(mLong - mLong)  
  a <- sin(changeLat/2) * sin(changeLat/2) + cos(degrees2radians(mLat)) * cos(degrees2radians(bLat)) * sin(changeLong/2) * sin(changeLong/2)
  c <- 2 * atan2(sqrt(a), sqrt(1-a))
  distKm <- earthR * c
  distMi <- as.double(distKm * 0.621371192)
  output <- c(xLat,xLon,yLat,yLon,distKm,distMi)
  return(output)}
