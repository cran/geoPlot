\name{geoPlot-package}
\alias{geoPlot-package}
\docType{package}
\title{Compares Addresses}
\description{
	This package compares addresses between data frames by either using an
	address concatenation algorithm or by resolving latitude and longitude 
	point coordinates and implementing the haversine formula for distance.
}
\details{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\references{}
\keyword{geocode}
\seealso{
}
\examples{

# Import Data Files
# baseData <- csvImport("EPA List.csv")   # Import Base List
# matchData <- xmlImport("Vendors.xml")  # Import Match List

# Address Concatenation Comparison
# baseParsed <- addressParse(baseData) # Parse Base list Addresses
# matchParsed <- addressParse(matchData)  # Parse Match list Addresses
# parsedMatches <- parseMatch(matchParsed, baseParsed) # Perform the concatenation testing

# Geocoding Comparison
# matchGeoCoded <- geoCode(matchData)  # Geocode Match Data
# baseGeoCoded <- geoCode(baseData)  # Geocode Base Data
# geoComplete <- geoCompare(matchGeoCoded, baseGeoCoded)  # Perform haversine comparison

# Result Visualization
# basicPlot(geoComplete) # Basic Plot Visualization
# geoPlot(baseGeoCoded, matchGeoCoded, zoom=5, maptype="satellite") # Satelite Map Visualization
}
