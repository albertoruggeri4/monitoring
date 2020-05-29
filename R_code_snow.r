# Snow cover from copernicus (Cryosphere)

setwd("C:/Lab")


#importing the file taken from Copernicus, but before we need a library(raster)
#and also the library ncdf4 --> Interface to Unidata netCDF(tiff file) -- since most of copernicus data are in this format we need of this library (sometimes is in raster library)

library (raster)

install.packages("ncdf4")
library(ncdf4)

#the warning message is about the fact that we are using a part of total reference system
snowmay <- raster("c_gls_SCE500_202005260000_CEURO_MODIS_V1.0.1_mon.nc")
cl <- colorRampPalette(c('darkblue','blue','light blue'))(100)

plot(snowmay, col=cl)

#if we put the name of the image we can see the n° of px and other information
snowmay

#it huge n°, we can aggregate if we want

#the function aplly can give the possibility to upload files together
#change the new wd
setwd("C:/Lab/snow")

#######for avoid to do the standar process to plot all a
snow2000 <- raster("snow2000r.tif")
snow2005 <- raster("snow2005r.tif")
snow2010 <- raster("snow2010r.tif")
snow2015 <- raster("snow2015r.tif")
snow2020 <- raster("snow2020r.tif")

par(mfrow=c(2,3))
plot(snow2000, col=cl)
plot(snow2005, col=cl)
plot(snow2010, col=cl)
plot(snow2015, col=cl)
plot(snow2020, col=cl)
##########

###   lapply   ###
#create a list of files (function list.files -- the common pattern is snow20)
rlist <- list.files(pattern="snow20")

rlist #for see what you have in your list

#con lappy che praticamente non fa altro che applicare una serie di comandi a tutti gli elementi, la funzione è raster, la lista è rlist
import <- lapply(rlist, raster)

#then we will make a stack of all images (raster stack), different layer all togethere
snow.multitemp <- stack(import)

#now we can simply plot the snow multitemp
plot(snow.multitemp, col=cl)

######the function "PREDICTION" to see the prediction/expected value (depend from if the function is logaritme or linear/ negative or positive)
#look also it from the file in iol

#In this file there are:
#the define the extent
#make a time variable
#run the regression
#normalized the data (because if you use 8 bytes image= 2^8 values [0,255])

source("prediction.r")

plot(predicted.snow.2025.norm, col=cl)

#con la funz raster lo leghiamo al file scaricato nella cartella snow
predicted.snow.2025.norm <- raster("predicted.snow.2025.norm.tif")

plot(predicted.snow.2025.norm, col=cl)

