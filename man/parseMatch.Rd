\name{parseMatch}
\alias{parseMatch}
\title{Compares Parsed Addresses from 2 Data Frames}
\description{
	This function compares the parsed addresses from the match data frame
	to the parsed addresses from the base data frame and assembles a data 
	frame containing the like items from both.
}
\usage{
parseMatch(x, y)
}

\arguments{
  \item{x}{x is data frame number 1 containing parsed addresses}
  \item{y}{y is data frame number 2 containing parsed addresses}
}

\details{
	This function compares the parsed addresses from the match data frame
	to the parsed addresses from the base data frame and assembles a data 
	frame containing the like items from both.  You MUST use the addressParse
	function on both data frames first to generate the addNums field before
	using this function.
}
\value{
	The returned data frame will contain those items from both input data frames
	which possess the same value in the parsed address fields.  Additionally, this
	function writes a csv table containins the contents of the returned data frame
	to the working directory.  This file will be named parsedMatches.csv by default.
}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}
\seealso{}
\examples{
parsedMatched <- parseMatch(matchParsed, baseParsed)

## The function is currently defined as
function(x, y){
matchRL <- which(x$addNums \%in\% y$addNums)
matchLR <- which(y$addNums \%in\% x$addNums)
matches <- x[c(matchRL),]
rowsLR <- y[c(matchLR),]
colnames(rowsLR)[1] <- "Base_id"
colnames(rowsLR)[2] <- "Base_address"
colnames(rowsLR)[3] <- "Base_city"
colnames(rowsLR)[4] <- "Base_stateprov"
colnames(rowsLR)[5] <- "Base_postal"
matches <- cbind(matches, rowsLR)
write.csv(matches, file="parsedMatches.csv")
return(matches)}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{address}
\keyword{parse}
