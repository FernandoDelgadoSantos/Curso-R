# Kevin Fernando Delgado Santos 201650026J

# Parte a)
# ítem 1)
plot.new() # Esta línea le dice a R que se va a producir un nuevo gráfico 
plot.window(range(pressure$temperature),
            range(pressure$pressure)) 
# plot.window() Establece los límites del eje x y del eje y
# respectivamente, en este caso son los puntos de las columnas temperature
# y pressure del arreglo pressure.
box() # dibuja una caja alrededor del gráfico
axis(1) # dibuja el eje x
axis(2) # dibuja el eje y
points(pressure$temperature, pressure$pressure) 
# points() llama al conjunto de puntos que serán graficados, en este caso
# son los puntos de las columnas temperature y pressure del arreglo pressure.
mtext("temperatura", side=1, line=3) 
# En la tercera línea (line = 3) debajo del gráfico (side = 1) 
# escribe "temperatura"
mtext("presion", side=2, line=3)
#  En la tercera línea (line = 3) al costado izquierdo del gráfico (side = 2) 
# escribe "presión"
mtext("Presion de vapor \ncomo una funcion de la Temperatura ",
        side=3, line=1, font=2)
#  En la primera línea (line = 1) encima del gráfico (side = 3) 
# escribe "Presion de vapor como una funcion de la Temperatura" con un 
# tamaño de letra de dos (font = 2).


# Parte b)
# Mostraremos tres gráficos del PDF de la variable aleatoria gamma
# juntos en una misma ventana.
# Primer resultado
gam1.1 <- function(x = 1:10) dgamma(x, shape = 1, rate = 1)
curve(gam1.1, from = 0, to = 20)

# Segundo resultado
gam2.1 <- function(x = 1:10) dgamma(x, shape = 2, rate = 1)
gam3.1 <- function(x = 1:10) dgamma(x, shape = 3, rate = 1)

curve(gam2.1, from = 0, to = 20, add = TRUE, col = "green")
curve(gam3.1, from = 0, to = 20, add = TRUE, col = "violet")

# Parte c)
# Primero particionamos a iris en tres subconjuntos, y calculamos 
# sus medias por separado, para luego unirlas mediante cbind()
iris.setosa <- iris[1:50, ]
mean.setosa <- apply(iris.setosa[-5], 2, mean)

iris.versicolor <- iris[51:100, ]
mean.vesicolor <- apply(iris.versicolor[-5], 2, mean)

iris.virginica <- iris[101:150, ]
mean.virginica <- apply(iris.virginica[-5], 2, mean)
t(cbind(mean.setosa, mean.virginica, mean.vesicolor))








