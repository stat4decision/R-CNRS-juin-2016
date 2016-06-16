library(RcmdrMisc)

#on récupère les données
films<-readXL("cont.xlsx",header = TRUE
              ,sheet = "Feuil1",stringsAsFactors = TRUE)
head(films)
summary(films)

#créer un tableau de contingence
tab_cont_films<-table(films)
tab_cont_films
#obtention du tableau de proportion à partir du tableau de contingence
tab_prop_films<-prop.table(tab_cont_films)
tab_prop_films