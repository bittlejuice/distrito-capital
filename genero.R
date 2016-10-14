# obtencion de la data
# subo el paqute que necesito
require(readxl)

# subo la data genero
# indicadores de genero
genero <- read_excel("Genero1.xls",
                        col_names = FALSE, skip = 12)

names(genero)<-c("indicador", "total", "hombre", "mujer")

