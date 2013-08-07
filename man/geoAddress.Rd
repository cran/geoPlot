\name{geoAddress}
\alias{geoAddress}
\title{geoAddress}
\description{
Implements a lookup using the revised March 2013 Google Maps API to determine point coordinates for a given address.
}
\usage{
geoAddress(x)
}
\arguments{
  \item{x}{x is a list or data frame containing: id, address, city, state/province, postal & country.  The id is simply an identifier field and the remaining address elements do not have to be universally populated.  A concatenation of the vector elements occurs but the input specification is only rigid in that an id field and 4 elements are needed.
}
}
\details{
The GoogleMaps API is interfaced by rendering an address via URL in the following format:\cr
PATTERN:  http://maps.googleapis.com/maps/api/geocode/xml?address=num+street+city+state+zip+country&sensor=false\cr
The output is a web page containing the XML document with the data fields which are then ingested.
}
\value{
The returned value is a list containing the elements: id, address, latitude, longitude (point coordinates).\cr
\item{id}{User defined identifier.}
\item{address}{Concatenated address data.}
\item{latitude}{Point coordinate - latitude.}
\item{longitude}{Point coordinate - longitude.}
}
\author{
Randall Shane, PhD\cr
rshane@basexvi.com
}
\seealso{\code{\link{addrListLookup}},
         \code{\link{geoPlot}}}
\examples{
x <- c("001","1600 Pennsylvania Ave","Washington","DC","20006","US")
geoAddress(x)
}
\keyword{address}
\keyword{geoAddress}
\keyword{geoCode}

