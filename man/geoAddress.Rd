\name{geoAddress}
\alias{geoAddress}
\title{geoAddress}
\description{
Implements a lookup using the Google Maps API to determine point and box coordinates for a given address.
}
\usage{
geoAddress(x)
}
\arguments{
  \item{x}{x is a list or data frame containing: id, address, city, state/province, postal & country.  The id is simply an identifier field and the remaining address elements do not have to be universally populated.  A concatenation of the vector elements occurs but the input specification is only rigid in that id and 4 elements are needed.
}
}
\details{
The GoogleMaps API is interfaced by rendering an address via URL in the following format:\cr
PATTERN:  http://maps.google.com/maps/geo?q=address+city+state+zip+country&output=xml&key=$key\cr
The output is a web page containing the XML document with the data fields which are then ingested.
}
\value{
The returned value is a list containing the elements: id, address, latitude (point coordinate), longitude (point coordinate), north box coordinate, south box coordinate, east box coordinate, west box coordinate.\cr
\item{id}{User defined identifier.}
\item{address}{Concatenated address data.}
\item{latitude}{Point coordinate - latitude.}
\item{longitude}{Point coordinate - longitude.}
\item{box_north}{Box coordinate - North.}
\item{box_south}{Box coordinate - South.}
\item{box_east}{Box coordinate - East.}
\item{box_west}{Box coordinate - West.}
}
\author{
Randall Shane, PhD\cr
rshane@basexvi.com
}
\seealso{\code{\link{addrListLookup}},
         \code{\link{geoPlot}}}
\examples{
x <- c("001","202 South Central Avenue","Flagler Beach","FL","32136","US")
geoAddress(x)
}
\keyword{address}
\keyword{geoAddress}
\keyword{geoCode}

