# Nombre: Delgado Saantos, Kevin Fernando 20150026J

# Parte 1:
# Separamos la matriz de Hankel como una suma matrices A y B
A <- matrix(data = rep(seq(1:5), 5), nrow = 5)
B <- matrix(data = rep(seq(1:5) - 1, 5), nrow = 5, ncol = 5, byrow = TRUE)
A + B # Esta suma nos retorna la matriz de Hankel pedida.

# Parte 2:
# Las matrices de Hankel están caracterizadas por un vertor dado 
# que siempre debe tener una longitud impar
my_hankel <- function(v, n = (length(v) + 1)/2) # el segundo argumento es definido y se le asigna un valor a la vez
{
  matrix(data = v[my_positions(n)], nrow = n)
}

my_positions <- function(n) # Esta función generaliza el código de la primera parte del ejercicio
{
  A <- matrix(data = rep(seq(1:n), n), nrow = n)
  B <- matrix(data = rep(seq(1:n) - 1, n), nrow = n, byrow = TRUE)
  A + B
}

# Parte 3:
my_hankel(c(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67)) # matriz de Hankel de orden 10
my_hankel(seq.int(from = 1, to = 45, by = 2)) # matriz de Hankel de orden 12






