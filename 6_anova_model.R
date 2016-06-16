library(RcmdrMisc)

#on récupère les données
rendement<-readXL("rendement.xlsx")

#transformation en facteurs et recodage
rendement$Méthode<-as.factor(rendement$Méthode)
head(rendement)
#rendement$Type.de.champ<-as.factor(rendement$Type.de.champ)
rendement$Type.de.champ<-recode(rendement$Type.de.champ, "1='A';2='B';3='C';4='D'",
                                  as.factor.result = TRUE)
#création d'un modèle
modelANOVA_rend<-lm(Rendement~Type.de.champ+Méthode,data=rendement)
summary(modelANOVA_rend)
confint.lm(modelANOVA_rend)
plot(modelANOVA_rend)

library(multcomp)

#comparaisons multiples
summary(glht(modelANOVA_rend,linfct = mcp(Méthode = "Tukey")))

#affichage matrice du modèle
mat<-model.matrix(~Méthode, data=rendement)
mat

#construire une matrice de contrastes pour le modèle
K<-matrix(c(0,0,0,1,0,-1),1)
#comparaison sur les contrastes
t<- glht(modelANOVA_rend,linfct=K)
summary(t)
