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

