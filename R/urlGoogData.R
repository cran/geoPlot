urlGoogData <-
function(x) {
			parse00 <- readLines( as.character(x[6]))
			pointLine <- grep("coordinates", parse00)
			parse01 <- substr( parse00[pointLine], 25, 47)
			if(!is.na(parse01[1])) parse02 <- parse01[1] else parse02 <- "0,0"
			rawLL <- strsplit(parse02, ",")
			return( rawLL)}

