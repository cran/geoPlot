\name{geoCode}
\alias{geoCode}
\title{Geocodes Addresses}
\description{
	This is the main function that geocodes addresses in the data frames
	and returns longitude and latitude.
}
\usage{
geoCode(x)
}

\arguments{
  \item{x}{x is the data frame containing addresses to be geocoded}
}
\details{
	This function uses the structured data frames and the Google Maps API to geocode
	addresses.  The supporting functions employed from this package are geoString,
	urlGoogData, splitLong and splitLat.
}
\value{
	The returned values include the URL for rendering to the Google Maps API, the raw
	latitude and longitude and the converted (to double) split latitude and longitude 
	columns which are all bound to the data frame.
}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}
\seealso{}
\examples{
geoCode(matchData)

## The function is currently defined as
function(x){
geoTemp <- x
geoURL <- apply(geoTemp, 1, geoString)
geoTemp <- cbind(geoTemp, geoURL)
geoLL <- as.character(apply(geoTemp, 1, urlGoogData))
geoTemp <- cbind(geoTemp, geoLL)
long <- apply(geoTemp, 1, splitLong)
geoTemp <- cbind(geoTemp, long)
lat <- apply(geoTemp, 1, splitLat)
geoTemp <- cbind(geoTemp, lat)
return(geoTemp)}
}

\keyword{geocode}

