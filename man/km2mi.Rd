\name{km2mi}
\alias{km2mi}
\title{Converts Km to Miles}
\description{
	This function converts Kilometers to Miles.  This is used by geoCompare
	and can also be used stand alone.
}
\usage{
km2mi(x)
}

\arguments{
  \item{x}{x is the kilometer value}
}
\details{}
\value{
	The resulting value is a double number expressing the mile value
}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}

\examples{
## What is 5 kilometers in miles?
km2mi(5)
# 3.10685596


## The function is currently defined as
function(x){
km <- as.double(x[21])
miles <- as.double(km * 0.621371192)
return(miles)}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{convert}
\keyword{km}
\keyword{mi}

