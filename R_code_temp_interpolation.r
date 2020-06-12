#### data of measurement of different chimical compost of soil and different vegetation of the same soil

#Spatial statistics
#Interpolation only spatial and of the species distribution modelling

#"How much dense the point are in this area?"

setwd("C:/Lab")

library(spatstat) #estimate the density of the plot

inp <- read.table("dati_plot55_LAST3.csv", sep=";", head=T)

#Casentino Forest (beech forest)
head(inp)

attach(inp) #it's the same with plot(inp$X,inp$Y)
#distribution of the point
plot(X,Y)

#planar point pattern(ppp) == explain what is the X and Y and their range
#to know the min e max (range)
summary(inp)

ppp(x=X, y=Y, c(716000,718000),c(4859000,4861000))

#marks function to analyze each values
inppp <- ppp(x=X, y=Y, c(716000,718000),c(4859000,4861000))
names(inppp) #to see wich variables we want
marks(inppp) <- Canopy.cov

#function smooth (spatstat library) to smooth the set -- interpolate
canopy <- Smooth(inppp)
plot(canopy) 
points(inppp, col="green")
#the density in the nord are lower instead the density of the south part
#we can make this maps for different variables to see the correlation

# lichens -- tree -- airpollution
marks(inppp) <- cop.lich.mean
lichs <- Smooth(inppp)
plot(lichs)
points(inppp)

#There is no congruent between canopy and lich
#we can make a par(mfrow) or a stack --> more elegant

#output <- stack(canopy, lichs)
#plot(output)

par(mfrow=c(1,2))
plot(canopy)
points(inppp)
plot(lichs)
points(inppp)

#final plot (original name)
plot(Canopy.cov, cop.lich.mean, col="red", pch=19, cex=2)
#spatial correlation
