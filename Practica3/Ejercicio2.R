# Kevin Fernando Delgado Santos 20150026J

# Parte a)
mtcars[-1:4, ]
# ítem 1)
# El error es mezclar número positivos y negativos dentro de los
# corchetes
# Algunas maneras de corregirlo podrían ser:
mtcars[1:4, ] # o si no
mtcars[-1:0, ]

# ítem 2)
mtcars[mtcars$cyl <= 5]
# La indexación con corchetes debe contener una coma, ese es el error
# Se puede corregir haciendo:
mtcars[mtcars$cyl <= 5, ]

# ítem 3)
mtcars[mtcars$cyl == 4 |6, ]
# Es ítem no tiene error puesto que esta incluida la coma a la cual 
# hacíamos referencia en los ítems anteriores.

# Parte b)
x <- 1:5 
x[NA]
# Cualquier operación con NA nos devuelve un NA, pues estos valores
# no están disponibles. En particular al querer indexar "x" con NA
# nos retornará 5 veces NA porque dicho NA es comparado con cada
# uno de las posisciones de los elementos de x, y en total
# hace 5 comparaciones

# Parte c)
mtcars[1:20]
# Por que se mtcars es un data  frame, es decir tiene propiedades de 
# matrices, por lo que si se quiere indexar se debe colocar una
# coma dentro de los corchetes, de la siguiente manera
mtcars[1:20, ]

# Parte d)
df[is.na(df)] <- 0
# Esta línea de código esta asignando el valor de 0 a aquellos 
# elementos de df que no estén disponible, es decir que sean NA.









