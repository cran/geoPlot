csvImport <-
function( csvfile) {  
	interim <- read.table(csvfile, header=TRUE, sep=",", na.strings=TRUE)
	colnames(interim)[1] <- "id"
	colnames(interim)[2] <- "address"
	colnames(interim)[3] <- "city"
	colnames(interim)[4] <- "stateprov"
	colnames(interim)[5] <- "postal"
	csvData <- interim
	return( csvData)
	}

