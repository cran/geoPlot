\name{haversine}
\alias{haversine}
\title{haversine}
\description{
This is the haversine formula for determining distance between coordinated on a globe.
}
\arguments{
  \item{xLat}{Position 1 latitude.}
  \item{xLon}{Position 1 longitude.}
  \item{yLat}{Position 2 latitude.}
  \item{yLon}{Position 2 longitude.}
}
\details{
The haversine function uses the degrees2radians function during computation.
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
http://en.wikipedia.org/wiki/Haversine_formula
http://www.movable-type.co.uk/scripts/latlong.html
http://www.platoscave.net/blog/2009/oct/5/calculate-distance-latitude-longitude-python/
}
\author{
Randall Shane, PhD
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
#haversine("28.54703","-81.30292","26.93422","-80.09421")

## The function is currently defined as
function (xLat, xLon, yLat, yLon) 
{
    earthR <- 6371
    mLat <- as.double(xLat)
    bLat <- as.double(yLat)
    mLong <- as.double(xLon)
    bLong <- as.double(yLon)
    changeLat <- degrees2radians(mLat - bLat)
    changeLong <- degrees2radians(mLong - mLong)
    a <- sin(changeLat/2) * sin(changeLat/2) + cos(degrees2radians(mLat)) * 
        cos(degrees2radians(bLat)) * sin(changeLong/2) * sin(changeLong/2)
    c <- 2 * atan2(sqrt(a), sqrt(1 - a))
    distKm <- earthR * c
    distMi <- as.double(distKm * 0.621371192)
    output <- c(xLat, xLon, yLat, yLon, distKm, distMi)
    return(output)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{distance}
\keyword{haversine}
