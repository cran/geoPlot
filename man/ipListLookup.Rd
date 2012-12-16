\name{ipListLookup}
\alias{ipListLookup}
\title{ipListLookup}
\description{
This function geocodes a list of ip addresses.
}
\usage{
ipListLookup(x)
}
\arguments{
  \item{x}{x is a list containing ip addresses.}
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
Randall Shane, PhD\cr
rshane@basexvi.com
}
\seealso{\code{\link{geoIP}},
         \code{\link{geoPlot}}}
\examples{
ips <- c('108.128.64.50','108.223.56.106','108.230.22.18','108.231.204.187','108.66.55.227')
x <- data.frame(ips)
x
ipListLookup(x)
}
\keyword{ipaddress}
\keyword{geoIP}
