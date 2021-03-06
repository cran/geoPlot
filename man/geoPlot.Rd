\name{geoPlot}
\alias{geoPlot}
\title{geoPlot}
\description{
This function plots either a single or list of latitude/longitude coordinates on a Google Map. The RgoogleMaps package is a dependency along with XML.
}
\usage{
geoPlot(x,zoom,maptype,color)
}
\arguments{
  \item{x}{x is a data frame with latitude and longitude in the 3rd and 4th column respectively.  This aligns with the output of geoAddress and geoIP.}
  \item{zoom}{This is the zoom level of the map.  Default is 6, play around to see what works best.  Max is in the low 20s depending on the resolution of the available Google map for that area.}
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
x1 <- c("001","1600 Pennsylvania Ave","Washington","DC","20006","US")
x2 <- geoAddress(x1)
geoPlot(x2,zoom=6,maptype="mobile",color= "red")
}
\keyword{geoPlot}
