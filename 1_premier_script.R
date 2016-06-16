#on commence par choisir le répertoire de travail
#on utilise
#setwd("...")

#voici les premières variables
a<-pi
b<-22
c<-a+b
c

a<-pi
#somme de deux nombre au cube
b<-(23+45)^3
#affichage de b
print(b)
b
#Suppression de a de la mémoire
rm(a)
#Affiche le type de variable
mode(b)
#Longueur de la variable 
length(b)
#créer un vecteur de taille 3 avec des valeurs de 22
vec1<-c(22,22,22)
vec1
mode(vec1)
#créer un vecteur allant de 5 à 30 par pas de 5
vec2<-seq(from=10,to=30,by=5)
vec2
#Somme de deux vecteur (attention à la taille)
vec1+vec2
#Obtenir un élément d'un vecteur
vec1[2]
#Créer un vecteur indexé
vec3<-c(ind1=32,ind2=34, ind3=12)
vec3
vec3["ind2"]
#Récupérer la valeur
vec3[["ind2"]]
#définir un vecteur avec données manquantes
vec4<-c(NA,34, 45,NA, 43)
vec4+vec2
is.na(vec4)
str(vec4)
#chercher de l'aide sur l'analyse de la variance
?anova
help.search("anova")
example("glm")
#obtenir de l'aide sur la fonction plot
?plot
plot(sin, -pi, 2*pi)
#importer les données
USA<-read.csv2("USA.csv")
head(USA)

#créer un vecteur de taille 10 rempli de 5
vec5<-rep(5,10)

#créer un facteur
fac1<-factor(c("M","F","M","M"))
fac1
#créer une matrice
mat1<-matrix(seq(1,10),5,2,byrow = TRUE)
mat1
#créer un array
arr1<-array(rep(c(1,2),6),c(2,3,2))
arr1
#créer un Data Frame
df1<-data.frame(var1=1:10,var2=rep(2,10),var3="A")
df1
#statistiques de base
summary(df1)
names(df1)
#generation de nombres aléatoires
vec6<-rnorm(1000)
summary(vec6)
#extraire une colonne
df1$var2