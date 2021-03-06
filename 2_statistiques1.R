#on charge les packages
#pour installer ces packages, on utilise
#install.packages("readxl")

library(readxl)
library(RcmdrMisc)
library(abind)
library(e1071)

#on charge des donn�es Excel
iris <- read_excel("C:/Users/stagiaire/Desktop/formation R/Iris.xlsx",  
                    na="", sheet="Feuil1")
summary(iris)

#on transforme la variable esp�ce en facteur
iris$Esp�ce=as.factor(iris$Esp�ce)
summary(iris)

#statistique descriptives
numSummary(iris[,c("Larg. P�tales", "Larg. S�pales", "Long. P�tales", "Long. S�pales")], statistics=c("mean", "sd", 
                                                                                                       "quantiles"), quantiles=c(0,.5,1))
#repr�sentation du box plot
Boxplot(iris$`Larg. P�tales`~iris$Esp�ce, id.method="y")