#zakomentarisati
setwd("C://Users/USER/Desktop/bss-epilepsy-detection")
library(e1071)

#ucitavanje dataseta
data_original <- read.csv("EpilepticSeizureRecognitionORIGINAL.csv", header=T)

#izdvojimo 100 od 500 ispitanika
data_reduced <- data_original[1:2300, ]

#sredimo nazive kolona radi lakseg snalazenja
names(data_reduced)[names(data_reduced) == "y"] <- "Klasa"
data_reduced <- data_reduced[,-1]

#spasimo novi dataset
write.csv(data_reduced,'EpilepticSeizureRecognitionREDUCED.csv')


data_reduced$Klasa[data_reduced$Klasa==2]<-0
data_reduced$Klasa[data_reduced$Klasa==3]<-0
data_reduced$Klasa[data_reduced$Klasa==4]<-0
data_reduced$Klasa[data_reduced$Klasa==5]<-0

data_reduced["Klasa"] <- lapply(data_reduced["Klasa"], as.factor)
data<-data_reduced[,c("X1","X2","Klasa")]
svmfit = svm(Klasa ~ ., data = data, kernel = "linear", cost = 10, scale = FALSE)
#plot(svmfit,data)