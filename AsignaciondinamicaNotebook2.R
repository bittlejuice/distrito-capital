#---
#title: "Distrito Capital. Dinamica. Exploraciones"
#output: html_notebook
#---

1. Cambie el nombre de Distrito Capital en el titulo (title). Coloque la entidad que le corresponde a usted

2. Si usted tiene sus datos completos en  un environment, súbalo a R. Modifique y descomente el codigo. **No olvide modificar el codigo de acuerdo con su propio directorio**. De no ser así

3. Si tiene todos sus archivos en una carpeta, transformados en .csv, descomente el segundo codigo. Asegurese de hacer las modificaciones necesarias en el script **dinamica.R**, de lo contrario tendra errores. **No olvide modificar el codigo de acuerdo con su propio directorio**
```{r}
# load("D:/clasesInsumos/clases2016I/dtoCapital/dinamicaDs.RData")

# source("D:/clasesInsumos/clases2016I/dtoCapital/.dinamica.R")
```


4. Examine el marco de datos que haya creado con su primera hoja de calculo. Ejemplo:
```{r}
head(dinamica1Totales)
```


5. Calcule la taa de variacion. Aqui tiene un ejemplo de función  propia, creada para calcular la tasa de variacion
```{r}
# creo una funcion propia para calcular la tas de variacion
 
variacion1<-function(x, y){
# obtener la tasa de crecimieto  o decrecimiento de una variabe
# x: anio mas reciente
# y: anio inicial
# formula (x-y)/y *100
# aplicacion:  variacion1(empleo1976, empleo1965)
        diferencia <- x-y
        cociente <-diferencia/y
        tasa <- round(cociente*100, 2)
        return(tasa)
}
```

6. Pruebe la funcion con su data

```{r}
# pruebe la funcion usando su propia data

```

7a. Calcule la tasa de variacion  en los nacimientos en las distintas parroquias de su entidad, según la resdiencia habitual  de la madre.

```{r}


# analice los nacimientos vivos por parroquia en 
# dsu entidad  entre 2001 y 2012. Cree un data frame



# explore el marco de datos que ha creado
nacimiento_parroquia
``` 


7b. Visualice e interprete su marco de datos. Rellene la función con sus datos
```{r}
#barplot(,
        #names.arg =,
        #las=2)
```

Interpretación:



8a. Examine la evolución del índice de masculinidad. Explore el marco de datos que tenga con los nacimientos vivos en su entidad, según la parroquia de residencia de la madre
```{r}
# head()
```

8b. Construya una función que le permita analizar rápidamente el índice de masculinidad. La fórmula es

$$masculinidad=100\cdot\frac{Hombres}{Mujeres}$$

Ejemplo:
```{r}
masculinidad <-function(hombres, mujeres){
# obtener el indice de masculinidad
# hombres: vector con el numero de hombres
# mujeres: vector con el numero de mujeres
# formula: hombres/mujeres * 100
# aplicacion:  masculinidad(hombres_en, mujeres_en)
        indices <- round(100*hombres/mujeres,2)
        return(indices)
        
}
```

Pruebe la funcion

```{r}
# sin aplicar la funcion


# con la funcion masculinidad
# masculinidad()

```

Interpretación del índice. Referencia

* el valor es igual a 1 si hay igual cantidad de hombres que mujeres
* el valor será mayor a 1 si hay más hombres que mujeres
* el valor será menor a 1 si hay menos hombres que mujeres
        
```{r}
#indice.masculinidad <-data.frame()

#indice.masculinidad$variacion <-
 #       variacion1(indice.masculinidad[,3], 
  #                 indice.masculinidad[,2])
```


8c. Visualice e interprete la masculinidad


```{r}
#barplot()
```

Interpretación


8d. Cree una doble visualización: los nacimientos y el ndice de masculinidad. Por ejemplo 
```{r}
par(mfrow=c(1,2))
barplot(nacimiento_parroquia[,2],
        names.arg = nacimiento_parroquia[,1],
        las=2)

barplot(indice.masculinidad[,4],
        names.arg =indice.masculinidad[,1],
        las=2)

```

Interpretación:



9. Analice cuál es el grupo de edad más frecuentes de las madres

```{r}

barplot(nacidosVivos$total, names.arg = nacidosVivos$edades, 
        las=2)
```

Interpretación:




10. Cree una función para calcular rápidamente porcentaje. Puede, si quiere, emplear la siguiente:

```{r}
porcentaje <- function(marco, divisor, dividiendo){
# dado un marco de datos, calcula los porcentajes
# marco: vector o marco de datos que se desea transformar
# divisor: vector o columnas a las que se desea obtener el porcentaje
# dividiendo: vector o columna por la que se desea dividir para obener el porcentaje
# aplicacion:  porcentaje(marco, 3:10, 2)        
        df <- as.data.frame(marco)
        proporcion <- df[,divisor]/df[, dividiendo]
        porcentaje <- round(proporcion*100, 1)
        return(porcentaje)
}

```

