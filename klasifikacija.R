setwd("C://Users/USER/Desktop/bss-epilepsy-detection")
library(e1071)

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}


no_seizure_data <- read.csv("EpilepticSeizureRecognitionREDUCED.csv", header=T)
seizure_data <- read.csv("EpilepticSeizureRecognitionREDUCED_2.csv", header=T)

#plotanje date
plotdata <- seizure_data[24:46,]
plotdata <- plotdata[, -ncol(plotdata)]
plotdata <- plotdata[, -1]
plotdata <- as.numeric(unlist(plotdata))

plot(1:length(plotdata), plotdata, type="l")


#izvadimo svakog drugog ispitanika iz prvog i drugog seta da napravimo trening set

i <- 0
f <- FALSE
train_data <- data.frame()
test_data <- data.frame()
while(i < nrow(seizure_data) && i < nrow(no_seizure_data)){
  dummy <- data.frame(seizure_data[i+1:i+23,])
  dummy_2 <- data.frame(no_seizure_data[i+1:i+23,])
  ####ovo iz nekog razloga poremeti dataset - bude ukupno 50 kolona umjesto 179
  if(f){
    train_data <- rbind(train_data, dummy)
    test_data <- rbind(test_data, dummy_2)
  }
  else{
    train_data <- rbind(train_data, dummy_2)
    test_data <- rbind(test_data, dummy)
  }
  
  f <- !f
  i <- i + 23
}
train_data <- na.omit(train_data)
test_data <- na.omit(test_data)

#normalizacija
nm_train <- normalize(train_data[,!colnames(train_data) %in% c("key","Klasa")])
nm_test <- normalize(test_data[,!colnames(test_data) %in% c("key","Klasa")])
nm_train$Klasa<-train_data[,c("Klasa")]
nm_test$Klasa <- test_data[,c("Klasa")]
