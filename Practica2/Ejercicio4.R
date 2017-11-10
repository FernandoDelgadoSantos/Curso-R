# Nombre: Delgado Saantos, Kevin Fernando 20150026J

# A partir de las dos líneas de código seguidas buscamos hallar lo pedido, considerando para el ítem c) 
# dos posibles casos.
set.seed(75)
aMat <- matrix(data = sample(10, size = 60, replace = TRUE), nrow = 6)
aMat

# Parte a)
mayores <- function(v) sum(v > 4) # Hallamos la cantidad de número mayores a 4 en v.
apply(aMat, 1, mayores)           # apply aplica nuestra función mayores a cada fila de aMat.


# Parte b)
sietes <- function(v) sum(v == 7) # Vemos cuántas veces aparece 7 en nuestro vector v.
which(apply(aMat, 1, sietes)== 2) # Nos devuelde las posiciones de las filas en las que el 7 solo aparece 2 veces.


# Parte c)

# Si las repiticiones fueran permitidas, es suficiente lo siguiente:
suma_col <- apply(aMat, 2, sum) # Calculas la suma de los elementos de cada columna
# outer() nos devuelve una matriz con todas las posibles sumas de 2 elementos de suma_col
matrix_sum <- outer(suma_col, suma_col, "+")
# ahora con which() las posiciones cuyos valores que cumplen son ser mayores a 75, el argumento añadido 
# conserva las índices en el arreglo inicial.
which(matrix_sum > 75, arr.ind = TRUE)

# Si las repeticiones no fueran permitidas, la última línea de código de lo escrito líneas arriba debe cambiarse por
which(matrix_sum > 75 & lower.tri(matrix_sum), arr.ind = TRUE )



