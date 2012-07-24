\name{degrees2radians}
\alias{degrees2radians}
\title{degrees2radians}
\description{
This is a conversion from degrees to radians for the haversine function.
}
\arguments{
  \item{x}{Degrees}
}
\details{
This really is not intended to be used on its own.  If you need to convert degrees to radians, you can.
}
\value{
Measurement in radians.
}
\author{
Randall Shane, PhD
rshane@basexvi.com
}
\examples{
#degrees2radians(180)
#x <- -79.34526
#degrees2radians(x)

## The function is currently defined as
function (x) 
{
    radians <- (x * 0.0174532925)
    return(radians)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{haversine}
\keyword{radians}
