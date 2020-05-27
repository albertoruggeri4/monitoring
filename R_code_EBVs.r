#Essential Biodiversity Variations

#image aggregate 10 px by 10 for be suitable for our exercitation


setwd("C:/Lab")

library(raster)

brick("snt_r10.tif")

snt <- brick("snt_r10.tif")

plot(snt)

#R3 G2 B1
plotRGB (snt, 3,2,1, stretch="lin")

plotRGB(snt,4,3,2, stretch="lin")

#the correlation above each band
pairs(snt)

###analysis of PCA
library(RStoolbox)

sntpca <- rasterPCA(snt)

#you can see std dv
summary(sntpca$model)

plot(sntpca$map)

#plotRGB and the first 3 component
plotRGB(sntpca$map, 1, 2, 3, stretch="lin")


#set the moving window (selected the area of the px to calculate)
window <- matrix(1, nrow=5, ncol =5)

#focal function R (check on documentation) - PC1 checked on summary that it is the first component from the map - w = window and fun= function
sd_snt <- focal(sntpca$map$PC1, w=window, fun=sd)

#make a nice color Ramp Palette
cl <- colorRampPalette(c('dark blue','green','orange','red'))(100) # 
plot(sd_snt, col=cl)


par(mfrow=c(1,2))
plotRGB(snt,4,3,2, stretch="lin", main="original image") 
plot(sd_snt, col=cl, main="diversity")
#It's not possible to give title to raster image 

###### PART 2 #######

# Cladonia stellaris

setwd("C:/Lab")

library(raster)

#for import the image we have two function raster (only one band) - brick(several bands in the same time (RGB))
clad <-- brick("cladonia_stellaris_calaita.JPG")

#the second argument is about the bands 
plotRGB(clad, 1,2,3, strecht="lin")

#we select a window to calculate the standar deviation, function matrix for the cut
#the first number is an arbitrair number, is not important (is the number that we see in the temporaney matrix. 
window <- matrix(1, nrow = 3, ncol = 3)
window

#function focal (check on documentation) -- calculate values for the neighboords of focal cells
#look the correlation with pairs
pairs(clad)
#make the same code of PCA here

library(RStoolbox)

cladpca <- rasterPCA(clad)

cladpca #for the information of the file

#see how much information from the first PCA (PC1)

#you can see std dv for each component
summary(cladpca$model)
#the first component have the 98% of information how you can see( 0.98...)

plotRGB(cladpca$map, 1, 2, 3, stretch="lin")
#you can see the red that is the snow, brown cladonia, green plants
#characteristic that previously was difficult to see

#moving window is what we have created before
#fun = function sd= standard deviation
#inside cladPCA there is the map that have three different component PC1 PC2 PC3
sd_clad <- focal(cladpca$map$PC1, w=window, fun= sd)

#for accelerate the calculate -- we can aggregate
PC1_agg <- aggregate(cladpca$map$PC1, fact=10)
sd_clad_agg <- focal(PC1_agg, w=window, fun=sd)

 par(mfrow=c(1,2))
cl <- colorRampPalette(c('yellow','violet','black'))(100)
plot(sd_clad, col=cl)
plot(sd_clad_agg, col=cl)
#we can see the standar deviation in these two plot

# plot the calculation  and see the difference with the original image
par(mfrow=c(1,2))
cl <- colorRampPalette(c('yellow','violet','black'))(100) #
plotRGB(clad, 1,2,3, stretch="lin")
plot(sd_clad, col=cl)
# plot(sd_clad_agg, col=cl)
