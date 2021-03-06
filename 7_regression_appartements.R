#chargement des donn�es
appartements<-read.csv2("donnees appart paris.csv")
summary(appartements)

#Boxplot
prix_extreme<-boxplot(appartements$prix)
prix_extreme$out
boxplot(appartements$m2)
plot(appartements$prix,appartements$m2)

#Utilisation de GrapeR pour construire des graphiques
#install.packages("GrapheR")
library(GrapheR)
run.GrapheR()

#on supprime l'observation 7 qui est une erreur de mesure
appartements<-appartements[-7,]
summary(appartements)

#regression lineaire
reg_appart<-lm(prix~m2,data=appartements)
summary(reg_appart)
#tableau d'anova pour la regression
anova(reg_appart)
#coefficients du mod�le de r�gression
reg_appart$coefficients
plot(reg_appart)

#pr�dire une nouvelle valeur � partir du mod�le
#on doit fournir un data.frame en entr�e
predict(reg_appart,newdata = data.frame("m2"=c(10,200)),
        interval = "prediction")
