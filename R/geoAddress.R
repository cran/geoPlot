geoAddress <-
function(x) {
    y <- data.frame(t(rep(NA,4)))
    y <- y[-1,]
    colnames(y) <- c("id","address","latitude","longitude")
    temp00 <- data.frame(lapply(x[2:6],as.character), stringsAsFactors=FALSE)
    y[1,1] <- x[1]
    temp01 <- paste("http://maps.googleapis.com/maps/api/geocode/xml?address=",
                    paste(gsub(" ","+",temp00),collapse="+"),
                    "&sensor=false", sep="", collapse=NULL)
    y[1,2] <- paste(temp00,collapse=" ")
    library(XML)
    options(warn = (-1))
    temp02 <- xmlTreeParse(readLines(temp01), getDTD = FALSE)
    temp03 <- xmlRoot(temp02)
    temp04 <- temp03[[2]][["geometry"]][["location"]]
    resp <- xmlSApply(temp03[1][["status"]], xmlValue)
    if (resp=='OK'){
      tmplat <- xmlSApply(temp04, xmlValue)[1] # latitude
      tmplong <- xmlSApply(temp04, xmlValue)[2]  # longitude
    } else { 
      tmplat <- 0 
      tmplong <- 0}
    if(!is.na(unlist( tmplat))){
      y[1,3] <- as.double(unlist( tmplat))
    } else { lat <- 0 }
    if(!is.na(unlist( tmplong))){
      y[1,4] <- as.double(unlist( tmplong))
    } else { long <- 0 }
    return(y)}
