\name{addrListLookup}
\alias{addrListLookup}
\title{addrListLookup}
\description{
This function cleanly runs a list through the geoAddress function for geocoding.
}
\arguments{
  \item{x}{
x is a list or data frame containing: id, address, city, state/province, postal, country
The id is simply an identifier.  The remaining address elements do not have to be universally populated.  A concatenation of the vector elements occurs but the input specification is only rigid in that id and 4 elements are needed.
x <- load("addresses.rda")
addrListLookup(x)
}
}
\value{
The returned value is a data frame containing the following elements:
id, address, latitude (point coordinate), longitude (point coordinate), north box coordinate, south box coordinate, east box coordinate, west box coordinate.
\item{id}{User defined identifier.  This can be arbitrary}
\item{address}{Concatenated address data.}
\item{latitude}{Point coordinate - latitude.}
\item{longitude}{Point coordinate - longitude.}
\item{box_north}{Box coordinate - North.}
\item{box_south}{Box coordinate - South.}
\item{box_east}{Box coordinate - East.}
\item{box_west}{Box coordinate - West.}
}
\author{
Randall Shane, PhD
rshane@basexvi.com
}
\seealso{\code{\link{geoAddress}},
         \code{\link{geoPlot}}}
\examples{
#x <- load("addresses.rda")
#addrListLookup(x)

## The function is currently defined as
function (x) 
{
    y <- data.frame(t(rep(NA, 11)))
    y <- y[-1, ]
    colnames(y) <- c("ipAddress", "statusCode", "latitude", "longitude", 
        "statusMessage", "countryCode", "countryName", "regionName", 
        "cityName", "zipCode", "timeZone")
    for (i in 1:nrow(x)) {
        input <- x[i, ]
        y <- rbind(y, geoIP(input))
    }
    return(y)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{address}
\keyword{geoAddress}
\keyword{geoCode}
\keyword{geoPlot}
