geoCompare <-
function(x,y){
	matchCompare <- prepMatch(x)
	baseCompare <- prepBase(y)
	geoOutput <- merge(matchCompare, baseCompare, by.matchCompare="shortKey", by.baseCompare="shortKey")
	geoValid <- apply(geoOutput, 1, geoValidate)
	geoOutput <- cbind(geoOutput, geoValid)
	distanceKm <- apply(geoOutput, 1, haversine)
	geoOutput <- cbind(geoOutput, distanceKm)
	distanceMi <- apply(geoOutput, 1, km2mi)	
	geoOutput <- cbind(geoOutput, distanceMi)
	write.csv(geoOutput, file="geoOutput.csv")
	return(geoOutput)}

