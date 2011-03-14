geoCode <-
function(x){
	geoTemp <- x
	geoURL <- apply(geoTemp, 1, geoString)
	geoTemp <- cbind(geoTemp, geoURL)
	geoLL <- as.character(apply(geoTemp, 1, urlGoogData))
	geoTemp <- cbind(geoTemp, geoLL)
	long <- apply(geoTemp, 1, splitLong)
	geoTemp <- cbind(geoTemp, long)
	lat <- apply(geoTemp, 1, splitLat)
	geoTemp <- cbind(geoTemp, lat)
	return(geoTemp)}

