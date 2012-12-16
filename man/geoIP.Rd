\name{geoIP}
\alias{geoIP}
\title{ipListLookup}
\description{
Implements a lookup using the InfoDB API to determine point coordinates for a given ip address.  There is a package dependency here for rjson and you must have this.  Also, you should get your own API code and supplement it for the one used here.  See Details Section.
}
\usage{
geoIP(x)
}
\arguments{
  \item{x}{x is the ip address in ipV4 format}
}
\details{
The lookup here is performed by using the InfoDB ip lookup page at http://ipinfodb.com/ via API call to http which is structured as follows:\cr
PATTERN: http://api.ipinfodb.com/v3/ip-city/?key=YOUR_API_KEY&ip=XXX.XXX.XXX.XXX&format=json\cr
You can get your own API key, (yes, it's free), and supplement it into the code for the geoIP function at http://ipinfodb.com/ip_location_api.php.  The data will be returned in a JSON document on a page which is ingested.
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
http://ipinfodb.com/ip_location_api.php
}
\author{
Randall Shane, PhD\cr
rshane@basexvi.com
}
\seealso{\code{\link{ipListLookup}},
         \code{\link{geoPlot}}}
\examples{
x <- "38.122.8.198"
geoIP(x)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ipaddress}
\keyword{geoIP}
