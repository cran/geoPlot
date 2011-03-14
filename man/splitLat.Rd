\name{splitLat}
\alias{splitLat}
\title{Splits Latitude from the raw LL}
\description{
	This function splits the latitude from the raw LL column of the 
	data frame.  NOTE:  This is a support function intended to ONLY
	be used from geoCode.
}
\usage{
splitLat(x)
}
\arguments{
  \item{x}{x is the data frame containing the raw latitude and longitude column
  output by urlGoogData()}
}
\details{
	This function splits the latitude from the raw LL column of the 
	data frame and converts the character string to a double.
	NOTE:  This is a support function intended to ONLY be used from geoCode.
}
\value{
	The output is the latitude field bound to the data frame.
}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}

\seealso{}
\examples{
## NOTE:  This is a support function intended to ONLY be used from geoCode.

## The function is currently defined as
function(x) {
llData <- x[7]
lat <- as.double(unlist( strsplit(as.character(llData), "\""))[4])
return(lat)
  }
}

\keyword{split}
