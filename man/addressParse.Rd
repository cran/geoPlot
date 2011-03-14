\name{addressParse}
\alias{addressParse}
\title{Strips Numbers from Address Fields}
\description{ 
	This function returns a data frame with a
	unique match field.
}
\usage{
addressParse(x)
}
\arguments{
  \item{x}{data frame containing address data}
}
\details{ 
	This function strips numbers from the address fields of the
	data frames constructed by the import functions in this packages
	and returns a data frame with a unique match field.  The match field
	is named addNums and is a concatenation of the numeric characters
	from the address field with the postal code.
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
baseParsed <- addressParse(baseData)
matchParsed <- addressParse(matchData)

## The function is currently defined as
function(x){
addNums <- apply(x,1,numsOnly)
parsed <- cbind(x, addNums)
return(parsed)}
}
\keyword{parse}
\keyword{address}

