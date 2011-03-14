splitLong <-
function(x) {
	llData <- x[7]
	long <- as.double(unlist( strsplit(as.character(llData), "\""))[2])
	return(long)
	}

