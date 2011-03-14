\name{csvImport}
\alias{csvImport}
\title{CSV File Import}
\description{
  This function imports csv formatted address files for the geoPlot
  package.  The files MUST be in the following format:
  -comma separated value
  -header row present
  -data structure: id, Address, City, State/Prov, Postal
}
\usage{
csvImport(csvfile)
}
\arguments{
  \item{csvfile}{name of the csv file to import}
}
\details{
  NOTE:  Data must be in the following format:
  -comma separated value
  -header row present
  -data structure: id, Address, City, State/Prov, Postal
}
\value{
  This function will return a data frame for use with this
  package with the following columns:
  id, address, city, stateprov, postal}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}

\examples{
# The example below is commented out but will run with the csv file in the working directory.
# This csv file is included in the data directory
# baseData <- csvImport("EPA List.csv")


## The function is currently defined as
function( csvfile) {  
interim <- read.table(csvfile, header=TRUE, sep=",", na.strings=TRUE)
colnames(interim)[1] <- "id"
colnames(interim)[2] <- "address"
colnames(interim)[3] <- "city"
colnames(interim)[4] <- "stateprov"
colnames(interim)[5] <- "postal"
csvData <<- interim
return( csvData)
  }
}
\keyword{import}
\keyword{csv}
