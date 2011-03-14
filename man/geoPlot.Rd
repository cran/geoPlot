\name{geoPlot}
\alias{geoPlot}
\title{Plots Coordinates on a Map}
\description{
	This function allows the user to plot coordinates on a map from the geocoded 
	data tables using the RgoogleMaps package.
	NOTE:  In version 2.12.2 of R, there is an error in the 'rgdal' dependency
	package for RgoogleMaps that is currently unresolved for OSX and Unix systems.
	This will only work in 2.12.2 under windows.  This does function on OSX under 2.12.0
	One set of coordinates is plotted in red circles and the other in blue triangles.
}
\usage{
geoPlot(x, y, zoom, maptype)
}
\arguments{
  \item{x}{x is geoCoded data frame #1}
  \item{y}{y is geoCoded data frame #2}
  \item{zoom}{zoom is the map level, the entire US is zoom=4, guage accordingly}
  \item{maptype}{options are mobile or satelite}
}
\details{}
\value{
	The result is a map with coordinated plotted.
}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}
\examples{
# The example below is commented out but will run once the RgoogleMaps
# library has been loaded so;
# library("RgoogleMaps")
# geoPlot(baseGeoCoded, matchGeoCoded, zoom=4, maptype="mobile")


## The function is currently defined as
function(x, y, zoom, maptype){
noZeros <- x[abs(x[9]) > 0,]
center <- c(as.double(mean(noZeros[9])), as.double(mean(noZeros[8])))
if (is.na(zoom)) zoom <- 6
if (is.na(maptype)) maptype <- "mobile"
mapTemp <- GetMap(center=center, zoom=zoom, destfile="MapTemp.png", maptype=maptype)
blat <- x[,9]
blong <- x[,8]
PlotOnStaticMap( mapTemp, blat, blong, destfile="GeoPlot.png", 
zoom=NULL, size=c(640,640), add=FALSE, GRAYSCALE=FALSE, 
pch=16, col="red")
mlat <- y[,9]
mlong <- y[,8]
GeoPlot <- PlotOnStaticMap( mapTemp, mlat, mlong, destfile="GeoPlot.png", 
zoom=NULL, size=c(640,640), add=TRUE, GRAYSCALE=FALSE, 
pch=17, col="blue")
return(GeoPlot)}
}

\keyword{plot}
