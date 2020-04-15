#R code for multivariate analysis

#Here you can check the information about packages "vegan"
#https://cran.r-project.org/web/packages/vegan/index.html

setwd("C:/Lab/")

library(vegan)

#if you download the data from iol byomes and types you can check the plot(types) and individual(byomes)

#name of dataset, and give a name, then read.table for import a data from outside
#then tha name of dataset, header for the title and sep for the separation
biomes <- read.table("biomes.csv", header=T,sep=",")

head(biomes)

#DEtrended CORrespondence ANAlysis (see them in only two dimension.
multivar <- decorana(biomes)
plot(multivar)

#put the name multivar you can see the value analysis, the dimension
#0.5117 is like 52% and also for the other, and if in the our graphic
#with two axis we can see the 82%
#also remember if the species are near, probably the are in the same bioma
multivar

#to see the species of the same bioma. From the biomas_types.csv we want to plot the variable of the same bioma
biomes_types <- read.table("biomes_types.csv", header=T,sep=",")

head(biomes_types)

#the colon of the next function come from this dataset
attach(biomes_types) 
#ordierellipse is the function. We will draw an ellipse tha connect all point of a certain biomes

#data from multivar, type = the colon that we want/ the col = color we can call also with the number or col= c("green","blue","red")
#kind= "ehull" is the kind of graphic and lwd
ordiellipse(multivar, type, col =1:4, kind= "ehull", lwd=3)

#ordispider is like 
ordispider(multivar, type, col=1:4, label = T)
 
