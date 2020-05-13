# R_code_radiance.r

library(raster)

#make a new raster with 2 row and coloun and coordinates from 1 to 2
toy <- raster(ncol=2, nrow=2, xmn=1, xmx=2, ymn=1, ymx=2)

#give values to all cell of the raster (1.1-1.2-2.1-2.2)
values(toy) <- c(1.13,1.44,1.55,3.4)

plot(toy)
text(toy, digits=2)

#change the value of the raster [2^nbit] and range[0,3] with the function stretch we modify the sixe
toy2bits <- stretch(toy,minv=0,maxv=3)

#for avoid the decimal
storage.mode(toy2bits[]) = "integer"

#range[0,15] 
toy4bits <- stretch(toy,minv=0,maxv=15)

storage.mode(toy4bits[]) = "integer"

plot(toy4bits)
text(toy4bits, digits=2)
#the number inside the pixel is the radiance (how much it riflectance)


#8 bit
toy8bits <- stretch(toy,minv=0,maxv=255)

#it put to be sure that we use integer number (also if probably stretch do the same by default)
storage.mode(toy8bits[]) = "integer"

plot(toy8bits)
text(toy8bits, digits=2)

#you can see the different value. Color is the same, but the value is different
#our starting value was 1.13, 1.44, 1.55, 3.4

#put toghethere all graphics
par(mfrow=c(1,4))

plot(toy)
text(toy, digits=2)
 

plot(toy2bits)
text(toy2bits, digits=2)

 

plot(toy4bits)
text(toy4bits, digits=2)

 

plot(toy8bits)
text(toy8bits, digits=2)


# you cans see that our image is 8bit, a lot of copernicus images are in 8 bit or 16 bit
dev.off()
library(rasterdiv)
plot(copNDVI)

copNDVI
