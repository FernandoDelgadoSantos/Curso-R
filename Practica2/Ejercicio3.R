# Nombre: Delgado Saantos, Kevin Fernando 20150026J
# A partir de la creación de las funciones primero() y ultimo() creamos
# las modificaciones pedidas.

# Parte a) 
# Asumiendo k <= length(x), basta con:

# Creación de la función primero()
primero <- function(x, k = 1) x[1:k]

# Creación de la función ultimo()
ultimo <- function(x, k = 1) rev(rev(x)[1:k])


# Parte b)
# Ahora consideramos los casos cuando  k > length(x)

# Creación modificada de la función primero()
primero <- function(x, k = 1) 
{
  if(k <= length(x)) { x[1:k]}else x
}

# Creación modificada de la función ultimo()
ultimo <- function(x, k = 1) if(k <= length(x)) { rev(rev(x)[1:k]) }else x

# Parte c)
# Creación modificada de la función primero() con valores NA:
primero <- function(x, k = 1) 
{
  if(k <= length(x)) { x[1:k]}else x[1:k]
}

# Creación modificada de la función ultimo()
ultimo <- function(x, k = 1) 
{
  if(k <= length(x)) { rev(rev(x)[1:k]) }else rev(x)[1:k]
}








