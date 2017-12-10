# Kevin Fernando Delgado Santos 201650026J

# Parte a)
# La siguiente función puede hallar el valor de X que cumpla la 
# ecuación pnorm(x) = a, con una presición de 1e-4 por defecto, 
# siendo el a el parámetro pasado a la función, el cual debe estar 
# entre cero y uno.
inv.cdf <- function (a, presicion = 1e-4) {
  x <- 0
  if( a >= 0.5 & a < 1)
  {
      while (pnorm(x) <= a) {
        x <- x + presicion
      }
      return(x)
  }
  if(0 < a & a < 0.5)
  {
    while (pnorm(x) >= a) {
      x <- x - presicion
    }
    return(x)
  }
}


# Parte b)

# Sí, R tiene implementada la función qnorm(), la cual nos devuelve el 
# valor inverso del CDF de X ~ Normal(0, 1).
# qnorm() nos devuelve un valor muy cercano al valor que hallamos
# con la función descrita líneas arriba (este acercamiento puede
# ser mejorado modificando la precisión en inv.cdf).
qnorm(0.975)
inv.cdf(0.975)
qnorm(0.1586)
inv.cdf(0.1586)