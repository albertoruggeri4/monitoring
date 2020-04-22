#R code remote sensing

setwd("C:/Lab")

library(raster)

#import the images (the function brick)
p224r63_2011 <- brick("p224r63_2011_masked.grd")

plot(p224r63_2011)

cl <- colorRampPalette(c("black","grey","light grey"))(100)

plot(p224r63_2011, col= cl)

#band of Landsat - B1:Blue; B2:green; B3: red; B4: NIR

#multiframe of different plots ("c" for series of character)
#questa sarebbe la disposizione spaziale dei grafici, 2 righe e 2 colonne
par(mfrow=c(2,2))

#for check color of R put "color()" and you can check-- $ symbol to link
#B1:Blue
clb <- colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(p224r63_2011$B1_sre, col=clb)

#B2: Green
clg <- colorRampPalette(c("dark green", "green", "light green"))(100)
plot(p224r63_2011$B2_sre, col=clg)

#B3: red
clr <- colorRampPalette(c('dark red','red','pink'))(100) 
plot(p224r63_2011$B3_sre, col=clr)

#B4: NIR
cln <- colorRampPalette(c('red','orange','yellow'))(100) 
plot(p224r63_2011$B4_sre, col=cln)


#RGB --red band number 3, etc from the assignement of before -stretch =(stiratura, tipo dal dark al light) lineare
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

#if we want to remove the blue, and make the NIR-RED-GREEN
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
#the white is an open area

#the NIR on top of the G component
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
#or
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
