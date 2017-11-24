# Kevin Fernando Delgado Santos 20150026J


# Parte a)
# Para averiguar cómo está estructurado, vemos la clase de iris.
class(iris) # Es una estructura de del tipo data.frame

nrow(iris) # contiene 150 observaciones
ncol(iris) # Contiene 5 variables

# Parte b)
a <- summary(iris)
a
class(a)
# Proporciona los siguientes valores, el mínimo valor, el primer 
# quartil, la mediana, la media, el tercer cuartil y el máximo de 
# cada una de las variables: Sepal.Length, Sepal.Width, Petal.Length,
# Petal.Width; mientras que para la variable Species proporciona
# la cantidad total de cada tipo de especie.

# Parte c)
# Creamos una función que proporciona los mismos valores que summary()
# pero a estos valores los guardamos en una lista
func.sumary <- function(x)
{
  list(min(x), max(x), mean(x), median(x), quantile(x)[c(2, 4)])
}
# Llamamos a lapply para ejecutar func.summary sobre todo iris[-5] 
# pero solo nos interesan los valores de la variable Sepal.Length
lapply(as.list(iris[-5]), func.sumary)$Sepal.Length







