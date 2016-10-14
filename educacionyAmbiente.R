# obtencion de la data
# subo el paqute que necesito
require(readxl)
# verfico directorio y cambio si es necesario
getwd()
setwd("d:/clasesInsumos/clases2016I/dtoCapital")


#creo un marco de datos
ambiente <- data.frame(anios = c(2007, 2008, 2009, 2010, 2011),
                       kg.dia = c(750000, 824000, 2340210, 2340210,
                                  2096339))

ambiente$variacion <- diff(ambiente$kg.dia)/ambiente$kg.dia*100


# subo la data de educacion1
# matricula educacion inicial y educacionp primaria segun
# parroquia, 2012
# leer .csv
educacion01 <- read.csv("educacion01.csv",
                        sep=";", stringsAsFactor=FALSE )

read.csv2("ejemplo.txt")

# educacion2
# matricula final primaria y media 2010/2011
educacion2 <- read_excel("Educacion2.xls",
                        col_names = FALSE, skip = 11)

# educacion3
# matricula final primaria y media 2011/2012
educacion3 <- read_excel("Educacion3.xls",
                         col_names = FALSE, skip = 11)

# educacion4
# matricula segun parroquia y sexo, porcentaje y masculinidad
educacion4 <- read_excel("Educacion4.xls",
                         col_names = FALSE, skip = 13)
# elimino columnas
educacion4<-educacion4[, -c(8:13,16)]
names(educacion4)<-c("parroquia","totalInicial", "inicialH", "InicialM",
                     "totalPrimaria", "primariaH", "primariaM",
                     "masculinidadadInicia", "masculinidadPrimaria")

# educacion5
# planteles segun tipo de dependencia y parroquia 2010/2011
educacion5 <- read_excel("Educacion5.xls",
                         col_names = FALSE, skip = 12)
dependencia<-c("Nacional", "Estadal","Autonoma",
               "Privada", "Privada subv_MPPE",
               "Privada subv_Oficial")

names(educacion5)<-c("parroquia", "total", dependencia)

# educacion6
# poblacion segun edad y anios de educacion
educacion6 <- read_excel("Educacion6.xls",
                         col_names = FALSE, skip = 12)
names(educacion6) <-c("edades", "promedio1", "hombre1", "mujer1",
                      "promedio2", "hombre2", "mujer2")

# educacion7
# poblacion segun edad  jefe de hogar y anios de educacion
educacion7 <- read_excel("Educacion7.xls",
                         col_names = FALSE, skip = 12)
names(educacion7) <-c("edades", "promedio1", "hombre1", "mujer1",
                      "promedio2", "hombre2", "mujer2")

# educacion8
# fuerza laboral segun anios de educacion
educacion8 <- read_excel("Educacion8.xls",
                         col_names = FALSE, skip = 12)
names(educacion8) <-c("edades", "promedio1", "hombre1", "mujer1",
                      "promedio2", "hombre2", "mujer2")

