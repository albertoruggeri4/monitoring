 #Sentinel image about no2 before and after covid in Italy
 
 setwd("C:/Lab")

library (raster)
library(ncdf4)


###   lapply   ###
#create a list of files (function list.files -- the common pattern is snow20)
rlist <- list.files(pattern="EN")

rlist #for see what you have in your list

#con lappy che praticamente non fa altro che applicare una serie di comandi a tutti gli elementi, la funzione è raster, la lista è rlist
import <- lapply(rlist, raster)
#with the raster function i take only one band! The original files are RGB. The value is correlated to px value 0-255 

#then we will make a stack of all images (raster stack), different layer all togethere
EN <- stack(import)

#now we can simply plot the no2 multitemp
cl <- colorRampPalette(c('darkblue','light blue','yellow','orange','red'))(100)
plot(EN, col=cl)

 
#if we want to plot only two month (Jan - March)
par(mfrow=c(1,2))
plot(EN$EN_0001, col=cl)
plot(EN$EN_0013, col=cl)

#NOW, we try to play with the use of different bands RGB
#numbers=images --> blue=march -- in Lombardia RED quadrant = high decrease of NO2
plotRGB(EN, r=1, g=7, b=13, stretch= "lin")

#difference map
dif <- EN$EN_0013 - EN$EN_0001
cld <- colorRampPalette(c('blue','white','red'))(100) #red=high difference
plot(dif, col=cld)

#### box plot #####
#  https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/boxplot
###statistical analysis with "box plot" (moda, media, mediana)
boxplot(EN) 
#horizontal boxplot
boxplot(EN, horizontal=TRUE)
#outlayer removed
boxplot(EN, horizontal=TRUE,outline=F)

#from the first to the top image there is a negative sponencial degrees about NO2
#NOT IN THE MEDIAN VALUES, BUT IN THE MAXIMUN VALUE

#if there is a decrease the most of data are under the degression line
#the idea is that value of one images on Y and the other one on X
plot(EN$EN_0001, EN$EN_0013)
#function abline ---> degression line y=a+bx a= 0 (we start from 0,0)
abline(0, 1, col='red')

######### 1:1 line with snow data #######

setwd("C:/Lab/snow/")
 
rlist <- list.files(pattern="snow20")
rlist

import <- lapply(rlist, raster) 
snow.multitemp <- stack(import)

plot(snow.multitemp)

plot(snow.multitemp$snow2010r,snow.multitemp$snow2020r)
abline(0,1, col='red')
#most of the maximum data are also under the line

plot(snow.multitemp$snow2000r,snow.multitemp$snow2020r)
#if you have high value of snow cover(100) you are under the line == decrease
