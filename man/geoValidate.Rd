\name{geoValidate}
\alias{geoValidate}
\title{Evaluates for a Positive Geocode Result}
\description{
	This function evaluates for a positive geocoding result and returns a 
	column with T for a good result anf F for a poor result.
	NOTE:  This is a support function and is not intended to run stand alone.
}
\usage{
geoValidate(x)
}
\arguments{
  \item{x}{x is the column to be evaluated}
}
\details{
	NOTE:  This is a support function and is not intended to run stand alone.
}
\value{
	Returns a logical result whete 0's indicate no geocoding for the address.
}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}
\examples{
## 	NOTE:  This is a support function and is not intended to run stand alone.

## The function is currently defined as
function(x){
valid <- if(x[17]== 'list(c("0", "0"))') FALSE else TRUE
return(valid)}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{validate}

