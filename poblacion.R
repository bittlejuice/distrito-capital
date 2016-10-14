require(readxl)

# poblacion1
# defunciones asociadas a nutricion
poblacion1 <- read_excel("Poblacion1.xls",
                        col_names = FALSE, skip = 12)

names(poblacion1) <-c("edades", "1981", "1990",
                      "2001", "2011")
# poblacion2
# poblacion y crecimiento geometrico segun censo

poblacion3 <- read_excel("Poblacion3.xls",
                         col_names = FALSE, skip = 12)

names(poblacion3) <-c("censo", "total", "personas",
                      "porcentaje", "cre.geo", "por.Pob")

densidad  <- read_excel("Poblacion4.xls",
                                     col_names = FALSE, skip = 12)

names(densidad) <- c("parroquia", "superficie",
                     "poblacion", "densidad")

pobreza  <- read_excel("Pobreza1.xls",
                                    col_names = FALSE, skip = 12)
names(pobreza)<-c("concepto", "total-i", "no.pobres-i",
                  "pobres-i", "no.extremos-i", "extremos-i",
                  "total-ii", "no.pobres-ii",
                  "pobres-ii", "no.extremos-ii", "extremos-ii")
