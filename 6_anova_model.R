library(RcmdrMisc)

#on r�cup�re les donn�es
rendement<-readXL("rendement.xlsx")

#transformation en facteurs et recodage
rendement$M�thode<-as.factor(rendement$M�thode)
head(rendement)
#rendement$Type.de.champ<-as.factor(rendement$Type.de.champ)
rendement$Type.de.champ<-recode(rendement$Type.de.champ, "1='A';2='B';3='C';4='D'",
                                  as.factor.result = TRUE)
#cr�ation d'un mod�le
modelANOVA_rend<-lm(Rendement~Type.de.champ+M�thode,data=rendement)
summary(modelANOVA_rend)
confint.lm(modelANOVA_rend)
plot(modelANOVA_rend)

library(multcomp)

#comparaisons multiples
summary(glht(modelANOVA_rend,linfct = mcp(M�thode = "Tukey")))

#affichage matrice du mod�le
mat<-model.matrix(~M�thode, data=rendement)
mat

#construire une matrice de contrastes pour le mod�le
K<-matrix(c(0,0,0,1,0,-1),1)
#comparaison sur les contrastes
t<- glht(modelANOVA_rend,linfct=K)
summary(t)
