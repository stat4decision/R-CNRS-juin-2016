library(RcmdrMisc)

#on r�cup�re les donn�es
films<-readXL("cont.xlsx",header = TRUE
              ,sheet = "Feuil1",stringsAsFactors = TRUE)
head(films)
summary(films)

#cr�er un tableau de contingence
tab_cont_films<-table(films)
tab_cont_films
#obtention du tableau de proportion � partir du tableau de contingence
tab_prop_films<-prop.table(tab_cont_films)
tab_prop_films