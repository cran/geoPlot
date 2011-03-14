\name{geoCompare}
\alias{geoCompare}
\title{geoCompares addresses}
\description{
	This is the main function that compares addresses from 2 data frames
	by resolving the point coordinates and comparing.
}
\usage{
geoCompare(x, y)
}
\arguments{
  \item{x}{This is data frame #1}
  \item{y}{This is data frame #2}
}
\details{
	This is the main function to perform geo comparison.  This function takes 2 dataframes
	containing geocoded addresses loaded wih the csvImport and xmlImport functions, and geocoded
	using the geoCode function and compares the addresses through a 2 stage process.  
	The first stage creates a short string by concatenating the latitude and longitude 
	degrees and performing a many to many join.  This produces matches that are within 110 km or 69
	miles of eachother.  The second phase is to calculate the distance using the haversine formula
	and convert the distance for both km and miles.  All data units used during the process are
	returned in a data frame and also saved to the working directory as geoOutput.csv.  A decision was
	made to return any matches that are not able to be geocoded and these matches are identified in the
	column labeled geoValid with a value of FALSE.
}
\value{
	Two items are returned by this function:
	1)  The first is a data frame containing the results of the locations that are within one degree of
	latitude and longitude of another.
	2)  The second is a delimited file saved to the working directory under the name geoOutput.csv
}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}
\examples{
# Two input tables are baseData and matchData which are geocoded to produce 2 geocoded data frames
# names baseGeoCoded and matchGeocoded.  These are compared as follows:

geoComplete <- geoCompare( matchGeoCoded, baseGeoCoded)

# The resule is a data frame containins the data names geoComplete.

## The function is currently defined as
function(x,y){
matchCompare <- prepMatch(x)
baseCompare <- prepBase(y)
geoOutput <- merge(matchCompare, baseCompare, by.matchCompare="shortKey", by.baseCompare="shortKey")
geoValid <- apply(geoOutput, 1, geoValidate)
geoOutput <- cbind(geoOutput, geoValid)
distanceKm <- apply(geoOutput, 1, haversine)
geoOutput <- cbind(geoOutput, distanceKm)
distanceMi <- apply(geoOutput, 1, km2mi)
geoOutput <- cbind(geoOutput, distanceMi)
write.csv(geoOutput, file="geoOutput.csv")
return(geoOutput)}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{compare}

