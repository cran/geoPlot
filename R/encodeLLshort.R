encodeLLshort <-
function(x){
	geoCompare <- x
	longS <- apply(x[8], 1, shortConv)
	latS <- apply(x[9], 1, shortConv)
	shortKey <- paste( gsub(" ", "+", longS),gsub(" ", "+", latS), sep="", collapse=NULL)
	geoCompare <- cbind(geoCompare, shortKey)
	return(geoCompare)}

