\name{baseData}
\alias{baseData}
\docType{data}
\title{Loaded CSV Data Set}
\description{
	This is the 'EPA List.csv' file loaded by csvImport.
}
\usage{data(baseData)}
\format{
  A data frame with 1146 observations on the following 5 variables.
  \describe{
    \item{\code{id}}{a unique key field for the user's use}
    \item{\code{address}}{Address data}
    \item{\code{city}}{City Data}
    \item{\code{stateprov}}{State or Province}
    \item{\code{postal}}{Postal Code}
  }
}
\details{}
\source{
}
\references{
	This is an excerpt from the Environmental Protection Agency's known contamination listing.
}
\examples{
data(baseData)
## maybe str(baseData) ; plot(baseData) ...
}
\keyword{datasets}
