require(readxl)

#nutricion
# defunciones asociadas a nutricion
nutricion <- read_excel("Nutricion1.xls",
                      col_names = FALSE, skip = 12)
names(nutricion)<-c("edad", "total", "hombre", "mujer")

# salud1
# principales causas de muerte segun sexos e indicadores y
# grado de previnibilidad
salud1 <- read_excel("Salud1.xls",
                        col_names = FALSE, skip = 12)
names(salud1)<-c("causas", "total", "hombre", "mujer",
                    "porcentaje", "tasa", "orden")

# salud2
# defunciones por parroquia de habitacion, sexo y grado de
# previnibilidad
salud2 <- c

names(salud2)<-c("previnibilidad", "total", parroquias)

# salud3
# promedios de años potenciales de vida perdidos
# por anio, sexo y parroqua
salud3 <- read_excel("Salud3.xls",
                     col_names = FALSE, skip = 13)


atributos<-c("parroquia", 
                 2001, hombre[1], mujer[1],
                 2002, hombre[2], mujer[2],
                 2003, hombre[3], mujer[3],
                 2004, hombre[4], mujer[4],
                 2005, hombre[5], mujer[5],
                 2008, hombre[8], mujer[8],
                 2009, hombre[9], mujer[9],
                 2010, hombre[10], mujer[10],
                 2011, hombre[11], mujer[11])
                 
names(salud3) <-atributos

# salud4
# muerte en menores de 5 anios, sexo, grado de previnibilidad, 2012
# indicadores


salud5 <- read_excel("Salud4.xls",
                           col_names = FALSE, skip = 12)
names(salud5)<-c("previnibilidad", "total",
                 "hombre", "mujer", "porcentaje", "orden")
