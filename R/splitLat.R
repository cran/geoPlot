splitLat <-
function(x) {
	llData <- x[7]
	lat <- as.double(unlist( strsplit(as.character(llData), "\""))[4])
	return(lat)
	}

