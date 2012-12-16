\name{haversine}
\alias{haversine}
\title{haversine}
\description{This is the haversine formula for determining distance between coordinated on a globe.
}
\usage{
haversine(xLat, xLon, yLat, yLon)
}
\arguments{
  \item{xLat}{Position 1 latitude.}
  \item{xLon}{Position 1 longitude.}
  \item{yLat}{Position 2 latitude.}
  \item{yLon}{Position 2 longitude.}
}
\value{
The output is a list with the coordinates, distance in kilometers and miles.
  \item{xLat}{Position 1 latitude.}
  \item{xLon}{Position 1 longitude.}
  \item{yLat}{Position 2 latitude.}
  \item{yLon}{Position 2 longitude.}
  \item{distKm}{Distance between points in kilometers.}
  \item{distMi}{Distance between points in miles.}
}
\references{
http://en.wikipedia.org/wiki/Haversine_formula\cr
http://www.movable-type.co.uk/scripts/latlong.html\cr
http://www.platoscave.net/blog/2009/oct/5/calculate-distance-latitude-longitude-python/
}
\author{
Randall Shane, PhD\cr
rshane@basexvi.com
}
\note{
There is some variation between computations due to the measurement used for the Earth's radius.  This implementation uses the mean radius measurement of 6371 km versus the equitorial radius of 6378.  Feel free to adjust if your opinion differs!
}
\seealso{
  \code{\link{degrees2radians}},
  \code{\link{geoAddress}},
  \code{\link{geoIP}}
}
\examples{
haversine("28.54703","-81.30292","26.93422","-80.09421")
}
\keyword{distance}
\keyword{haversine}
