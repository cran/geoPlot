\name{geoPlot}
\alias{geoPlot}
\title{geoPlot}
\description{
This function plots either a single or list of latitude/longitude coordinates on a Google Map. The RgoogleMaps package is a dependency.
}
\usage{
geoPlot(x,zoom,maptype,color)
}
\arguments{
  \item{x}{x is a data frame with latitude and longitude in the 3rd and 4th column respectively.  This aligns with the oupput of geoAddress and geoIP.}
  \item{zoom}{This is the zoom level of the map.  Default is 6, play around to see what works best.}
  \item{maptype}{This is the type of map.  Options are: roadmap, mobile, satellite, terrain, hybrid, mapmaker-roadmap, mapmaker-hybrid.  See package RgoogleMaps for descriptions.}
  \item{color}{This is the color for the plotted points.  The default is red.}
}
\author{
Randall Shane, PhD\cr
rshane@basexvi.com
}
\seealso{
  \code{\link{geoAddress}},
  \code{\link{geoIP}},
  \code{\link{addrListLookup}},
  \code{\link{ipListLookup}}
}
\examples{
x <- geoAddress(c("001","202 South Central Avenue","Flagler Beach","FL","32136","US"))
geoPlot(x,zoom=6,maptype="mobile",color= "red")
}
\keyword{geoPlot}
