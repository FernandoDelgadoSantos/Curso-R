# Kevin Fernando Delgado Santos 201650026J

#altura de padres:
popular <- data.frame(m = rnorm(100, 160, 20), f = rnorm(100, 160, 20))
popular

# Emparejamiento de padres y cálculo de altura de los hijos:
prox.gen <- function(popular) {
   popular$m <- sample(popular$m)
   popular$m <- apply(popular, 1, mean)
   popular$f <- popular$m
   return(popular)
}

prox.gen(popular)

list_gen <- list()
list_gen$gen_1 <- prox.gen(popular)

for (i in 1:9)
{
  list_gen[[i + 1]] <- prox.gen(as.data.frame(list_gen[[i]]))
  cat("generación ", i, "\n")
  print(list_gen[[i]])
}

gen_masc <- cbind(list_gen[[1]]$m, list_gen[[2]]$m, list_gen[[3]]$m, 
                  list_gen[[4]]$m, list_gen[[5]]$m, list_gen[[6]]$m, 
                  list_gen[[7]]$m, list_gen[[8]]$m, list_gen[[9]]$m)

hist(gen_masc, main="Histograma de las alturas masculinas en cada generación", 
     xlab="centímetros", 
     border="blue", 
     col="green")