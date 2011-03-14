\name{encodeLLshort}
\alias{encodeLLshort}
\title{Creates a short Latitude Longitude string for comparison}
\description{
	This function creates a short latitude and longitude string for comparison
	and is a component of the prepMatch and prepBase functions.
	NOTE:  This is a support function and is not intended
	to be used stand alone
}
\usage{
encodeLLshort(x)
}
\arguments{
  \item{x}{x is the data frame containing the data to be encoded}
}
\details{
	NOTE:  This is a support function and is not intended
	to be used stand alone.
}
\value{	
The returned value is a shortened and converted to a character value
}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}
\examples{
## NOTE:  This is a support function and is not intended
## to be used stand alone.

## The function is currently defined as
function(x){
geoCompare <- x
longS <- apply(x[8], 1, shortConv)
latS <- apply(x[9], 1, shortConv)
shortKey <- paste( gsub(" ", "+", longS),gsub(" ", "+", latS), sep="", collapse=NULL)
geoCompare <- cbind(geoCompare, shortKey)
return(geoCompare)}
}

\keyword{encode}

