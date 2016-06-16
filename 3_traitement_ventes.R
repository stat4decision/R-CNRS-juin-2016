library(RcmdrMisc)

#importation de ventes.xlsx
Ventes <- readXL("ventes.xlsx", rownames=TRUE, header=TRUE, na="", sheet="Feuil1", stringsAsFactors=TRUE)

#obtention de lhistogramme
with(Ventes, Hist(VENTES, scale="frequency", breaks="Sturges", col="darkgray", main="Histogramme sur les ventes"))

with(Ventes, Hist(VENTES, scale="frequency", 
                  breaks=20, col="red", 
                  main="Histogramme sur les ventes"))

Hist(Ventes$VENTES, scale="frequency", 
                  breaks=20, col="red", 
                  main="Histogramme sur les ventes")

#discretisation de la variable prix
#intervalles égaux
Prix_disc<-cut(Ventes$Prix,breaks = 4)
Prix_disc
#intervalles personnalisés
Prix_disc2<-cut(Ventes$Prix,breaks=c(min(Ventes$Prix),70,max(Ventes$Prix))
                                                    ,include.lowest = TRUE)
Prix_disc2
levels(Prix_disc2)<-c("Niveau 1", "Niveau 2")

#matrice de corrélation
MatCorVentes<-cor(Ventes,use="complete")
MatCorVentes
