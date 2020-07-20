#zakomentarisati
setwd("C://Users/USER/Desktop/bss-epilepsy-detection")
library(e1071)

#ucitavanje dataseta
data_original <- read.csv("EpilepticSeizureRecognitionORIGINAL.csv", header=T)

data_reduced <- data_original[1:2300, ]
data_reduced_2 <- data_original[4601:6900, ]

#sredimo nazive kolona radi lakseg snalazenja
names(data_reduced)[names(data_reduced) == "y"] <- "Klasa"
data_reduced <- data_reduced[,-1]

data_reduced$Klasa<-0

data_reduced["Klasa"] <- lapply(data_reduced["Klasa"], as.factor)

#sredimo nazive kolona radi lakseg snalazenja za drugi set
names(data_reduced_2)[names(data_reduced_2) == "y"] <- "Klasa"
data_reduced_2 <- data_reduced_2[,-1]

data_reduced_2$Klasa<-1

data_reduced_2["Klasa"] <- lapply(data_reduced_2["Klasa"], as.factor)

#spasimo nove datasetove
write.csv(data_reduced,'EpilepticSeizureRecognitionREDUCED.csv')
write.csv(data_reduced_2,'EpilepticSeizureRecognitionREDUCED_2.csv')

