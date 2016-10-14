
# subo el environment
load("d:/clasesInsumos/clases2016I/dtoCapital/dtoCapital.RData")

sum(dinamica1$"2008")

# tasa de residuos por cada 1000 h
residuos.promedio<-ambiente$kg.dia/38394000*1000
plot(residuos.promedio~ambiente$anio, type='l')

ls()

 
		
# separar los nombres de las parroquias del sexo

a<-seq(1, 66, by=3)
educacion01Total <- educacion01[a,]


rep(c("A", "B"),2)

educacion01Sexo <- data.frame(parroquia=rep(educacion01Total$parroquia, 2, each=2),
         educacion01[-a,-2])
colnames(educacion01Sexo)[2] <-"sexo"

# elimino la columna total del marco de datos educacion01Total
educacion01Total <-educacion01Total[, -2]

# analisis
summary(educacion01Total[, 2:3])
hist(educacion01Total[,2])
hist(educacion01Total[,3])
sapply(educacion01Total[,2:3], min)

educacion01Total[which(educacion01Total$inicial == 13340),]
educacion01Total[which(educacion01Total$primaria == 41624),]

# creacion de una taxonomia de parroquias de acuerdo
# con la matricula de educacion inicial y primaria

# exploraciones con  diagrama de dispersion

par(mfrow=c(1, 2))

# data sin normalizar
plot(educacion01Total[,2:3])
text(educacion01Total$inicial, educacion01Total$primaria,
       educacion01Total$parroquia)

# data normalizada
plot(scale(educacion01Total[,2:3]))
text(scale(educacion01Total$inicial), scale(educacion01Total$primaria),
       educacion01Total$parroquia)


# creo un marco de datos para el cluster

eduCluster <- scale(educacion01Total[,2:3])
rownames(eduCluster) <-educacion01Total[,1]
head(eduCluster)
# calculo la distancia entre cada parroquia segun la matricula
distanciaeC<-dist(eduCluster)
head(distanciaeC)
# genero el cluster
hclusteC<- hclust(distanciaeC)

# visualizo el cluster
plot(hclusteC)

plot(hclusteC, hang= -1)

rect.hclust(hclusteC, 4, border="darkgreen")


grupos <-cutree(hclusteC, 5)
table(grupos)


memb <- cutree(hclusteC, k = 5)

# otras exploraciones
ed1 <-educacion01Total[,2:3]
rownames(ed1) <-educacion01Total$parroquia

hc <- hclust(dist(ed1)^2, "cen")
memb <- cutree(hc, k = 5)

cent <- NULL
        for(k in 1:5){
        cent <- rbind(cent, 
             colMeans(ed1[memb == k, , drop = FALSE]))
}

hc1 <- hclust(dist(cent)^2, method = "cen", members = table(memb))

opar <- par(mfrow = c(1, 2))
plot(hclusteC,  labels = FALSE, hang = -1, main = "Original")
plot(hc1, labels = FALSE, hang = -1, main = "Re-inicion con 5 clusters")
par(opar)

# esccalamiento multidimensiona

mds <- cmdscale(dist(educacion01Total[,2:3]))
plot(mds, type="n", axes=FALSE, ann=FALSE)
text(mds, labels=rownames(mds2), xpd = NA)

mds1 <- cmdscale(distanciaeC)
plot(mds1, type="n", axes=FALSE, ann=FALSE)
text(mds1, labels=rownames(mds1), xpd = NA)

mds2 <- -cmdscale(dist(ed1))
plot(mds2, type="n", axes=FALSE, ann=FALSE)
text(mds2, labels=rownames(mds2), xpd = NA)


# usando paquete vegan


require(vegan)
ord <- cmdscale(dist(eduCluster))
ordiplot(ord)
fig <-ordiplot(ord, type='none')
text(fig, 'sites')




