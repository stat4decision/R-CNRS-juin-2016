library(RcmdrMisc)


#on récupère les données
BB<-readXL("BB.xlsx",header=TRUE)
summary(BB)

#test t univarié
TestTuni<-t.test(BB,alternative = "less",mu = 3250,conf.level = 0.99)
TestTuni
TestTuni$p.value

#test t sur échantillons indépendants
fer<-readXL("fer.xlsx",header=TRUE)
summary(fer)
TestTbi<-t.test(fer$Fer~fer$Sexe,alternative="two.sided")

#TestTbi2<-t.test(Fer~Sexe, data=fer)
TestTbi
