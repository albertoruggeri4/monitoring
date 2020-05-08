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

