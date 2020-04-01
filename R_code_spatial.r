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
