

  user_input<-function(){
     rb <- readline(prompt="Unesite redni broj pacijenta (od 1 do 100): "); 
     rb<-as.numeric(rb)
     if(rb>100 || rb<0){
       print("Broj koji ste unijeli nije u opsegu od 1 do 100.");
     }
     else{
       epilepsy_detection(rb);
     }
  }
 
  epilepsy_detection<-function(rb){
  tune.out <- tune(svm,Klasa~.,data=nm_train, kernel ="linear", ranges=list(cost=c(0.01,0.1,1,10)))
  svm_model <- tune.out$best.model
  svm_predict <- predict(svm_model, nm_test)
  svm_model <- tune.out$best.model
  svm_predict<-as.data.frame(svm_predict)
  i<-23*(rb-1)+1
  ima<-0
  nema<-0
  k<-1
    while(k<=23){
    if(svm_predict[i,1]==0){
      nema<-nema+1
    }else{
      ima<-ima+1;
    }
    i<-i+1;
    k<-k+1;
    }
  if(ima>nema){
    print("Pacijent ima epilepsiju.")
  }else if(ima<nema){
    print("Pacijent nema epilepsiju.")
  }else{
    print("Nije moguæe pouzdano utvrditi da li pacijent ima epilepsiju ili ne.")
  }
  }
 
  user_input()
  