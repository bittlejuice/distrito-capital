## obtencion de la data
# subo el paqute que necesito
require(readxl)

# Si no tiene este paquete, asegurese de haber transformado sus 
# en formato .csv. Entonces use

## read.csv2("Dinamica1.csv")

# subo la data dinamica1
# nacimientos vivo por parroquia de residencia de la madres, sexo
# 2001-2012
dinamica1 <- read_excel("Dinamica1.xls",
                        col_names = FALSE, skip = 13)

# para facilitar crear los nombres sin equivocarme
mujer <-paste0("M", 2001:2012)
hombre <-paste0("H", 2001:2012)

#renombro las variables
names(dinamica1)<-c("parroquia",
                    2001, hombre[1], mujer[1],
                    2002, hombre[2], mujer[2],
                    2003, hombre[3], mujer[3],
                    2004, hombre[4], mujer[4],
                    2005, hombre[5], mujer[5],
                    2006, hombre[6], mujer[6],
                    2007, hombre[7], mujer[7],
                    2008, hombre[8], mujer[8],
                    2009, hombre[9], mujer[9],
                    2010, hombre[10], mujer[10],
                    2011, hombre[11], mujer[11],
                    2012, hombre[12], mujer[12])


# subo la data de dinamica 2
# nacimientos vivo por parroquia de residencia de la madres, sexo
# grupo de edad de la madre 2012

dinamica2 <- read_excel("Dinamica2.xls", col_names = FALSE, skip = 12)

# nombro las columnas, pero para mayor seguridad creo vectores
# que me permitan colocar los nombres, pero sin cometer errores
# genero el nombre de las parroquias, que generalmente reusaré
parroquias<-c("altagracia", "antimano", "candelaria",
              "caricuao", "catedral", "coche", 
              "junquito", "paraiso", "recreo",
              "valle", "pastora", "vega", "macarao", 
              "s.agustin","s.bernardino", "s.jose", "s.juan",
              "s.pedro", "sta.rosalia", "sta.teresa", "sucre",
              "veintitres")

# creo un nuevo vector, pero esta vez agrego los nombres adicionales
# y al final agrego el vector de los nombres de las parroquias
nombres <- c("edades",  "total", parroquias)

# verifico el largo del vector para detectar posibles errores
length(nombres)

# coloco el nombre de las columnas
names(dinamica2)<-nombres


# subo la data correspondiente a dinamica3. El procedimiento es similar
# nacimientos vivo por parroquia de residencia de la madres y 
# situacion conyugal de la madre 2012


dinamica3 <- read_excel("Dinamica3.xls", col_names = FALSE, skip = 12)

# cambio los nombres para adaptarlo al marco de datos
nombres <- c("parroquia", "total", "Soltera",
             "Casada",	"Divorciada",	"Viuda",
             "Unida", "Separada", "No declarado")
names(dinamica3)<-nombres


# subo la data de dinamica4
# defunciones segun sexo y parroquia 2001-2012
dinamica4 <- read_excel("Dinamica4.xls", col_names = FALSE, skip = 13)
names(dinamica4)<-c("parroquia",
                    2001, hombre[1], mujer[1],
                    2002, hombre[2], mujer[2],
                    2003, hombre[3], mujer[3],
                    2004, hombre[4], mujer[4],
                    2005, hombre[5], mujer[5],
                    2006, hombre[6], mujer[6],
                    2007, hombre[7], mujer[7],
                    2008, hombre[8], mujer[8],
                    2009, hombre[9], mujer[9],
                    2010, hombre[10], mujer[10],
                    2011, hombre[11], mujer[11],
                    2012, hombre[12], mujer[12])
# dinamica5 defunciones por parroquia, sexo y grupos de edad
# 2012

dinamica5 <- read_excel("Dinamica5.xls", col_names = FALSE, skip = 12)
nombres <- c("edades",  "total", parroquias)
names(dinamica5)<- nombres

# dinamica6
# defunciones menores de cinco años segun sexo, parroquia 
# residencia de la madre, 2001-2012

#renombro las variables
dinamica6 <- read_excel("Dinamica6.xls", col_names = FALSE, skip = 13)
names(dinamica6)<-c("parroquia",
                    2001, hombre[1], mujer[1],
                    2002, hombre[2], mujer[2],
                    2003, hombre[3], mujer[3],
                    2004, hombre[4], mujer[4],
                    2005, hombre[5], mujer[5],
                    2006, hombre[6], mujer[6],
                    2007, hombre[7], mujer[7],
                    2008, hombre[8], mujer[8],
                    2009, hombre[9], mujer[9],
                    2010, hombre[10], mujer[10],
                    2011, hombre[11], mujer[11],
                    2012, hombre[12], mujer[12])

# dinamica7
# matrimonios segun parroquia 2000-2012
dinamica7 <- read_excel("Dinamica7.xls", col_names = FALSE, skip = 12)

anios <- c(2001:2012)
anios

names(dinamica7)<-c("parroquias", anios)

# dinamica8 solo tiene informacion para una sola parroquia

# dinamica9
# indicadores de dinamica y ciclo de vida 2012
dinamica9 <- read_excel("Dinamica9.xls", col_names = FALSE, skip = 12)
names(dinamica9) <-c("edades", "total", parroquias)

## Pre-procesamiento de la data

# dinamica1. elimino desde la fila 23 en adelante
dinamica1<- dinamica1[1:22,]

# Separo los totales por anio
totales <- seq(2, 37, by=3)
dinamica1Totales<-data.frame(parroquia= dinamica1$parroquia,
                             dinamica1[,totales])
names(dinamica1Totales) <-c("parroquia", 2001:2012)
# separo sexo
dinamica1Sexo<-dinamica1[,-totales]

#limpio dinamica3
nacidosVivos <-dinamica2[1:10,]
                             
nVivosgrupos<- dinamica2[14:17,]                            
nvMujeres<-dinamica2[41:50,]
nvhombres <-dinamica2[21:30,]

# limpio dinamica3
dinamica3<-dinamica3[1:22, ]

# limpio dinamica4
dinamica4<-dinamica4[1:22,]

defunciones<-data.frame(parroquias =dinamica4[,1],
                        dinamica4[,totales])
names(defunciones)<-c("parroquia", c(2001:2012))

defuncionesSexos <- dinamica4[, -totales]

defuncionesEdades <-dinamica5[1:9,]
defuncionesMujeres <- dinamica5[25:33,]
defuncionesHombres <- dinamica5[13:21,]

dinamica6<-dinamica6[1:22,]

muertesCinco <-data.frame(parroquia= dinamica6[,1],
                          dinamica6[, totales])

muerteCincoHombres <- dinamica6[, -totales]
                          
matrimonios<-dinamica7[1:22,]

# dinamica9
edadesParroquia <-dinamica9[1:4,]
edadesParroquaH <- dinamica9[7:10,]
edadesParroquiaM <-dinamica9[13:16,]

hijosHogar <-dinamica9[20,]
madrePrimerHijo <-dinamica9[22,]
madreMatrimonio <-dinamica9[24,]
edadPromedioMuerte<-dinamica9[30:32,]

## Analisisis exploratorio
# Ver "dinamicaNotebook"
