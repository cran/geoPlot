\name{addrListLookup}
\alias{addrListLookup}
\title{addrListLookup}
\description{
This function runs a list through the geoAddress function for geocoding.
}
\usage{
addrListLookup(x)
}
\arguments{
  \item{x}{A data frame containing: id, address, city, state/province, postal and country.  The id is simply an identifier.  The remaining address elements do not have to be universally populated.  A concatenation of the vector elements occurs but the input specification is only rigid in that an id field and 4 elements are needed.
}
}
\value{
The returned value is a data frame containing the elements: id, address, latitude, longitude (both point coordinates).
\item{id}{User defined identifier.  This can be arbitrary}
\item{address}{Concatenated address data.}
\item{latitude}{latitude}
\item{longitude}{longitude}
}
\author{
Randall Shane, PhD\cr
rshane@basexvi.com
}
\seealso{\code{\link{geoAddress}},
         \code{\link{geoPlot}}}
\examples{
id <- c('96600016','96600021','96600022','96600025','96600026')
address <- c('537 LINDEN AVENUE','4163 KENWOOD PLACE',
      '4670 POINTE LANE','4077 MARIGOLD LANE','193 MULBERRY LANE')
city <- c('ORLANDO','JUPITER','POMPANO BEACH','MIAMI','JUPITER')
stateprov <- c('FL','FL','FL','FL','FL')
postal <- c('32805','33478','33060','33179','33458')
country <- c('US','US','US','US','US')
x <- data.frame(id,address,city,stateprov,postal,country)
addrListLookup(x)
}
\keyword{address}
\keyword{geoAddress}