\name{urlGoogData}
\alias{urlGoogData}
\title{Retreives Latitude & Longitude from Google Maps API}
\description{
	This function retreives the geocoded data by rendering the geoString
	and webscraping the result.  NOTE:  This is a support function and is 
	intended to be used with geoCode.
}
\usage{
urlGoogData(x)
}
\arguments{
  \item{x}{This is the data frame holding the geoString}
}
\details{
	This function uses the geoString to interface with the Google Maps API
	through HTTP. The result is webscraped using readLines and further parsed
	to provide a point coordinate result.  NOTE:  This is a support function 
	and is intended to be used with geoCode.  However, it can be used to 
	resolve the geoURL to point coordinates.
}
\value{
	The resulting point coordinate is bound to the data frame as a raw character
	string names rawLL containing the latitude and longitude of the address.
	}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}
\seealso{}
\examples{
## NOTE:  This is a support function and is intended to be used with geoCode.


##  The resulting column resebbles the following:  list(c("-75.6518210", "43.0959650"))

## The function is currently defined as
function(x) {
parse00 <- readLines( as.character(x[6]))
pointLine <- grep("coordinates", parse00)
parse01 <- substr( parse00[pointLine], 25, 47)
if(!is.na(parse01[1])) parse02 <<- parse01[1] else parse02 <<- "0,0"
rawLL <<- strsplit(parse02, ",")
return( rawLL)}
}
\keyword{geocode}

