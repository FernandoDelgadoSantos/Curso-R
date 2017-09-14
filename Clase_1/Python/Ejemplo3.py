x = 2

if x > 3:
        print("Este numero ")
print("es mayor")
print("qeu 3.")


numeros = [1, 5, 2, 12, 24, 7, 18]

doble = []
for numero in numeros:
    doble.append(2*numero)
    
numeros_pares = []
for numero in numeros:
    if numero % 2 == 0:
        numero_pares.append(numero)

animalitos = ["aardvark", "cat", "dog", "apossum"]
animalitos_a = []
for animalito in animalitos:
    if animalito[0] in "aeiou":
        animalitos_a.append(animalito.title())
