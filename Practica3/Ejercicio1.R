# Kevin Fernando Delgado Santos 20150026J

# Creamo una función para poder aplicar paste()
# a cada elemento de cada miembro de la lista dada

# El código para una lista cualquiera qque cumpla con lo pedido por el
# problema es:
lapply(L, function(x) paste(x, sep = " ", "!")) # donde L es una lista

# En el caso pedido:
f3 <- list("a", c("b", "c", "d", "e"), "f", c("g", "h", "i"))
lapply(f3, function(x) paste(x, sep = " ", "!"))