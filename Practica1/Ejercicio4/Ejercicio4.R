# Nombre: Kevin Fenando Delgado Santos 20150026J
# Respuesta ak Ejercicio 4, en el que primero nos piden observar la función tst()

tst4 <- function(x){
  if (x < 2) "muy negativo"
  else if (x < 1) "cercano a cero"
  else if (x < 3) "in [1, 3)"
  else "large"
}

# Respuesta al ítem (a), en el cual nos piden correr la función para x = 0,
# x = Inf, x = 2.

tst4(0)
tst(Inf)
tst(2)

# Respuesta al 