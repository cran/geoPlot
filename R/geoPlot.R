geoPlot <-
function(x, zoom=6, maptype="mobile", color="red"){
    temp01 <- x[abs(x[3]) > 0,]
    center <- c(sapply(temp01[3],mean), sapply(temp01[4],mean))
    library(RgoogleMaps)
    mapTemp <- GetMap.bbox(latR=center[1], lonR=center[2], zoom=zoom, destfile="MapTemp.png", maptype=maptype)
    PlotOnStaticMap( mapTemp, lat=temp01[,3], lon=temp01[,4], destfile="GeoPlot.png", 
                     zoom=NULL, size=c(640,640), add=FALSE, GRAYSCALE=FALSE, 
                     pch=16, col=color)}
