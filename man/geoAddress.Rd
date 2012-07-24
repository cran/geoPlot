\name{geoAddress}
\alias{geoAddress}
\title{geoAddress}
\description{
Implements a lookup using the Google Maps API to determine latitude & longitude point and box coordinates for a given address.
}
\arguments{
  \item{x}{
x is a list or data frame containing: id, address, city, state/province, postal, country
The id is simply an identifier.  The remaining address elements do not have to be universally populated.  A concatenation of the vector elements occurs but the input specification is only rigid in that id and 4 elements are needed.
}
}
\details{
The GoogleMaps API is used where an address is rendered to a URL in the following format:
PATTERN:  http://maps.google.com/maps/geo?q=address+city+state+zip+country&output=xml&key=$key
EXAMPLE:  http://maps.google.com/maps/geo?q=202+South+Central+Avenue+Flagler+Beach+FL+32136+US&output=xml&key=$key
The output is a web page containing the XML document with the data fields which are then ingested.
For geocoding a single address:  geoAddress(c("001","202 South Central Avenue","Flagler Beach","FL","32136","US"))
For geocoding a list containing a single address: 
x <- c("001","202 South Central Avenue","Flagler Beach","FL","32136","US")
geoAddress(x)
For geocoding a list of addresses, use addrListLookup.

}
\value{
The returned value is a list containing the following elements:
id, address, latitude (point coordinate), longitude (point coordinate), north box coordinate, south box coordinate, east box coordinate, west box coordinate.
EXAMPLE:
   id                                         address latitude longitude box_north box_south  box_east  box_west
1 001 202 South Central Avenue Flagler Beach FL 32136 29.47987 -81.12809  29.48122  29.47852 -81.12675 -81.12944
\item{id}{User defined identifier.  This can be arbitrary}
\item{address}{Concatenated address data.}
\item{latitude}{Point coordinate - latitude.}
\item{longitude}{Point coordinate - longitude.}
\item{box_north}{Box coordinate - North.}
\item{box_south}{Box coordinate - South.}
\item{box_east}{Box coordinate - East.}
\item{box_west}{Box coordinate - West.}
}
\references{
  In this instance, this is the address of a great coffee shop named 'Beach House Beanery' in Flagler Beach, Florida, USA.
}
\author{
Randall Shane, PhD
rshane@basexvi.com
}
\seealso{\code{\link{addrListLookup}},
         \code{\link{geoPlot}}}
\examples{
#geoAddress(c("001","202 South Central Avenue","Flagler Beach","FL","32136","US"))
#x <- c("001","202 South Central Avenue","Flagler Beach","FL","32136","US")
#geoAddress(x)

## The function is currently defined as
function (x) 
{
    y <- data.frame(t(rep(NA, 8)))
    y <- y[-1, ]
    colnames(y) <- c("id", "address", "latitude", "longitude", 
        "box_north", "box_south", "box_east", "box_west")
    temp00 <- data.frame(lapply(x[2:5], as.character), stringsAsFactors = FALSE)
    y[1, 1] <- temp00[1]
    temp01 <- paste("http://maps.google.com/maps/geo?q=", paste(gsub(" ", 
        "+", temp00), collapse = "+"), "&output=xml&key=$key", 
        sep = "", collapse = NULL)
    y[1, 2] <- paste(temp00, collapse = " ")
    temp02 <- readLines(temp01)
    temp03 <- grep("coordinates", temp02)[1]
    temp04 <- substr(temp02[temp03], 25, 47)
    if (!is.na(temp04[1])) 
        temp05 <- temp04[1]
    else temp05 <- "0,0"
    temp06 <- strsplit(temp05, ",")
    temp07 <- grep("LatLonBox", temp02)[1]
    temp08 <- gsub("\"", "", as.character(temp02[temp07]))
    temp09 <- unlist(strsplit(as.character(temp08), " "))
    if (!is.na(as.double(unlist(strsplit(as.character(temp06), 
        "\""))[4]))) {
        lat <- as.double(unlist(strsplit(as.character(temp06), 
            "\""))[4])
    }
    else {
        lat <- 0
    }
    y[1, 3] <- lat
    if (!is.na(as.double(unlist(strsplit(as.character(temp06), 
        "\""))[2]))) {
        long <- as.double(unlist(strsplit(as.character(temp06), 
            "\""))[2])
    }
    else {
        long <- 0
    }
    y[1, 4] <- long
    if (!is.na(as.double(unlist(strsplit(as.character(temp09[8]), 
        "="))[2]))) {
        box_north <- as.double(unlist(strsplit(as.character(temp09[8]), 
            "="))[2])
    }
    else {
        box_north <- 0
    }
    y[1, 5] <- box_north
    if (!is.na(as.double(unlist(strsplit(as.character(temp09[9]), 
        "="))[2]))) {
        box_south <- as.double(unlist(strsplit(as.character(temp09[9]), 
            "="))[2])
    }
    else {
        box_south = 0
    }
    y[1, 6] <- box_south
    if (!is.na(as.double(unlist(strsplit(as.character(temp09[10]), 
        "="))[2]))) {
        box_east <- as.double(unlist(strsplit(as.character(temp09[10]), 
            "="))[2])
    }
    else {
        box_east <- 0
    }
    y[1, 7] <- box_east
    if (!is.na(as.double(unlist(strsplit(as.character(temp09[11]), 
        "="))[2]))) {
        box_west <- as.double(unlist(strsplit(as.character(temp09[11]), 
            "="))[2])
    }
    else {
        box_west <- 0
    }
    y[1, 8] <- box_west
    return(y)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{address}
\keyword{geoAddress}
\keyword{geoCode}
\keyword{geoPlot}

