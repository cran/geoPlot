# geoPlot Test Script
# dev by Randall Shane, PhD
# rshane@basexvi.com
# 24 July 2012

rm(list= ls(all=TRUE))
# install.packages("geoPlot",dependencies=TRUE)
library(geoPlot)

#To geocode and plot a single address:
x <- geoAddress(c("001","202 South Central Avenue","Flagler Beach","FL","32136","US"))
geoPlot(x)

#To geocode and plot a list of addresses:
load("addresses.rda")
geoAddresses <- addrListLookup(head(addresses))
#geoPlot(geoAddresses)
geoPlot(geoAddresses,zoom=6,maptype="mobile",color= "red")
#geoPlot(geoAddresses,zoom=7,maptype="terrain",color="orange")
#geoPlot(geoAddresses,zoom=5,maptype="satellite",color="yellow")
#geoPlot(geoAddresses,zoom=6,maptype="hybrid")

#To geocode and plot a single ip address:
y <- geoIP("38.122.8.198")
geoPlot(y)

#To geocode and plot a list of ip addresses:
load("ips.rda")
geoIPs <- ipListLookup(head(ips))
geoPlot(geoIPs,zoom=3,maptype="roadmap",color="blue")
#geoPlot(geoIPs,zoom=1,maptype="mapmaker-roadmap",color="green")
#geoPlot(geoIPs,zoom=2,maptype="mapmaker-hybrid",color="purple")


#To determine the distance between 2 points:
haversine("28.54703","-81.30292","26.93422","-80.09421")

#To determine the distance between 2 points resolved above:
haversine(geoAddresses[1,3],geoAddresses[1,4],geoAddresses[2,3],geoAddresses[2,4])
haversine(geoIPs[1,3],geoIPs[1,4],geoIPs[2,3],geoIPs[2,4])
