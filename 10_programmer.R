
#les conditions
B<-TRUE
x<-2

if (B==TRUE){
  x<-x+1
  y<-10
}

t<-10
if(t>10){
  x<-x+2
  y<-10
} else if (5<=t & t<10){
  x<-x+1
  y<-5
}else{
  x<-x-1
  y<-3
}

#boucle for
for(annee in c(2015,2016)){
  print(paste("L'année est",annee))
}

for (i in 1:10){
  if (i==5){
    next
  }
  print(i)
}

res<-PCA(USA[,1:5])
for (i in 1:3){
  if(i!=1){
    plot.PCA(res,axes=c(1,i))
  }
  Boxplot(USA[,i])
}  

#utilisation de apply
x<-matrix(rnorm(1000),100,10)

#moyenne par colonne
apply(x,2,mean)
#équivalent sans apply
for (i in 1:10){
  print(mean(x[,i]))
}

#somme par ligne
apply(x,1,sum)

#créer une liste
l1<-list(a=1:5,b=rnorm(10))
#on obtient une liste avec les moyennes des éléments de a et de b
lapply(l1, mean)
#pour obtenir un vecteur au lieu d'une liste on utilise sapply
res_sapply<-sapply(l1,mean)

#créer une fonction
Fonc1<- function(x,y){
  x+y
}

#créer une fonction affichant un graphique d'ACP
#attention il faut d'abord charger les données USA pour appeler cette fonction
FoncACP<-function(data,showind){
  a<-PCA(data)
  plot.PCA(a,choix=ifelse(showind,"ind","var"))
}

FoncACP(USA[,1:5],TRUE)