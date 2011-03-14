\name{xmlImport}
\alias{xmlImport}
\title{XML Address Data Import}
\description{
  This function imports xml formatted address files for the geoPlot
  package.  This function requires the XML library.
  The files MUST be in the following format:
   <RECORD>
      <Key>key field</Key>
      <StAddress>address data</StAddress>
      <City>city name</City>
      <State>state or province</State>
      <ZipCode>postal code</ZipCode>
   </RECORD>
}
\usage{
xmlImport(xmlfile)
}
\arguments{
  \item{xmlfile}{name of the XML file to import}
}
\details{
  NOTE:  The XML library is required and the XML file must be
  configured with the following nodes.
     <RECORD>
      <Key>key field</Key>
      <StAddress>address data</StAddress>
      <City>city name</City>
      <State>state or province</State>
      <ZipCode>postal code</ZipCode>
   </RECORD>
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
\seealso{}
\examples{# The example below is commented out but will run with the xml file in the working directory.
# This xml file is included in the data directory
# matchData <- xmlImport("Vendors.xml")

## The function is currently defined as
function( xmlfile) {
tempXML1 <- xmlTreeParse(xmlfile, trim=TRUE) 
tempXML2 <- xmlRoot(tempXML1)
tempSize <- xmlSize(tempXML2)
id <- c(1:tempSize)
address <- c(1:tempSize)
city <- c(1:tempSize)
stateprov <- c(1:tempSize)
postal <- c(1:tempSize)
tempXML3 <- data.frame(id, address, city, stateprov, postal)
i <- 1
while (i <= tempSize) {
tempXML3[i,1] <- xmlValue(tempXML2[[i]] [[1]])
tempXML3[i,2] <- xmlValue(tempXML2[[i]] [[2]])
tempXML3[i,3] <- xmlValue(tempXML2[[i]] [[3]])
tempXML3[i,4] <- xmlValue(tempXML2[[i]] [[4]])
tempXML3[i,5] <- xmlValue(tempXML2[[i]] [[5]])
i <- i + 1
  }
xmlData <<- tempXML3
return( xmlData) }
}
\keyword{import}
\keyword{xml}
