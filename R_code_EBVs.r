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
