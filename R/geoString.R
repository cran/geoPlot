geoString <-
function(x) {
			geoData <- paste(
			"http://maps.google.com/maps/geo?q=",
			paste( gsub(" ", "+", x[2], ignore.case = FALSE, perl = FALSE,
    				fixed = FALSE, useBytes = FALSE), 
			gsub(" ", "+", x[3], ignore.case = FALSE, perl = FALSE,
    				fixed = FALSE, useBytes = FALSE),
			gsub(" ", "+", x[4], ignore.case = FALSE, perl = FALSE,
    				fixed = FALSE, useBytes = FALSE),
			gsub(" ", "+", x[5], ignore.case = FALSE, perl = FALSE,
    				fixed = FALSE, useBytes = FALSE),sep="+", collapse=NULL),
			"&output=xml&key=$key", sep="", collapse=NULL)
			return( geoData) }

