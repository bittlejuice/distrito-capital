# obtencion de la data
# subo el paqute que necesito
require(readxl)
# verfico directorio y cambio si es necesario
getwd()
setwd("d:/clasesInsumos/clases2016I/dtoCapital")

# empleo1
# indicadores de la fuerza laboral segun sexo 2008-2012
empleo1 <- read_excel("Empleo1.xls",
                         col_names = FALSE, skip = 14)

sem1 <-paste0("Sem-I.", 2008:2012)
sem2 <-paste0("Sem-II.", 2008:2012)

names(empleo1)<-c("poblacion", 
                  sem1[1], sem2[1],
                  sem1[2], sem2[2],
                  sem1[3], sem2[3],
                  sem1[4], sem2[4],
                  sem1[5], sem2[5])

# empleo2
# poblacion ocupada por rama de actvidad 2008-2012
empleo2 <- read_excel("Empleo2.xls",
                      col_names = FALSE, skip = 12)

names(empleo2)<-c("poblacion", 
                  sem1[1], sem2[1],
                  sem1[2], sem2[2],
                  sem1[3], sem2[3],
                  sem1[4], sem2[4],
                  sem1[5], sem2[5])

# empleo3
# poblacion de 15 o mas anios segun rama de actividad
empleo3 <- read_excel("Empleo3.xls",
                      col_names = FALSE, skip = 12)

names(empleo3)<-c("poblacion", 
                  sem1[1], sem2[1],
                  sem1[2], sem2[2],
                  sem1[3], sem2[3],
                  sem1[4], sem2[4],
                  sem1[5], sem2[5])

# empleo4
# poblacion segun principales grupos de ocupacion
empleo4 <- read_excel("Empleo4.xls",
                      col_names = FALSE, skip = 12)

names(empleo4)<-c("grupos", 
                  sem1[1], sem2[1],
                  sem1[2], sem2[2],
                  sem1[3], sem2[3],
                  sem1[4], sem2[4],
                  sem1[5], sem2[5])
# empleo5
# ingresos segun actividad
empleo5 <- read_excel("Empleo5.xls",
                      col_names = FALSE, skip = 12)

names(empleo5)<-c("sectorEconomico", 
                  sem1[1], sem2[1],
                  sem1[2], sem2[2],
                  sem1[3], sem2[3],
                  sem1[4], sem2[4],
                  sem1[5], sem2[5])
