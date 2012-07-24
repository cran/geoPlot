ipListLookup <-
function(x){
  y <- data.frame(t(rep(NA,11)))
  y <- y[-1,]
  colnames(y) <- c("ipAddress","statusCode","latitude","longitude","statusMessage","countryCode","countryName","regionName","cityName","zipCode","timeZone")
  for (i in 1:nrow(x)) {
    input <- x[i,]
    y <- rbind(y,geoIP(input))}
  return(y)}
