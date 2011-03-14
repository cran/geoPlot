\name{splitLong}
\alias{splitLong}
\title{Splits Longitude from the raw LL}
\description{
	This function splits the longitude from the raw LL column of the 
	data frame.  NOTE:  This is a support function intended to ONLY
	be used from geoCode.
}
\usage{
splitLong(x)
}

\arguments{
  \item{x}{x is the data frame containing the raw latitude and longitude column
  output by urlGoogData()}
}
\details{
	This function splits the longitude from the raw LL column of the 
	data frame and converts the character string to a double.
	NOTE:  This is a support function intended to ONLY be used from geoCode.
}
\value{
	The output is the longitude field bound to the data frame.
}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}

\seealso{}
\examples{
## NOTE:  This is a support function intended to ONLY be used from geoCode.

## The function is currently defined as
function(x) {
llData <- x[7]
long <- as.double(unlist( strsplit(as.character(llData), "\""))[2])
return(long)
  }
}

\keyword{split}