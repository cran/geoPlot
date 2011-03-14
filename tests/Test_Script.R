# geoPlot Testing Script
# Randall Shane, PhD
# rshane@basexvi.com
# 15 March 2011

# This testing script executes the geoPlot package methodology 
# and requires 2 sample data files as follows:
# 1) EPA_List.csv  List of known possible contamination sites
# 2) Vendors.xml   List of potential vendors to check against the list

# Environment Section
#setwd("~/R_Working")  # Windows
#setwd("~/R_Working")  # Mac
#install.packages("XML", dependencies=TRUE)
#install.packages("RgoogleMaps", dependencies=TRUE)
#install.packages("geoPlot", dependencies=TRUE)


# Import Testing
library("geoPlot")
baseData <- csvImport("EPA_List.csv")
library("XML")
matchData <- xmlImport("Vendors.xml")


#save(baseData, file="baseData.rda")
#save(matchData, file="matchData.rda")
#load("baseData.rda")
#load("matchData.rda")



# Geocoding Section
matchGeoCoded <- geoCode(matchData)
baseGeoCoded <- geoCode(baseData)
geoComplete <- geoCompare(matchGeoCoded, baseGeoCoded)


#save(baseGeoCoded, file="baseGeoCoded.rda")
#save(matchGeoCoded, file="matchGeoCoded.rda")
#save(geoComplete, file="geoComplete.rda")
#load("baseGeoCoded.rda")
#load("matchGeoCoded.rda")
#load("geoComplete.rda")



# Visualization Section
# NOTE: The geoPlot function section is commented out due to an error in the 
# rgdal package in OSX and Unix.  It runs in windows (ugh, i know...)

#library("RgoogleMaps")
#geoPlot(baseGeoCoded, matchGeoCoded, zoom=4, maptype="mobile")
#geoPlot(baseGeoCoded, matchGeoCoded, zoom=5, maptype="satellite")
basicPlot(geoComplete)




# Address Parsing Section
baseParsed <- addressParse(baseData)
matchParsed <- addressParse(matchData)
parsedMatches <- parseMatch(matchParsed, baseParsed)

#save(baseParsed, file="baseParsed.rda")
#save(matchParsed, file="matchParsed.rda")
#load("baseParsed.rda")
#load("matchParsed.rda")



