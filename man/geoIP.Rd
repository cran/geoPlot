\name{geoIP}
\alias{geoIP}
\title{ipListLookup}
\description{
Implements a lookup using the InfoDB API to determine latitude & longitude point coordinates for a given ip address.
There is a package dependency here for rjson.  You must have this.  Also, you should get your own API code and supplement it for the one used here.  See Details Section.
For geocoding a single ip address:  geoIP("38.122.8.198")
}
\arguments{
  \item{x}{x is the ip address in ipV4 format}
}
\details{
The lookup here is performed by using the InfoDB ip lookup page at http://ipinfodb.com/.  The library rjson is a dependency.
The lookup is performed through an API call to http which is structured as follows:
PATTERN: http://api.ipinfodb.com/v3/ip-city/?key=YOUR_API_KEY&ip=XXX.XXX.XXX.XXX&format=json
EXAMPLE: http://api.ipinfodb.com/v3/ip-city/?key=6c8674baa7ea5e3be60472a0cecc7e874fe7be450e83a265c9be67ce8a847e71&ip=38.122.8.198&format=json
You can get your own API key, (yes, it's free), and supplement it into the code for the geoIP function at http://ipinfodb.com/ip_location_api.php.
The data will be returned in a JSON document on a page which is ingested.
}
\value{
A list is returned containing the following elements:
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
\references{
http://ipinfodb.com
http://ipinfodb.com/ip_location_api.php
}
\author{
Randall Shane, PhD
rshane@basexvi.com
}
\seealso{\code{\link{ipListLookup}},
         \code{\link{geoPlot}}}
\examples{
#geoIP("38.122.8.198")
#x <- "38.122.8.198"
#geoIP(x)

## The function is currently defined as
function (x) 
{
    options(warn = -1)
    y <- data.frame(t(rep(NA, 11)))
    y <- y[-1, ]
    colnames(y) <- c("ipAddress", "statusCode", "latitude", "longitude", 
        "statusMessage", "countryCode", "countryName", "regionName", 
        "cityName", "zipCode", "timeZone")
    library(rjson)
    temp01 <- paste("http://api.ipinfodb.com/v3/ip-city/?key=6c8674baa7ea5e3be60472a0cecc7e874fe7be450e83a265c9be67ce8a847e71&ip=", 
        x, "&format=json", sep = "", collapse = NULL)
    temp02 <- fromJSON(paste(readLines(temp01), collapse = ""))
    y[1, 1] <- temp02[3]
    y[1, 2] <- temp02[1]
    if (!is.na(as.double(temp02[9]))) {
        y[1, 3] <- as.double(unlist(temp02[9]))
    }
    else {
        y[1, 3] <- 0
    }
    if (!is.na(as.double(temp02[10]))) {
        y[1, 4] <- as.double(unlist(temp02[10]))
    }
    else {
        y[1, 4] <- 0
    }
    y[1, 5] <- temp02[2]
    y[1, 6] <- temp02[4]
    y[1, 7] <- temp02[5]
    y[1, 8] <- temp02[6]
    y[1, 9] <- temp02[7]
    y[1, 10] <- temp02[8]
    y[1, 11] <- temp02[11]
    return(y)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ipaddress}
\keyword{geoIP}
\keyword{geoCode}
\keyword{geoPlot}
