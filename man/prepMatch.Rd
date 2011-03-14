\name{prepMatch}
\alias{prepMatch}
\title{Prepares the Matche file for Geo Comparison}
\description{
	This function prepares the match file for comparison by encoding the
	short latitude longitude string and renaiming the columns.  NOTE: This is 
	generally called by the geoCompare function.
}
\usage{
prepMatch(x)
}
\arguments{
  \item{x}{x is the data frame to be encoded}
}
\details{
	The short latitude and longitude string is the degree portion of the 
	latitude concatenated to the degree portion of the longitude.  This 
	is used in the comparison of the base and match data.
	NOTE: This is generally called by the geoCompare function.
}
\value{
	The returned value is a data frame with renamed columns as the base portion 
	of the addresses to be compared to.  The columns are as follows:
	Match_id, Match_address, Match_city, Match_stateprov, Match_postal, Match_geoURL, 
	Match_geoLL, Match_longitude, Match_latitude, shortKey
}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}
\examples{
## 	NOTE: This is a support function called by the geoCompare function.


## The function is currently defined as
function(x){
matchCompare <- encodeLLshort(x)
colnames(matchCompare)[1] <- "Match_id"
colnames(matchCompare)[2] <- "Match_address"
colnames(matchCompare)[3] <- "Match_city"
colnames(matchCompare)[4] <- "Match_stateprov"
colnames(matchCompare)[5] <- "Match_postal"
colnames(matchCompare)[6] <- "Match_geoURL"
colnames(matchCompare)[7] <- "Match_geoLL"
colnames(matchCompare)[8] <- "Match_longitude"
colnames(matchCompare)[9] <- "Match_latitude"
colnames(matchCompare)[10] <- "shortKey"
return(matchCompare)}
}

\keyword{prep}

