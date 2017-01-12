#setwd("X:/Claire/shiny/EFHmapTrial")

library(shiny)
library(shinydashboard)
library(highcharter)
library(markdown)
library(data.table)
library(car)
library(shinyBS)
library(leaflet)
library(RColorBrewer)
library(mapview)




############## JF: 10/12/2016

#a <- read.csv("maplayers.csv")
Adult <- "https://api.mapbox.com/styles/v1/claireroberts/cixuhtoo1002t2rnrcn7gtc2t/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiY2xhaXJlcm9iZXJ0cyIsImEiOiJjaWtqdTFyZ3UwOGw2dnRrbTlibDd2OW9yIn0.ccw4vPRr3LiUpAcqyThNig"
EarlyJuve <-"https://api.mapbox.com/styles/v1/claireroberts/cixuej7uv00272rlavr8qu3cj/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiY2xhaXJlcm9iZXJ0cyIsImEiOiJjaWtqdTFyZ3UwOGw2dnRrbTlibDd2OW9yIn0.ccw4vPRr3LiUpAcqyThNig"
LateJuve <- "https://api.mapbox.com/styles/v1/claireroberts/cixue8eow002p2rnrcz19b2go/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiY2xhaXJlcm9iZXJ0cyIsImEiOiJjaWtqdTFyZ3UwOGw2dnRrbTlibDd2OW9yIn0.ccw4vPRr3LiUpAcqyThNig"
SpawningAdult <- "https://api.mapbox.com/styles/v1/claireroberts/cixueovne00282rlau3ucgi2y/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiY2xhaXJlcm9iZXJ0cyIsImEiOiJjaWtqdTFyZ3UwOGw2dnRrbTlibDd2OW9yIn0.ccw4vPRr3LiUpAcqyThNig"

#REDDRUMspawningAdult <-  "https://api.mapbox.com/styles/v1/jfroeschke/ciu703yi500g02inzohq8u5t6/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiamZyb2VzY2hrZSIsImEiOiI5SHgwTWk4In0.J6IfXVALdDraXPBfPcyITg"
#redDrumLateJuvenile <- "https://api.mapbox.com/styles/v1/jfroeschke/ciu741ln000g82jo146xsrn21/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiamZyb2VzY2hrZSIsImEiOiI5SHgwTWk4In0.J6IfXVALdDraXPBfPcyITg"
#REDDRUMadult <- "https://api.mapbox.com/styles/v1/jfroeschke/ciu7a0o0200002jpcl9oc0sqi/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiamZyb2VzY2hrZSIsImEiOiI5SHgwTWk4In0.J6IfXVALdDraXPBfPcyITg"
#REDSNAPPERspawningAdult <- "https://api.mapbox.com/styles/v1/claireroberts/ciuhh70a6000s2imlw05lzaog/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiY2xhaXJlcm9iZXJ0cyIsImEiOiJjaWtqdTFyZ3UwOGw2dnRrbTlibDd2OW9yIn0.ccw4vPRr3LiUpAcqyThNig"
#redSnapperLateJuvenile <- "https://api.mapbox.com/styles/v1/claireroberts/ciuhh3ph6001m2io26uyalgi2/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiY2xhaXJlcm9iZXJ0cyIsImEiOiJjaWtqdTFyZ3UwOGw2dnRrbTlibDd2OW9yIn0.ccw4vPRr3LiUpAcqyThNig"
##red drum juvenile
## color code : E0E30C



##start here: need to add server code for this

## load  others, delete test. For now test linked to red snapper
############ Species Profile ###################################


##  #ffff33  adults color code
##  #a65628  spawning adults
##  #F781BF  eggs
##  #E41A1C  larvae
##  #4DAF4A  postlarvae
##  #984EA3  early juveniles
##  #FF7F00  late juveniles