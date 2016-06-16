library(RcmdrMisc)
#on récupère les données
Enfants <- readXL("enfants.xlsx", rownames=FALSE, header=TRUE, na="", 
                  sheet="Feuil1", stringsAsFactors=TRUE)

#on ajuste un modèle logistique sur les données
modelLogit<-glm(Sexe~Age+Taille+Poids, family=binomial(logit), 
                data=Enfants)

summary(modelLogit)
#on prédit les probabilités d'appartenance pour de nouvelles observations
predict(modelLogit,newdata = data.frame("Age"=c(23,45),"Taille"=c(15,33
                                        ),"Poids"=c(45,67)),type="response")

#on construit la matrice de bien classés à partir du modèle
predict(modelLogit,type="response")
pred<-ifelse(predict(modelLogit,type="response")>0.5,"predM","predF")
table(pred,Enfants$Sexe)