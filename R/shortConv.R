shortConv <-
function(x){
	y <- unlist(strsplit(as.character(x), split="\\.")[1])
	short <- as.character(strsplit(as.character(y[1]), split="\""))
	return(short)}

