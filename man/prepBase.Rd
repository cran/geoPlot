\name{prepBase}
\alias{prepBase}
\title{Prepares the Base file for Geo Comparison}
\description{
	This function prepares the base file for comparison by encoding the
	short latitude longitude string and renaiming the columns.  NOTE: This is 
	generally called by the geoCompare function.
}
\usage{
prepBase(x)
}

\arguments{
  \item{x}{x is the data frame to be encoded}
}
\details{
	The short latitude and longitude string is the degree portion of the 
	latitude concatenated to the degree portion of the longitude.  This 
	is used in the comparison of the base and match data.
	NOTE: This is a support function called by the geoCompare function.
}
\value{
	The returned value is a data frame with renamed columns as the base portion 
	of the addresses to be compared to.  The columns are as follows:
	Base_id, Base_address, Base_city, Base_stateprov, Base_postal, Base_geoURL, 
	Base_geoLL, Base_longitude, Base_latitude, shortKey
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
baseCompare <- encodeLLshort(x)
colnames(baseCompare)[1] <- "Base_id"
colnames(baseCompare)[2] <- "Base_address"
colnames(baseCompare)[3] <- "Base_city"
colnames(baseCompare)[4] <- "Base_stateprov"
colnames(baseCompare)[5] <- "Base_postal"
colnames(baseCompare)[6] <- "Base_geoURL"
colnames(baseCompare)[7] <- "Base_geoLL"
colnames(baseCompare)[8] <- "Base_longitude"
colnames(baseCompare)[9] <- "Base_latitude"
colnames(baseCompare)[10] <- "shortKey"
return(baseCompare)}
}

\keyword{prep}

