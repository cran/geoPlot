xmlImport <-
function( xmlfile) {
	tempXML1 <- xmlTreeParse(xmlfile, trim=TRUE) 
	tempXML2 <- xmlRoot(tempXML1)
	tempSize <- xmlSize(tempXML2)
	id <- c(1:tempSize)
	address <- c(1:tempSize)
	city <- c(1:tempSize)
	stateprov <- c(1:tempSize)
	postal <- c(1:tempSize)
	tempXML3 <- data.frame(id, address, city, stateprov, postal)
	i <- 1
	while (i <= tempSize) {	
			tempXML3[i,1] <- xmlValue(tempXML2[[i]] [[1]])
			tempXML3[i,2] <- xmlValue(tempXML2[[i]] [[2]])
			tempXML3[i,3] <- xmlValue(tempXML2[[i]] [[3]])
			tempXML3[i,4] <- xmlValue(tempXML2[[i]] [[4]])
			tempXML3[i,5] <- xmlValue(tempXML2[[i]] [[5]])
			i <- i + 1
			}
	xmlData <- tempXML3
	return( xmlData) }

