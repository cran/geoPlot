\name{basicPlot}
\alias{basicPlot}
\title{Performs Basic Plotting of Results}
\description{
	This function performs basic plotting of results from the geoCompare function.
}
\usage{
basicPlot(x)
}
\arguments{
  \item{x}{This is the result of the geoCompare Function}
}
\details{}
\value{
	A basic plot is produced
}
\references{}
\author{
  Randall Shane, PhD \email{rshane@basexvi.com}
}
\note{}
\examples{

basicPlot(geoComplete)


## The function is currently defined as
function(x){
n <- x[abs(x[9]) > 0,]
bmnla = min(n$Base_latitude)
bmxla = max(n$Base_latitude)
bmnlo = min(n$Base_longitude)
bmxlo = max(n$Base_longitude)
plot(c(n$Base_latitude, n$Base_longitude), c(n$Match_latitude, n$Match_longitude),
xlim=c(bmnla, bmxla), ylim=c(bmnlo, bmxlo), 
xlab="Latitude", ylab="Longitude", type="n", main="Geo Output Chart Comparison")
points(n$Base_latitude, n$Base_longitude, col="red", pch=16)
points(n$Match_latitude, n$Match_longitude, col="blue", pch=17)}
}

\keyword{plot}

