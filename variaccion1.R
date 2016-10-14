variacion1<-function(x, y){
# obtener la tasa de crecimieto  o decrecimiento de una variabe
# x: anio mas reciente
# y: anio inicial
# formula (x-y)/y *100
# aplicacion:  variacio        n1(empleo1976, empleo1965)
        diferencia <- x-y
        cociente <-diferencia/y
        tasa <- round(cociente*100, 2)
        return(tasa)
        
}

