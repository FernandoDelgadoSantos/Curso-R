# Kevin Fernando Delgado Santos 201650026J

# Verificamos  la propiedad pedida referente la función de
# probabilidad de la variable aleatoria de Poisson
verify <- function(x, lambda)
{
  all.equal(dpois(x, lambda), (lambda/x)*dpois(x - 1, lambda))
}


# Calculamos el pmf y el cdf de X ~ Poisson(lambda) mediante la función pmf.cdf.pois
# la cual dado el argumento x, imprime los pmf de X desde 0 hasta (x - 1), así 
# como el cdf de (x - 1). 
pmf.cdf.pois <- function(x, lambda)
{
  a <- rep(NA, x) # Creamos el vector a lleno de NA's
  a[1] <- dpois(0, lambda)
  cdf.F <- 0 
  for (i in 1:(x - 1))
  { 
    cat("p(", i - 1, ") = ", a[i], "\n")
    a[i + 1] <- (lambda/(i)) * a[i] # Usamos la propiedad sugerida
  }
  cat("p(", x - 1, ") = ", a[x], "\n")
  cdf.F <- sum(a) # Este es nuestro CDF
  cat("F(", x - 1, ") = ", cdf.F)
}

pmf.cdf.pois(6, 3)

# Optimización del algoritmo dado, para una variablea aleatoria X ~ Poisson(lambda)

F.rand <- function(lambda) {
  u <- runif(1)
  x <- 0
  p.x <- 0 # inicializamos en cero el pmf
  F.x <- dpois(0, lambda) # inicializamos en F(1) el cdf
   while (F.x < u) {
       x <- x + 1
       p.x <- dpois(x, lambda) # asignamos el pmf del nuevo valor de x a p.x
       F.x <- F.x + p.x # calculamos el cdf de (x + 1) teniendo en cuenta que este 
                        # valor es igual al cdf de x más el pmf de x. 
     }
   return(x)
}