#on charge les packages
#pour installer ces packages, on utilise
#install.packages("readxl")

library(readxl)
library(RcmdrMisc)
library(abind)
library(e1071)

#on charge des données Excel
iris <- read_excel("C:/Users/stagiaire/Desktop/formation R/Iris.xlsx",  
                    na="", sheet="Feuil1")
summary(iris)

#on transforme la variable espèce en facteur
iris$Espèce=as.factor(iris$Espèce)
summary(iris)

#statistique descriptives
numSummary(iris[,c("Larg. Pétales", "Larg. Sépales", "Long. Pétales", "Long. Sépales")], statistics=c("mean", "sd", 
                                                                                                       "quantiles"), quantiles=c(0,.5,1))
#représentation du box plot
Boxplot(iris$`Larg. Pétales`~iris$Espèce, id.method="y")