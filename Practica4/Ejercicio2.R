# Kevin Fernando Delgado Santos   20150026J

# No encontré la manera de leer el file .txt, sin embargo
# suponiendo que ya han sido leídos, las siguientes líneas de código 
# resolverían el problema.

# Código que haya la probabilidad pedida y presenta el resultado
# como una fracción irreductible.

library(MASS)
N # longitud de la cadena de unos y ceros
K # entero dado

count <- 0
for(i in 1:length(N))
{
  for(j in 1:length(N))
  {
    if (abs(i - j) <= K & N[i] == N[j] & N[j] == 1)
      count <- count + 1
  }
}
print(fractions(count/N^2))