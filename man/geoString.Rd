\name{geoString}
\alias{geoString}
\title{Prepares a character string for the Google Maps API}
\description{
	This function creates a character string for the Google Maps
	API in order to geocode the address.  NOTE:  This is a support
	function to be used with geoCode.
}
\usage{
geoString(x)
}
\arguments{
  \item{x}{x is the data frame containing the address to be geocoded}
}
\details{
	The Google Maps API functions through a URL string rendered and returns
	a data string containing the latitude and longitude of the address.
	This function creates the string to be rendered.
	NOTE:  This is a support function to be used with geoCode.
}
\value{
	The return value is a column added to the data frame containing the
	URL which this function creates.}
\references{
http://code.google.com/apis/maps/documentation/geocoding/
}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}

\seealso{}
\examples{
# NOTE:  This is a support function to be used with geoCode.



## The function is currently defined as
function(x) {
geoData <- paste(
"http://maps.google.com/maps/geo?q=",
paste( gsub(" ", "+", x[2], ignore.case = FALSE, perl = FALSE,
    fixed = FALSE, useBytes = FALSE), 
gsub(" ", "+", x[3], ignore.case = FALSE, perl = FALSE,
    fixed = FALSE, useBytes = FALSE),
gsub(" ", "+", x[4], ignore.case = FALSE, perl = FALSE,
    fixed = FALSE, useBytes = FALSE),
gsub(" ", "+", x[5], ignore.case = FALSE, perl = FALSE,
    fixed = FALSE, useBytes = FALSE),sep="+", collapse=NULL),
"&output=xml&key=$key", sep="", collapse=NULL)
return( geoData) }
}

\keyword{geoURL}
\keyword{URL}
