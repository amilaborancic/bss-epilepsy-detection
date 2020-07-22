# Projekat iz predmeta Biomedicinski Signali i Sistemi
Ovaj repozitorij sadrži seminarski rad u .pdf i .doc formatima, tri skripte i izvorni dataset. 

## Upute za pokretanje projekta
1. Instalirati RStudio.
2. Pomoću install.packages komande, instalirati pakete "caret" i "e1071".
3. Nakon što se klonira repozitorij, u njemu se nalazi i dataset pod nazivom EpilepticSeizureRecognitionORIGINAL. Desni klik na dataset->properties, kopirati putanju.
4. Otvoriti dataset-prune-script.R, paste-ati kopiranu putanju u setwd komandu. Selektovati sav kod u skripti i kliknuti na Run u RStudio.
5. Otvoriti klasifikacija.R. Selektovati sav kod u skripti i kliknuti na Run u RStudio.
6. Otvoriti program.R. Selektovati sav kod u skripti i kliknuti na Run u RStudio. U konzoli će se pojaviti prompt da se unese redni broj ispitanika. Nakon unosa ispravnog rednog broja, potrebno je pričekati neko vrijeme (na mašini sa 16gb rama se čeka nekih 30 sekundi), nakon kojeg će program ispisati da li pacijent ima epilepsiju ili ne.
