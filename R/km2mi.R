km2mi <-
function(x){
	km <- as.double(x[21])
	miles <- as.double(km * 0.621371192)
	return(miles)}

