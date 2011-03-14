geoPlot <-
function(x, y, zoom, maptype){
	noZeros <- x[abs(x[9]) > 0,]
	center <- c(as.double(mean(noZeros[9])), as.double(mean(noZeros[8])))
	if (is.na(zoom)) zoom <- 6
	if (is.na(maptype)) maptype <- "mobile"
	mapTemp <- GetMap(center=center, zoom=zoom, destfile="MapTemp.png", maptype=maptype)
	blat <- x[,9]
	blong <- x[,8]
	PlotOnStaticMap( mapTemp, blat, blong, destfile="GeoPlot.png", 
		zoom=NULL, size=c(640,640), add=FALSE, GRAYSCALE=FALSE, 
		pch=16, col="red")
	mlat <- y[,9]
	mlong <- y[,8]
	GeoPlot <- PlotOnStaticMap( mapTemp, mlat, mlong, destfile="GeoPlot.png", 
		zoom=NULL, size=c(640,640), add=TRUE, GRAYSCALE=FALSE, 
		pch=17, col="blue")
	return(GeoPlot)}

