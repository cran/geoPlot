parseMatch <-
function(x, y){
	matchRL <- which(x$addNums %in% y$addNums)
	matchLR <- which(y$addNums %in% x$addNums)
	matches <- x[c(matchRL),]
	rowsLR <- y[c(matchLR),]
	colnames(rowsLR)[1] <- "Base_id"
	colnames(rowsLR)[2] <- "Base_address"
	colnames(rowsLR)[3] <- "Base_city"
	colnames(rowsLR)[4] <- "Base_stateprov"
	colnames(rowsLR)[5] <- "Base_postal"
	matches <- cbind(matches, rowsLR)
	write.csv(matches, file="parsedMatches.csv")
	return(matches)}

