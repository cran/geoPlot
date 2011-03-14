\name{numsOnly}
\alias{numsOnly}
\title{Strips Numbers from Address Fields}
\description{ This is a support function for the
	parseMatch function.
}
\usage{
numsOnly(x)
}
\arguments{
  \item{x}{data frame containing address data}
}
\details{
	NOTE:  This is a support function for addressParse and
	is not meant to be used stand alone.
}
\value{
	The returned vales strip numbers from
	address fields}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}
\seealso{}
\examples{
##	NOTE:  This is a support function for addressParse and
##         is not meant to be used stand alone.

## The function is currently defined as
function(x){
column <- x[2]
xN <- gsub("[^0-9]", "", column, ignore.case=TRUE)
xP <- x[5]
numsTmp <- paste(xN, xP,  sep="")
nums <<- gsub(" ", "", numsTmp, ignore.case = TRUE)
return(nums)
  }
}
\keyword{numbers}

