# Kevin Fernando Delgado Santos   20150026J

# No encontré la manera de leer el file .txt, sin embargo
# suponiendo que ya han sido leídos, las siguientes líneas de código 
# resolverían el problema.


# El siguiente programa calcula el número de maneras en las que se 
# puede formar la cantidad N, con los datos dados.


cant.A # Monedas de valor 1
cant.B # Monedas de valor 2
cant.C # Monedas de valor 5
cant.D # Monedas de valor 10
sum.monedas <- cant.A + cant.B + cant.C + cant.D
# la variable sum.monedas nos evita el uso de un cuarto bucle for
contador <- 0
for (i in 0:cant.A)
{
  for (j in 0:cant.B)
  {
    for (k in 0:cant.C)
    {
      if (i + 2*j + 5*k + 10*(sum.monedas - i - j - k) == N) contador <- contador + 1
    }
  }
}
print(contador)
