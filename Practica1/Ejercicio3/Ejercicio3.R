# Nombre: Kevin Fernando Delgado Santos 20150026J
# Respuesta a la pregunta 3

# Respuesta al ítem (a), en el cual nos pide demostrar que macth(a, x) es equivalente
# a min(which(x == a)) siendo a un escalar y x un vector. También nos solicitan mostrar
# mostrar ejemplos, así como compararlo con el uso de %in%

# Demostración:
# Al utilizal help("match"), R nos dice que match() nos retorna la posición del primer
# elemento del segundo argumento de match() que concuerde con el primer argumento 
# de match().
# La función min() nos retorna el mínimo valor de su argumento, y al ser
# este argumento un vector con las posiciones en las que el escalar a se 
# encuentre en  el vecetor x, esto nos retorna which(), el código 
# min(which(x == a)) devolverá exactamente lo mismo que match(a, x).

# Ejemplos
# Ejemplo 1
a <- 2
x <- c(3, 5, 6, 2, 8, 3, 2)
match (a, x)         # nos retorna 4
min(which(a == x))   # igualmente nos retorna 4

# Ejemplo 2
a <- 7
x <- c(2, 3, 7, 11, 13, 17, 7, 23, 7)
match(a, x)         # retorna 3
min(which(a == x))  # igualemente nos retorna 3

# Comparación con %in%
# a %in% x nos retorna un vector lógico (que en el caso de que a sea un escalar
# nos retornará un único valor) dependiendo si a está en x.
# Del Ejemplo 2
a <- 7
x <- c(2, 3, 7, 11, 13, 17, 7, 23, 7)
match(a, x)         # retorna 3
min(which(a == x))  # igualemente nos retorna 3
a %in% x            # nos retorna TRUE


# Respuesta al ítem (b), en el cual nos piden comparar los tiempos de 
# ejecución de los siguientes códigos usando al función system.time
y <- c(); for (t in 1:100) y[t] = exp(t)
system.time(y) # devuelve 0 en todas las columnas

w <- exp(1:100)
system.time(w) # devuelve 0 en todas las columnas

z <- sapply(1:100, exp)
system.time(z) # devuelve 0 en todas las columnas

# Por lo tanto no hay mínimo pues los valores retornados truncados al 
# centésimo (por defecto en system.time) dan 0.


# Respuesta al ítem(c), en el cual se nos da el conocido trabablenguas
# de shell y nos piden calcular el número de letras de cada palabra
# usando nchar().

sea_shells <- c("She", "sells", "sea", "shells", "by", "th", "seashore",
                "The", "shells", "she", "sells", "are", "surely", "seashells",
                "So", "if", "she", "sells", "shells", "on", "the", "seashore",
                "I'm", "sure", "she", "sells", "seashore", "shells")
longitudes_sea_shells <- nchar(sea_shells) # nos retorna un vector con las longitudes de cada caracter de sea_shells

for (i in length(sea_shells)){
  (a <- sea_shells[i],"tiene", longitudes_sea_shells [i], "letras" )
}