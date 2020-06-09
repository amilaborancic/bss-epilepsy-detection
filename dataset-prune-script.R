#zakomentarisati
setwd("C://Users/USER/Desktop/bss-epilepsy-detection")


#ucitavanje dataseta
data_original <- read.csv("EpilepticSeizureRecognitionORIGINAL.csv", header=T)

#izdvojimo 100 od 500 ispitanika
data_reduced <- data_original[1:2300, ]

#sredimo nazive kolona radi lakseg snalazenja
names(data_reduced)[names(data_reduced) == "y"] <- "Klasa"
data_reduced <- data_reduced[,-1]

#spasimo novi dataset
write.csv(data_reduced,'EpilepticSeizureRecognitionREDUCED.csv')