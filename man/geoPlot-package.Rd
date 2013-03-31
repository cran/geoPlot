\name{geoPlot-package}
\alias{geoPlot-package}
\docType{package}
\title{Geocodes street address or ip address, plots on Google map, determines distance between 2 points.}
\description{
There are 4 primary functions:\cr
1) Resolve street address to point and box coordinates.\cr
2) Resolve ip address to point coordinates.\cr
3) Plot resolved points on specified Google map.\cr
4) Determine distance between 2 points in km or mi using haversine formula.\cr
}
\details{
\tabular{ll}{
Package: \tab geoPlot\cr
Type: \tab Package\cr
Version: \tab 2.2\cr
Date: \tab 2012-03-31\cr
License: \tab GPL-2\cr
}
INSTRUCTIONS:\cr

To resolve (geocode) a single address to coordinates:\cr
x <- geoAddress(c("001","202 South Central Avenue","Flagler Beach","FL","32136","US"))\cr
Plot the address on a map:\cr
geoPlot(x)\cr
\cr
To geocode and plot a data frame of addresses: (see geoAddr for format)\cr
addr <- load('ListOfAddresses.rda')\cr
geoAddr <- addrListLookup(addr)\cr
geoPlot(geoAddr)\cr
\cr
\cr
To geocode a single ip address:\cr
x <- geoIP("38.122.8.198")\cr
Plot on the map:\cr
geoPlot(x)\cr
\cr
To geocode and plot a data frame of ips: (see geoIP for format)\cr
ips <- load('ListOfIPs.rda')\cr
geoIPs <- ipListLookup(ips)\cr
geoPlot(geoIPs)\cr
\cr
\cr
To determine the distance between 2 points:\cr
haversine("28.54703","-81.30292","26.93422","-80.09421")\cr
\cr
To determine the distance between 2 points resolved above:\cr
haversine(geoAddr[1,3],geoAddr[1,4],geoAddr[2,3],geoAddr[2,4])\cr
haversine(geoIPs[1,3],geoIPs[1,4],geoIPs[2,3],geoIPs[2,4])\cr
}

\author{
Randall Shane, PhD\cr
<rshane@basexvi.com>
}

\references{
http://ipinfodb.com/ip_location_api.php\cr
http://en.wikipedia.org/wiki/Haversine_formula\cr
http://www.movable-type.co.uk/scripts/latlong.html\cr
http://www.platoscave.net/blog/2009/oct/5/calculate-distance-latitude-longitude-python/\cr
http://www.google.com/maps
}

\keyword{geoPlot}

\examples{
x <- geoAddress(c("001","202 South Central Avenue","Flagler Beach","FL","32136","US"))
geoPlot(x)
y <- geoIP("38.122.8.198")
geoPlot(y)
haversine(28.54703,-81.30292,26.93422,-80.09421)
}
