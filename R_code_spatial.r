#installa prima se la carica  
library("sp")

#dati da usare
data(meuse)

head(meuse)

#coordinate del dataset (per raggruppare il gruppo --> la tilde)
coordinates(meuse)=~x+y

#per vedere con un grafico basico i dati
plot(meuse)

#spplot un grafico più completo, con dati e rappr . grafica più significativa dei dati di zinco (fatto già in spatial 1), ricordati "(quads) per le variabili)
spplot(meuse,"zinc")

#un'altra possibilità per vedere i nomi dei meuse è names
names(meuse)

#osserva la concentrazione sia per lo zinco precedente ed ora per il rame sulla parte sx del fiume
#title change with main = " "
spplot(meuse,"copper", main="Copper concentration")

#funzione bubble sempre su sp, stesso plottaggio precedente ma che evidenzia la concentrazione con la dimensione, non con il colore
bubble(meuse,"zinc", main="Zinc Concentration")

#exercise
bubble(meuse,"copper",col="red", main="Copper Concentration")

#dati dall'esterno sul covid-19
#cartella da creare su Windows: percorso:\lab
setwd("C:/Lab")

#leggere la tabella, se c'è il titolo(descrizione) si mette HEAD= T/TRUE o al contrario F/FALSE
covid <- read.table("covid_agg.csv", head= TRUE)
head(covid)

attach(covid)
plot(country,cases) #plot(covid$cases,covid$cases) se non vuoi fare attach 

#use ggplot
install.packages ("devtools")
devtools::install_github("tidydiverse/ggplot2")

#save the R.DATA under the menu File

#load previously saved .RData
#function load("name.RData")
load("C:/Lab/spatial.RData")

#ls() funzione per guardare il contenuto
ls()

#if you search about ggplot 2.0
#data
#est
#tgeometry

#before call ggplot
library(ggplot2)

#in ggplot there is a dataset call mpg dataframe
data(mpg)
head(mpg)

#key component: data,aes,geometry (ricordati le parentesi per ogni funzione)
ggplot(mpg, aes(x=displ,y=hwy)) + geom_point()

#cambiare da punti a line or polygon
ggplot(mpg, aes(x=displ,y=hwy)) + geom_line()

ggplot(mpg, aes(x=displ,y=hwy)) + geom_polygon()

#how to make a ggplot for covid data
head(covid)
ggplot(covid, aes(x=lon,y=lat), size=cases) + geom_point()

#now we go on point patterns analysis. (from in situ data)


       
       
