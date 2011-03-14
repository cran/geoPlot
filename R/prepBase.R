prepBase <-
function(x){
	baseCompare <- encodeLLshort(x)
	colnames(baseCompare)[1] <- "Base_id"
	colnames(baseCompare)[2] <- "Base_address"
	colnames(baseCompare)[3] <- "Base_city"
	colnames(baseCompare)[4] <- "Base_stateprov"
	colnames(baseCompare)[5] <- "Base_postal"
	colnames(baseCompare)[6] <- "Base_geoURL"
	colnames(baseCompare)[7] <- "Base_geoLL"
	colnames(baseCompare)[8] <- "Base_longitude"
	colnames(baseCompare)[9] <- "Base_latitude"
	colnames(baseCompare)[10] <- "shortKey"
	return(baseCompare)}

