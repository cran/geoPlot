\name{ipListLookup}
\alias{ipListLookup}
\title{ipListLookup}
\description{
This function cleanly runs a list of ip addresses through the geoIP function for geocoding.
}
\arguments{
  \item{x}{
x is a list containing ip addresses.
}
}
\value{
A data frame is returned containing the following elements:
\item{ipaddress}{Input ip address.}
\item{statusCode}{Returned status code from lookup.}
\item{latitude}{Point coordinate - latitude.}
\item{longitude}{Point coordinate - longitude.}
\item{statusMessage}{Returned status message from lookup.}
\item{countryCode}{Country code from ip lookup.}
\item{countryName}{Country name from ip lookup.}
\item{regionName}{State/region/province from ip lookup.}
\item{cityName}{City from ip lookup.}
\item{zipCode}{Postal code from ip lookup.}
\item{timeZone}{Timezone from ip lookup.}
}
\author{
Randall Shane, PhD
rshane@basexvi.com
}
\seealso{\code{\link{geoIP}},
         \code{\link{geoPlot}}}
\examples{
#x <- load("ips.rda")
#ipListLookup(x)

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
\keyword{ipaddress}
\keyword{geoIP}
\keyword{geoCode}
\keyword{geoPlot}
