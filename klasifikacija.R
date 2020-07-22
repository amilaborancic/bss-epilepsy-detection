setwd("C://Users/USER/Desktop/bss-epilepsy-detection")
library(e1071)
library(caret)

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}


no_seizure_data <- read.csv("EpilepticSeizureRecognitionREDUCED.csv", header=T)
seizure_data <- read.csv("EpilepticSeizureRecognitionREDUCED_2.csv", header=T)

#plotanje date
plotdata <- normalize(seizure_data[24:46,])
plotdata <- plotdata[, -ncol(plotdata)]
plotdata <- plotdata[, -1]
plotdata <- as.numeric(unlist(plotdata))

plot(1:length(plotdata), plotdata, type="l")


#izvadimo svakog drugog ispitanika iz prvog i drugog seta da napravimo trening set
i <- 0
f <- FALSE
train_data <- data.frame()
test_data <- data.frame()
print(nrow(train_data))

while(i < (nrow(seizure_data)) && i < (nrow(no_seizure_data))){
  dummy <- data.frame(seizure_data[(i+1):(i+23),])
  dummy_2 <- data.frame(no_seizure_data[(i+1):(i+23),])
  
  if(f){
    train_data <- rbind(train_data, dummy)
    test_data <- rbind(test_data, dummy_2)
  }
  else{
    train_data <- rbind(train_data, dummy_2)
    test_data <- rbind(test_data, dummy)
  }
  i<-i+23
  f <- !f
}

train_data["Klasa"] <- lapply(train_data["Klasa"], as.factor)
test_data["Klasa"] <- lapply(test_data["Klasa"], as.factor)

#normalizacija 
nm_train <- normalize(train_data[,!colnames(train_data) %in% c("key","Klasa")])
nm_test <- normalize(test_data[,!colnames(test_data) %in% c("key","Klasa")])
nm_train$Klasa<-train_data[,c("Klasa")]
nm_test$Klasa <- test_data[,c("Klasa")]


