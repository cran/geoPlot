numsOnly <-
function(x){
	column <- x[2]
	xN <- gsub("[^0-9]", "", column, ignore.case=TRUE)
	xP <- x[5]
	numsTmp <- paste(xN, xP,  sep="")
	nums <- gsub(" ", "", numsTmp, ignore.case = TRUE)
	return(nums)
	}

