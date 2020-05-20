#how to look at chemical cycles from satellites

setwd("C:/Lab")

library(raster)
library(rasterVis)
library(rasterdiv)

plot(copNDVI)

#for remove water
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

#level plot telling us the level of NDVI around the world
levelplot(copNDVI)



faPAR10 <- raster("faPAR10.tif")

#in this case you will see that faPAR is not high  like the ndvi because you are considering the real power of plant to take CO2 and taken the light
#taking light = taking carbon
#in the conifer the sun is going to go into the soil, not all in to the plant while in the pluvial forest you have plants all toghethere. You can do the analysis about that

levelplot(faPAR10)

#how to save in pdf
pdf("copNDVI.pdf")
levelplot(copNDVI)
dev.off()


pdf("faPAR10.pdf")
levelplot(faPAR10)
dev.off()

########################## part 2

setwd("C:/Lab")

load("faPAR.RDATA")
ls()
#the original faPAR from copernicui is 2GB, let's see how much space is needed


library(raster)
library(rasterdiv)
library(rasterVis)

#for see the range of the file [0-252]
copNDVI

#to write a raster in our computer
writeRaster(copNDVI, "copNDVI.tif")
#5.3MB

#faPar levelplot -- faPAR is the fraction of the solar radiation absorbed by live leaves for the photosyntesis activity
faPAR10 <- raster("faPAR10.tif")

levelplot(faPAR10) 

##### regression model between faPAR and NDVI

#correlation in linear model
#PAR and NDVI
erosion <- c(12, 14, 16, 24, 26, 40, 55, 67)
hm <- c(30, 100, 150, 200, 260, 340, 460, 600)

plot(erosion, hm, col='red', pch=19, xlab='erosion',ylab="heavy metals", cex=2)

#function lm
model1 <- lm(hm ~ erosion)

#for know the information
summary(model1)

#coefficient of .. R-square...  ~1 --> coorelation 0 --> no correlation
#p-value = ??
#y=b=bx+a   a=intercept b= 
#the function is abline
abline(model1)

#the same with faPAR and NDVI

library(raster)
library(rasterdiv) #for plot copNDVI

setwd("C:/Lab")
faPAR10 <- raster("faPAR10.tif")
plot(faPAR10)
plot(copNDVI)

#remove value correlated to water
copNDVI <- reclassify(copNDVI, cbind(253:255, NA), right=TRUE)

#let see how many cell there is in the raster, put the name
faPAR10 #check ncell

#with the library sf and the function of random.points we canr reduce the ncell
library(sf) # to call st_* functions


#the n is the number of the points / x = the argumetn
random.points <- function(x,n)
{
lin <- rasterToContour(is.na(x))
pol <- as(st_union(st_polygonize(st_as_sf(lin))), 'Spatial') # st_union to dissolve geometries
pts <- spsample(pol[1,], n, type = 'random')
}

#example, selecting from faPAR10 1000 random points
pts <- random.points(faPAR10,1000)

#extract is the function to extract the point, argument,

copNDVIp <- extract(copNDVI, pts)

#the same for faPAR

faPAR10p <- extract(faPAR10,pts)

#if you put the name of the file you can see the points, NA is same missmatching


#photosynthesis vs. biomss
model2 <- lm(faPAR1P ~ copNDVIp)
summary(model2)
#you can see that R square is about 0.4 == there isn't correlation 

plot(copNDVIp, faPAR10p, col='green', xlab='biomass', ylab='photosynthesis')
abline(model2, col='red')

#there are a lot of point far from the line ,because there isn't correlation about photosynthesis and biomass
#check with levelplot (copNDVI and faPAR10 ..library(rastervis) taìhat we did the last time,  for explain this uncorrelation
