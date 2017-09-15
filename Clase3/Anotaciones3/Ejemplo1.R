f <- function(x){ # Creamos una función f que tome como argumento a x}
	return(exp(x) - 1) # Devolvmos e^x - 1
}

limite_inferior <- -10 # Limite inferior para el Método
limite_superior <- 10 # Límite superior para el Método

# Mientra haya una diferencia mayor o igual a 10^-8, iteramos}
while(limite_superior - limite_inferior >= 1e^-8){
	punto_medio <- (limite_inferior + limite_superior)/2 # Tomamos el punto medio
	if (f(punto_medio) < 0){#Si es negativo, la raíz está en [punto_medio, limite_superiior]
	limite inferior <- punto_medio
	}
	else{# Si no, la raíz está en [límite_inferior, punto_medio]
	limite_superior <- punto _medio
	}
}
# Imprimimos al estilo del lenguaje C el valor aproximado de la raíz
sprintf("La raíz aproximada es %.8f\n", limite_superior)
