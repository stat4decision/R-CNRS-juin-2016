library(RcmdrMisc)
library(FactoMineR)

Voitures <- readXL("C:/Users/stagiaire/Desktop/formation R/autos.xlsx", 
                   rownames=TRUE, header=TRUE, na="", sheet="Feuil1", stringsAsFactors=TRUE)
Voitures.PCA<-Voitures[, c("Cylindrée", "Puissance", "Vitesse", "Poids", "Largeur", "Longueur")]
res<-PCA(Voitures.PCA , scale.unit=TRUE, ncp=5, graph = FALSE)
plot.PCA(res, axes=c(1, 2), choix="ind", habillage="none", col.ind="black", 
         col.ind.sup="blue", col.quali="magenta", label=c("ind", "ind.sup", "quali"),
         new.plot=TRUE, title="")
plot.PCA(res, axes=c(1, 2), choix="var", new.plot=TRUE, col.var="black", 
         col.quanti.sup="blue", label=c("var", "quanti.sup"), lim.cos2.var=0, 
         title="")
summary(res, nb.dec = 3, nbelements=10, nbind = 10, ncp = 3, file="")
res$eig
res$var
res$ind
remove(Voitures.PCA)
USA <- read.table("C:/Users/stagiaire/Desktop/formation R/USA.csv", header=TRUE,row.names=1, sep=";", na.strings="NA", dec=",", strip.white=TRUE)
USA <- within(USA, {
  X <- NULL
  X.1 <- NULL
  X.2 <- NULL
  X.3 <- NULL
  X.4 <- NULL
  X.5 <- NULL
  X.6 <- NULL
  X.7 <- NULL
  X.8 <- NULL 
})
USA$Pop_facteur <- with(USA, bin.var(Total.Pop..Est....Jul.1.2001, bins=2, method='intervals', labels=c('Petit etat','Grand etat')))
USA$Pop_facteur <- with(USA, bin.var(Total.Pop..Est....Jul.1.2001, bins=2, method='intervals', labels=c('petit','grand')))
USA.PCA<-USA[, c("Net.Domestic.Mig.", "Federal.Civilian.move.from.abroad", "Net.Int..Migration", "Period.Births", "Period.Deaths", "X..65.Pop..Est.",
                 "Pop_facteur")]
res<-PCA(USA.PCA , scale.unit=TRUE, ncp=5, quali.sup=c(7: 7), graph = FALSE)
plot.PCA(res, axes=c(1, 2), choix="ind", habillage="none", col.ind="black", col.ind.sup="blue", col.quali="magenta", label=c("ind", "ind.sup", 
                                                                                                                             "quali"),new.plot=TRUE, title="")
plot.PCA(res, axes=c(1, 2), choix="var", new.plot=TRUE, col.var="black", col.quanti.sup="blue", label=c("var", "quanti.sup"), lim.cos2.var=0, 
         title="")
summary(res, nb.dec = 3, nbelements=10, nbind = 10, ncp = 3, file="")
remove(USA.PCA)

plot.PCA(res,axes=c(1,3), choix="ind")
plot.PCA(res,axes=c(1,3), choix="var")

