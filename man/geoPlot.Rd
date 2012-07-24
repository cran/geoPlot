\name{geoPlot}
\alias{geoPlot}
\title{geoPlot}
\description{
This function plots either a single or list of latitude/longitude coordinates on a Google Map.
The RgoogleMaps package is a dependency.
}
\arguments{
  \item{x}{x is a data frame with latitude and longitude in the 3rd and 4th column respectively.  This aligns with the oupput of geoAddress and geoIP.}
  \item{zoom}{This is the zoom level of the map.  Default is 6, play around to see what works best.}
  \item{maptype}{This is the type of map.  Options are: roadmap, mobile, satellite, terrain, hybrid, mapmaker-roadmap, mapmaker-hybrid.  See package RgoogleMaps for descriptions.}
  \item{color}{This is the color for the plotted points.  The default is red.}
}
\details{
A map is specified through the zoom and maptype arguments with the central location of the map being determined by the mean distance or the centers of the coordinates input.  The points are subsequently plotted using the inpur data frame coordinates and represented in the color argument's specified color.}
\value{
The output is a PNG file map with the plotted coordinates.}
\references{
rGoogleMaps
}
\author{
Randall Shane, PhD
rshane@basexvi.com
}

\seealso{
  \code{\link{degrees2radians}},
  \code{\link{geoAddress}},
  \code{\link{geoIP}},
  \code{\link{addrListLookup}},
  \code{\link{ipListLookup}}
}
\examples{
#x <- geoAddress(c("001","202 South Central Avenue","Flagler Beach","FL","32136","US"))
#geoPlot(x)

#y <- c("001","202 South Central Avenue","Flagler Beach","FL","32136","US")
#x <- geoAddress(y)
#geoPlot(x)

#x <- load("addresses.rda")
#geoAddresses <- addrListLookup(x)
#geoPlot(geoAddresses)

#x <- geoIP("38.122.8.198")
#geoPlot(x)

#y <- "38.122.8.198"
#x <- geoIP(y)
#geoPlot(x)

#x <- load("ips.rda")
#geoIPs <- ipListLookup(x)
#geoPlot(geoIPs)

## The function is currently defined as
function (x, zoom = 6, maptype = "mobile", color = "red") 
{
    temp01 <- x[abs(x[3]) > 0, ]
    center <- c(sapply(temp01[3], mean), sapply(temp01[4], mean))
    library(RgoogleMaps)
    mapTemp <- GetMap.bbox(latR = center[1], lonR = center[2], 
        zoom = zoom, destfile = "MapTemp.png", maptype = maptype)
    PlotOnStaticMap(mapTemp, lat = temp01[, 3], lon = temp01[, 
        4], destfile = "GeoPlot.png", zoom = NULL, size = c(640, 
        640), add = FALSE, GRAYSCALE = FALSE, pch = 16, col = color)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{geoPlot}
\keyword{geoCode}
\keyword{map}
\keyword{plot}
\keyword{googleMaps}
