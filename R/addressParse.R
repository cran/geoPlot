addressParse <-
function(x){
	addNums <- apply(x,1,numsOnly)
	parsed <- cbind(x, addNums)
	return(parsed)}

