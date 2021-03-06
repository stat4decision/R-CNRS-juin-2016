library(RcmdrMisc)
#on r�cup�re les donn�es
Enfants <- readXL("enfants.xlsx", rownames=FALSE, header=TRUE, na="", 
                  sheet="Feuil1", stringsAsFactors=TRUE)

#on ajuste un mod�le logistique sur les donn�es
modelLogit<-glm(Sexe~Age+Taille+Poids, family=binomial(logit), 
                data=Enfants)

summary(modelLogit)
#on pr�dit les probabilit�s d'appartenance pour de nouvelles observations
predict(modelLogit,newdata = data.frame("Age"=c(23,45),"Taille"=c(15,33
                                        ),"Poids"=c(45,67)),type="response")

#on construit la matrice de bien class�s � partir du mod�le
predict(modelLogit,type="response")
pred<-ifelse(predict(modelLogit,type="response")>0.5,"predM","predF")
table(pred,Enfants$Sexe)