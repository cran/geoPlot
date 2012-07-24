geoAddress <-
function(x) {
  y <- data.frame(t(rep(NA,8)))
  y <- y[-1,]
  colnames(y) <- c("id","address","latitude","longitude","box_north","box_south","box_east","box_west")
  temp00 <- data.frame(lapply(x[2:5],as.character), stringsAsFactors=FALSE)
  y[1,1] <- x[1]
  temp01 <- paste("http://maps.google.com/maps/geo?q=",
                  paste(gsub(" ","+",temp00),collapse="+"),
                  "&output=xml&key=$key", sep="", collapse=NULL)
  y[1,2] <- paste(temp00,collapse=" ")
  temp02 <- readLines(temp01)
  temp03 <- grep("coordinates", temp02)[1]
  temp04 <- substr( temp02[temp03], 25, 47)
  if(!is.na(temp04[1])) temp05 <- temp04[1] else temp05 <- "0,0"
  temp06 <- strsplit(temp05, ",")
  temp07 <- grep("LatLonBox",temp02)[1]
  temp08 <- gsub('"','',as.character(temp02[temp07]))
  temp09 <- unlist(strsplit(as.character(temp08)," "))  
  if(!is.na(as.double(unlist( strsplit(as.character(temp06), "\""))[4]))){
    lat <- as.double(unlist( strsplit(as.character(temp06), "\""))[4])
  } else { lat <- 0 }
  y[1,3] <- lat  
  if(!is.na(as.double(unlist( strsplit(as.character(temp06), "\""))[2]))){
    long <- as.double(unlist( strsplit(as.character(temp06), "\""))[2])
  } else { long <- 0 }
  y[1,4] <- long
  if(!is.na(as.double(unlist( strsplit(as.character(temp09[8]), "="))[2]))){
    box_north <- as.double(unlist( strsplit(as.character(temp09[8]), "="))[2])
  } else { box_north <- 0}
  y[1,5] <- box_north
  if(!is.na(as.double(unlist( strsplit(as.character(temp09[9]), "="))[2]))){
    box_south <- as.double(unlist( strsplit(as.character(temp09[9]), "="))[2])
  } else { box_south = 0 }
  y[1,6] <- box_south
  if(!is.na(as.double(unlist( strsplit(as.character(temp09[10]), "="))[2]))){
    box_east <- as.double(unlist( strsplit(as.character(temp09[10]), "="))[2])
  } else { box_east <- 0 }
  y[1,7] <- box_east
  if(!is.na(as.double(unlist( strsplit(as.character(temp09[11]), "="))[2]))){
    box_west <- as.double(unlist( strsplit(as.character(temp09[11]), "="))[2])
  } else {box_west <- 0 }
  y[1,8] <- box_west
  return(y)}
