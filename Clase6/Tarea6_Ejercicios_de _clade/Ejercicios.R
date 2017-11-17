# Pregunta 1
f1  <- factor(letters)
levels(f1) <- rev(levels(f1))
f1
# El vector f1 es invertido

# Pregunta 2
x1 <- array(1:5, c(1, 1, 5)) 
x2 <- array(1:5, c(1, 5, 1))
x3 <- array(1:5, c(5, 1, 1))
# x1, x2, x3 son arrays de tres dimensiones

# Pregunta 3
# Los data.frame comparten muchas de las propiedades de las listas
# y de las matrices, son arreglos rectangulares (como las matrices) 
# donde cada columna puede ser vita como una 
# observación y cada fila como una variables, es así qeu los data.
# frame pueden almacenar datos de diferentes clases (como las listas)

# Pregunta 4
# R coerciona a todos los datos al tipo de mayor jerarquía,
# obteniendo así todos los datos del mismo tipo, como 
# debe ser en el caso de las matrices
# en el ejemplo mostrado lo hace al tipo character
df3 <- data.frame(c = 5:8, letters[5:8])
df3
as.matrix(df3)

# Pregunta 5
# Sí, R solo deja ese espacio en blanco, y sigue enlistando los demás
# datos en el arreglo bidimensional

# Pregunta 6
# Devuelve NULL

# Pregunta 7
# También devuelve TRUE, ya que una matriz es un array de dos dimensiones

# Pregunta 8
# is.vector() e is.numeric() verifican que las argumentos que les pases
# sean vectores y datos del tipo numérico, repectivamente.
# is.list e is.character hacen los mismo, pero verificando que
# sean listas y dadtos del tipo character respectivamente.

# Pregunta 9
-1 < FALSE  
# Es falso pues el valor coercionado de FALSE es 0.
"one" < 2
# es falso pues los datos character son de mayor jerarquía 
# que los datos del tipo entero

# Pregunta 10
c(1, FALSE)  # coerciona a FALSE a su valor numérico, que es cero 
c("a", 1) # coerciona a 1, y lo vuelve character
c(list(1), "a") # coerciona a una lista el elemento a
c(TRUE, 1L) # coerciona TRUE al valor 1, pues 1L ya es un entero