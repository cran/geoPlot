prepMatch <-
function(x){
	matchCompare <- encodeLLshort(x)
	colnames(matchCompare)[1] <- "Match_id"
	colnames(matchCompare)[2] <- "Match_address"
	colnames(matchCompare)[3] <- "Match_city"
	colnames(matchCompare)[4] <- "Match_stateprov"
	colnames(matchCompare)[5] <- "Match_postal"
	colnames(matchCompare)[6] <- "Match_geoURL"
	colnames(matchCompare)[7] <- "Match_geoLL"
	colnames(matchCompare)[8] <- "Match_longitude"
	colnames(matchCompare)[9] <- "Match_latitude"
	colnames(matchCompare)[10] <- "shortKey"
	return(matchCompare)}

