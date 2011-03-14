\name{degrees2radians}
\alias{degrees2radians}
\title{Converts Degrees to Radians
}
\description{
	This function converts degrees to radians.  This is used in the haversine
	formula and also can be used stand alone.
}
\usage{
degrees2radians(x)
}
\arguments{
  \item{x}{x is the degree value or data unit containing the degree value}
}
\details{}
\value{
	The radian value is returned.
}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}
\examples{

(radianValue <- degrees2radians(28.4725452))
## [1] 0.4969397


## The function is currently defined as
function(x){
radians <- (x * 0.0174532925)
return( radians)}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{degrees}
\keyword{radians}