10b. Pruebe y aplique la función

```{r}

```

Interpretación:





11. Suba el paquete **lattice**

```{r}
require(lattice)
```

11a. Cree un marco de datos con los porcentajes

```{r}


# Creo un marco de datos con los porcentajes


# coloque la variable parroquia en una
# sola columna,  use la funcion stack()



```


11b. agregue ahora los grupos de edad. Use la función repetir: **rep()**

```{r}
# ejemplo funcion repetir. Repito: c("A","B"), dos veces


# debe repetir los nombres de los grupos  de edades, 9 veces
# en 10 series y agregarlo al marco 


#abrevie los nombres de las parroquias


```

11c. Cree un small.multiple para visualizar los porcentajes

```{r}
dotplot(values~ind | grupos, data=nvS)
```


11d. Instruya a R para que tome la variables **grupos** como factor en el small.multiple

```{r}
# Por ejemplo
#dotplot(values~ind | as.factor(grupos), data=nvS,
#        scales= list(x= list(rot=90)))
```

Interpretacion:





12. Reorganice los niveles (categoría) de la variable grupos para visualizarlos mejor en el small.multiple
```{r}
# ejemplo:

#nvS$grupos <-factor(nvS$grupos, order=TRUE,levels=c("Menos de 15",
#                                                   "15 -19",
#                                                    "20-24",
#                                                    "25-29",
 #                                                   "30 -34",
#                                                    "35 -39", 
#                                                    "40 -44",
#                                                    "45 -49",
#                                                   "50 años y más",
#                                                  "No-declarado"))

```

Visualice
```{r, fig.height=10, fig.width=10}
#barchart()
```

13a. Analice el predominio o no de adolescentes en las diferentes parroquias

```{r}


```

13b.Visualice la informacion
```{r, fig.height=10, fig.width=10}
# barchart()
```

Interpretación:




14a. Analice la distribución de los nacidos vivos por sexo, según grupo de edades de la madre



```{r}

# cree un data.frame con los porcentajes

# apile el data.frme


# agregue la informacion sobre los grupos


# haga el mismo procedimiento con las mujeres

# creo un data.frame con los porcentajes

```


14b. Visualice e interprete la informacion
```{r, fig.height=10, fig.width=10}
#barchart()
```



15a. Analice  qué porcentaje de niños nacidos aporta cada grupo de edad en cada parroquia

```{r}
# para obtener los totales de las columnas
# colSums

```

15b. Calcule el porcentaje
```{r}
# porcentaje

# apile

# agregue grupos de edad

```

15c. Visualice e interprete
```{r, fig.height=10, fig.width=10}
#barchart()
```

15d.Libere los paneles de forma tal que cada grupo de edad refleje el rango de valores propios y  se puede apreciar mejor la contribución de cada grupo de edad a los nacidos vivos dentro de la parroquia

```{r, fig.height=10, fig.width=10}
#barchart()
```

15e. Se considera que los niños nacidos de madres menores de cierta edad están en situación de alto riesgo porque es probable que sufran daños (enfermedad, mortalidad, entre otros). La escala es:

* Alto riesgo: madres menores de 20 años
* Riesgo intermedio: madres mayores de 34 años
* Bajo riesgo: madres entre 20 y 34 años

Desde esta perspectiva, Interprete la data:




16. Examine los nacidos vivos según la situación conyugal de las madres en las diferentes parroquias. Se considera que un niño nacido de una mujer sin pareja presenta mayores riesgos que un niño nacido de una madre con pareja.


```{r}


```

visualice e interprete
```{r, fig.height=10, fig.width=10}

```

17. Analice, visualice e interprete la defunciones

¿En qué grupos de edad se producen más defuncines?

¿ qué parroquias mueren más hombres que en mujeres. El indice de masculinidad en las defunciones?

Visualicelo desde dos perspectivas diferentes


¿En qué parroquias ocurren las mayores muertes en menores de 5 años?

18 ¿cuál es la evolución de los matrimonios por parroquia?

19. Construya un indice proxy de envejecimiento por parroquia


$$indice\ envejecimiento\ =\frac{\left(personas\ 65\ y\ mas\right)}{personas\ <\ 15}\cdot100$$

Grafique primero el porcentaje de personas adultas por parroquia

Genere el indice de los mayores de 65 años con respecto a los otros tres grupos de edad

19. Grafique e interprete

* numero de hijos por hogar
* Edad de la madre al tener el primer hijo
* Edad promedio al morir