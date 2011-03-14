\name{haversine}
\alias{haversine}
\title{Calculates Distance Between Points}
\description{
	The haversine formula calculates distance between 2 points of latitude
	and longitude.  This implementation uses a single data frame containing
	the points to return a column with the distance in km.  note:  It is
	strongly recommended to run this from the geoCompare function as this is
	written specifically as a support function.  This implementation is not 
	intended to run stand alone.
}
\usage{
haversine(x)
}
\arguments{
  \item{x}{x is the data frame containing the 2 points}
}
\details{
	NOTE:  This is a support function and this implementation is not 
	intended to run stand alone.
}
\value{
	The returned value is a column containing the distance between 2 point
	coordinated expressed in km.
}
\references{
	http://www.codecodex.com/wiki/Calculate_distance_between_two_points_on_a_globe
	http://www.ig.utexas.edu/outreach/googleearth/latlong.html
}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}
\examples{
## 	NOTE:  This is a support function and this implementation is not 
##  intended to run stand alone.

## The function is currently defined as
function(x){
earthR <- 6371
mLat <- as.double(x[10])
bLat <- as.double(x[19])
mLong <- as.double(x[9])
bLong <- as.double(x[18])
changeLat <- degrees2radians(mLat - bLat)
changeLong <- degrees2radians(mLong - mLong)
a <- sin(changeLat/2) * sin(changeLat/2) + cos(degrees2radians(mLat)) * cos(degrees2radians(bLat)) * sin(changeLong/2) * sin(changeLong/2)
c <- 2 * asin(sqrt(a))
distKm <- earthR * c
return(distKm)}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{haversine}

