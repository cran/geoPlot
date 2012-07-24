\name{geoPlot-package}
\alias{geoPlot-package}
\docType{package}
\title{Geocodes street address or ip address, plots on Google map, determines distance between 2 points.}
\description{
There are 4 primary functions:
1) Resolve street address to point and box coordinates.
2) Resolve ip address to point coordinates.
3) Plot resolved points on specified Google map.
4) Determine distance between 2 points in km or mi using haversine formula.
}
\details{
\tabular{ll}{
Package: \tab geoPlot\cr
Type: \tab Package\cr
Version: \tab 2.0\cr
Date: \tab 2012-07-24\cr
License: \tab GPL-2\cr
}
INSTRUCTIONS:
To geocode and plot a single address:
x <- geoAddress(c("001","202 South Central Avenue","Flagler Beach","FL","32136","US"))
geoPlot(x)

To geocode and plot a list of addresses:
x <- load("addresses.rda")
geoAddresses <- addrListLookup(x)
geoPlot(geoAddresses)

To geocode and plot a single ip address:
x <- geoIP("38.122.8.198")
geoPlot(x)

To geocode and plot a list of ip addresses:
x <- load("ips.rda")
geoIPs <- ipListLookup(x)
geoPlot(geoIPs)

To determine the distance between 2 points:
haversine("28.54703","-81.30292","26.93422","-80.09421")

To determine the distance between 2 points resolved above:
haversine(geoAddresses[1,3],geoAddresses[1,4],geoAddresses[2,3],geoAddresses[2,4])
haversine(geoIPs[1,3],geoIPs[1,4],geoIPs[2,3],geoIPs[2,4])
}

\author{Maintainer: Randall Shane, PhD <rshane@basexvi.com>}

\references{
http://ipinfodb.com
http://ipinfodb.com/ip_location_api.php
http://en.wikipedia.org/wiki/Haversine_formula
http://www.movable-type.co.uk/scripts/latlong.html
http://www.platoscave.net/blog/2009/oct/5/calculate-distance-latitude-longitude-python/
rGoogleMaps
http://www.google.com/maps
}

\keyword{geoPlot}

\examples{
#x <- geoAddress(c("001","202 South Central Avenue","Flagler Beach","FL","32136","US"))
#geoPlot(x)
#x <- load("addresses.rda")
#geoAddresses <- addrListLookup(x)
#geoPlot(geoAddresses)
#x <- geoIP("38.122.8.198")
#geoPlot(x)
#x <- load("ips.rda")
#geoIPs <- ipListLookup(x)
#geoPlot(geoIPs)
#haversine(28.54703,-81.30292,26.93422,-80.09421)
#haversine(geoAddresses[1,3],geoAddresses[1,4],geoAddresses[2,3],geoAddresses[2,4])
#haversine(geoIPs[1,3],geoIPs[1,4],geoIPs[2,3],geoIPs[2,4])
}
