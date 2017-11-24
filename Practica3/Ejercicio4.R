# Kevin Fernando Delgado Santos 20150026J

# ítem a)
f1 <- function(x = {y <- 1;2}, y = 0) {
  x + y
}
f1()
# Esta función de dos argumentos asigna a "x" el valor de 2 y a "y"
# el valor de 1, además nos dice que cuando "y" no tenga un valor 
# asignado, su valor por defecto será cero. f1() nos retorna la suma
# de x + y es decir 2 + 1 = 3.


# ítem b)
trims <- c(0, 0.1, 0.2, 0.5)
x <- rcauchy(10)

lapply(trims, function(trim) mean(x, trim = trim))
lapply(trims, mean, x = x)
# son iguales porque en la segunda función lapply se esta usando 
# un argumento adicional de la función mean, el argumento x = x, 
# es decir los dos últimos argumentos de la segunda función lapply 
# son equivalentes a function(x) mean (y, x = x). 
# Esta es la misma función que aparece en la primera fuinción lapply
# solo que de manera explícita.

# Parte c)
m <- apply(X, 1, function(x) is.na(x) == TRUE)
which(m == FALSE & mat > 0) 
# esto solo nos retorna las posiciones d elos elemento positivos 
# diferentes de NA.

















