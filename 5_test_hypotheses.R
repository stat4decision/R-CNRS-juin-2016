library(RcmdrMisc)


#on r�cup�re les donn�es
BB<-readXL("BB.xlsx",header=TRUE)
summary(BB)

#test t univari�
TestTuni<-t.test(BB,alternative = "less",mu = 3250,conf.level = 0.99)
TestTuni
TestTuni$p.value

#test t sur �chantillons ind�pendants
fer<-readXL("fer.xlsx",header=TRUE)
summary(fer)
TestTbi<-t.test(fer$Fer~fer$Sexe,alternative="two.sided")

#TestTbi2<-t.test(Fer~Sexe, data=fer)
TestTbi
