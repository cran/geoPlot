haversine <-
function(x){
	earthR <- 6371
	mLat <- as.double(x[10])
	bLat <- as.double(x[19])
	mLong <- as.double(x[9])
	bLong <- as.double(x[18])
	changeLat <- degrees2radians(mLat - bLat)
	changeLong <- degrees2radians(mLong - mLong)
	a <- sin(changeLat/2) * sin(changeLat/2) + cos(degrees2radians(mLat)) * cos(degrees2radians(bLat)) * sin(changeLong/2) * sin(changeLong/2)
	c <- 2 * asin(sqrt(a))
	distKm <- earthR * c
	return(distKm)}

