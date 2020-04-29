#R code to view biomass over the world and calculate changes in ecosystem functions
#energy
#chemical cyclig
#proxies

#we'll use the packages rastediv (all data based on pixel). On google you can find all funcionts ofthis package

install.packages("rasterdiv")

install.packages("rasterVis")
#Vis= visualization and div= diversity
library(rasterVis)
library(rasterdiv)

data(copNDVI)
plot(copNDVI)

#how to eliminate data from 253-255/reclassify NDVI.  253-254-255 water data ==NA
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

levelplot(copNDVI)

#test with different resolution-- function is aggregate -- you will see a smooth effect
copNDVI10 <- aggregate(copNDVI, fact=10)
levelplot(copNDVI10)

copNDVI100 <- aggregate(copNDVI, fact=100)
levelplot(copNDVI100)

setwd("C:/Lab")
library(raster)

#function brick --> to bring something from outside
defor1 <- brick("defor1_.jpg")
defor2 <- brick("defor2_.jpg")

#if we put the name we have the info( in particolur of the band)
#Band1: NIR
#Band2: R
#Band3: G
#we change the band and add the blue band -- strecht lin
plotRGB(defor1, r=1, g=2, b=3, sttech="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
 
par(mfrow=c(1,2)) 
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
 
#calculation of dvi --> difference beetween NIR - RED
#$ link different part of R
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2
dvi2 <- defor2$defor2_.1 - defor2$defor2_.2

# specifying a color scheme
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 

par(mfrow=c(1,2)) 
plot(dvi1, col=cl)
plot(dvi2, col=cl)

difdvi <- dvi1 - dvi2
#the error about the extension you can avoid in this way
dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100)

#histogram
hist(difdvi)
