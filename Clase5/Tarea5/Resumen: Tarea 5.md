# **Optimizando código**

1.- Encuentra la parte más lenta de tu código (el cuello de botella más grande).
2.- Trata de eliminarlo (no siempre podrás).
3.- Repetir, hasta que tu código sea lo sufientemente rápido.

En estos tres pasos iterativos puede resumirse la idea de optimizar un código para hacerlo más rápido. Tres simples pasos que pueden ser un verdadero dolor de cabeza incluso para experimentados programadores. Estoy aquí para ayudarte, vengo con seis técnicas que pueden ser aplicadas en muchas situaciones. También te mostraré una estrategia general para implementar optimizaciones.

No intentes remover todos los cuellos de botella que encuentres en tu código. Sé pragmático, segundos ahorrados en el tiempo de tu ordenador no compensan las horas que pasaste eliminando las posibles ineficiencias de tu código. 

## Medición de desempeño:

Para medirlo necesitamos de algún *profiler*, `R` usa uno llamado *sampling or statistical profiler*. Este detiene el código cada unos pocos milisegundos y registra qué función se esta ejecuetanto actualmente(junto con qué función la llamó y así sucesivamente).
Si consideramos `f()`:

`library(lineprof)
f <- function() {
  pause(0.1)
  g()
  h()
}
g <- function() {
  pause(0.1)
  h()
}
h <- function() {
  pause(0.1)
}`

Si perfilamos la ejecución de `f()` nos resulta que el código emplea `0.1` segundos ejecutando `f()`, luego `0.2` segundos ejecutando `g()` , por último, `0.3` segundos ejecutando `h()`. Como se muestra debajo:

`f() 
f() > g()
f() > g() > h()
f() > h()`

Obtenddremos un resultado poco claro si perfilamos `f()` usando el siguiente código:

`tmp <- tempfile()
Rprof(tmp, interval = 0.1)
f()
Rprof(NULL)`

Esto pues es difícil perfilar de manera precisa el código sin ralentizarlo por medio de varios órdenes de magnitud.
Existe cierta variablididad en la precisión del temporizador y el tiempo que toma realizar cada operación, por lo que para cada perfilación se tendrán respuestas ligeramente diferentes. La buena noticia es que no se necesita una precisión milimétrica para identificar las  partes más lentas del código.

En lugar de concentrarnos en llamados individuales, visualizaremos agregados con la ayuda del paquete `lineprof`.
Las unidad fundamental de análisis de este paquete es una sola línea de código. Aunque comparada con otras opciones, esto la hace menos precisa, pues la línea analizada puede contener muchos llamados a otras funciones, su ventaja es la facilidad con la que nos permite entender el contexto.

Para usar `lineprof`, primero guardamos el código en un archivo y en la fuente `source()` Ahora `profiling-example.R` contiene las definiciones de `f()`, `g()` y `h()`. Luego usamos `lineprof` para ejecutar nuestra función, y obtener el tiempo de salida.  La columna de `time` nos estima cuánto tarda en ejecutarse, y la columna de `ref` nos dice que línea de código fue ejecutada.

`library(lineprof)
source("profiling-example.R")
l <- lineprof(f())
l`

Usaremos el paquete `shine(1)` para explorar interactivamente la estructura de datos que nos acaba de proporcionar `lineprof` .
`shine(1)` abrirá un nuevo panel con tu código fuente anotado con informatciónacerca de cuánto tiempo toma ejecutar cada línea. Para salir debes usar `ctrl + c`. La columna `t` te dice el tiempo que tarda en cada en ejectutar cada línea. Aunque no es precisa esta medición, nos permite  detectar los cuellos de botella.  así esta técnica nos ayuda a identificar de forma rápida los cuellos de botella más grandes en tu código.

# Limitaciones

Existen otras limitaciones al perfilamiento.
 * El perfilamiento no se extiende al código C, y sinceramente no tengo idea de cómo perfilar código compilado.
 * Del mismo modo, no puedes ver que esta sucediendo dentro de las funciones primitivas o de los código compilados del código de bytes.
 * Si estás haciendo progreamación funciional con muchas funciopnes anónimas. Puede ser difícil detectar exactamente qué función ha sido llamada. Si quieres evitar esto, simplemente proporciona un nombre a todas tus funciones.
 * Evaluación diferida significa que los argumentos son, a menudo, evaluados dentro de otra función. Si esto te resulta confuso, puedes crear varibles temporales para forzar que el cálculo se de antes.
 

# Mejorando el desempeño:

Ahora que detectaste el cuello de botella gracias al perfialmiento, necesitas hacerlo más rápidos. En mi libro, las siguientes secciones te propor cionarán un buen número de técnicas para este fin:
1.- Look for existing solutions.
2.- Do less work.
3.- Vectorise.
4.- Parallelise.
5.- Avoid copies.
6.- Byte-code compile.

La técnica fianl puede ser reescribir el código en un lenguaje más rápido, como `C++`. Esto lo hace `Rcpp`

Paso ahora a describir una técnica general y de estilo organizacional que es útil cuando trabajamos con desempeño.


# Organización de código

1.- Escribir un veloz pero incorrecto código
2.- Escribir un código que crees que es más rápido, pero que en realidad no es tan bueno.

Son las dos trampas en las que se cae a menudo a la hora de tratar de escribir código más veloz. Por lo que te presento la siguiente estrategia para evitarlos:

Cuando te enfrentas a un cuello de botella, escribe una función para cada idea que tengas de solucionarlo. Así podrás verificar que cada una de ellas te retorne los valores esperados y el tiempo que tarda cada una de ellas. Comparemos las medias:

`mean1 <- function(x) mean(x)
mean2 <- function(x) sum(x) / length(x)`

Siempre sugiero que se guarden los intentos exitosos y lo que no lo fueron, para qué estés bien armado ante problemas futuros que se asemejan al que enfrentas actualmente.

Los siguiente es generar un test para un caso representativo. Este caso debe ser grande y pequeño a la vez, para poder asemenjarse a tu verdadero problema y poder ejecutarse en unos pocos segundos. `stopifnot()` y `all.equal` nos ayudarán a corroborar que para nuestro test, todas las variantes retornen el mismo resultado.

`x <- runif(100)
stopifnot(all.equal(mean1(x), mean2(x)))`

Finalmente, usa el paquete `microbenchmark`para comparar cuánto demora cada variación.

`microbenchmark(mean1(x), mean2(x))`

Antes de que te pongas a jugar y experimentar, fíjate una velocidad objetivo que defina cuando el cuello de botella de tu código no es más un problema; esto es muy importante pues no queires perder tiempo valiioso sobre-optimizando tu código.

# ¿Alguien ya ha resuelto el problema?

Con un código organizado y las variantes que se te ocurrieron ya ejecutadas, es interesante ver qué han hecho los demás. Para empezar, recomiendo
 * CRAN task view. Si tu cuello de botella aparece acá, dale un vistazo a los paquetes listados.
 * CRAN page. Contiene dependencias inversas.

Un reto es describir tu cuello de botella de tal manera que te ayudé a encontrar problemas parecidos y soluciones. Pero si lees lo suficiente de estadística y algortimos, no te será tan difícil. Claro que también le puedes preguntar a tus colegas o buscar en Google o preguntar en stackoverflow.

# Haz lo menos posible:

La manera más fácil de hacer a una función más veloz es dándole menos trabajo. Para esto debes tener en cuenta el tipo de entrada y salida de las funciones.  Por ejemplo`rowSums()`, `colSums()`, `rowMeans()`, y `colMeans()` son más rápidas que sus correspondientes invocaciones que usan `apply()` por que ellas entán vectorizadas. Para conocer esto, debes tener un buen vocabulario, es decir, necesitas leer con regularidad código en `R`.

Evita coercionar tus datos con funciones que tengan esta capacidad, pues esto siginifica más trabajo. Busca funciones que acepten tus datos tal cual son, o replantea la manera en la que guardado los datos. Algunas funciones también hacen menos trabajo cuando les das información acerca del problema, por ejemplo `unlist(x, use.names = FALSE)` es más rápida que `unlist()`.

*Method dispatch* puede resultar costoso en R, por lo que evittándolo puedes hacer funciones más rápidas. Por ejemplo llamar a `mean.default()` es un poco más veloz que llamando a `mean()` para vectores pequeños. 

`x <- runif(1e2)`

`microbenchmark(
  mean(x),
  mean.default(x)
)`

Sabiendo desde el principio con qué tipo de entradas estás tratando puede facilitar las cosas para escribir un código veloz. Por ejemplo el siguiente código es veinte veces más rápido que usar `as.data.frame`:

`quickdf <- function(l) {
  class(l) <- "data.frame"
  attr(l, "row.names") <- .set_row_names(length(l[[1]]))
  l
}`

`l <- lapply(1:26, function(i) runif(1e3))
names(l) <- letters`

`microbenchmark(
  quick_df      = quickdf(l),
  as.data.frame = as.data.frame(l)
)`

Nota que este método solo es más rápido con las correctas entradas, de lo contrario:

`quickdf(list(x = 1, y = 1:2))`

La mayoría de funciones en `R` están escritas para ser flexifles y funcionables, sin preocuparse en gran medida por el desempeño, por lo que re-escribirlas para tus necesidades específicas puede conllevarte a mejoreas substanciales.

El siguiente ejemplo muestra una simplificación progresiva de la función `diff()` si es que lo único que quieres es computar diferencias entre valores adjuntos. La función inicial es extensa y confusa, pero restringiendo los argumentos no solo la hemos hecho dos veces más veloz, sino que ahora se entiende más fácilmente.

`diff1 <- function (x, lag = 1L, differences = 1L) {
 ismat <- is.matrix(x)
  xlen <- if (ismat) dim(x)[1L] else length(x)
  if (length(lag) > 1L || length(differences) > 1L || lag < 1L || differences < 1L)
     stop("'lag' and 'differences' must be integers >-= 1")`

    `if (lag * differences >= xlen) {
   return(x[0L])
  }`

   `r <- unclass(x)
   i1 <- -seq_len(lag)
      if (ismat) {
     for (i in seq_len(differences)) {
       r <- r[i1, , drop = FALSE] - 
         r[-nrow(r):-(nrow(r) - lag + 1L), , drop = FALSE]`
   ` }
  } else {
    for (i in seq_len(differences)) {
      r <- r[i1] - r[-length(r):-(length(r) - lag + 1L)]
  }
  }
  class(r) <- oldClass(x)
  r}`

Ṣi asumimos vectores como entradas, podremos remover `is.matrix()`

`diff2 <- function (x, lag = 1L, differences = 1L) {
  xlen <- length(x)
  if (length(lag) > 1L || length(differences) > 1L || 
      lag < 1L || differences < 1L)
    stop("'lag' and 'differences' must be integers >= 1")`

 ` if (lag * differences >= xlen) {
    return(x[0L])
  }`

`  i1 <- -seq_len(lag)
  for (i in seq_len(differences)) {
    x <- x[i1] - x[-length(x):-(length(x) - lag + 1L)]
  }
  x
}`

`diff2(cumsum(0:10))`

Si asumimos ahora que `difference = 1L`, se elimina el bucle `for`:

`diff3 <- function (x, lag = 1L) {
  xlen <- length(x)
  if (length(lag) > 1L || lag < 1L)
    stop("'lag' must be integer >= 1")`

  `if (lag >= xlen) {
    return(x[0L])
  }`

  `i1 <- -seq_len(lag)
  x[i1] - x[-length(x):-(length(x) - lag + 1L)]
}
diff3(cumsum(0:10))
`

Finalmente, asumimos `lag = 1L`, esto elimina el chequeo de las entradas y simplifica el `subsetting`

Ahora `diff4()` es considerablemente más veloz y simple que `diff1()`.

`x <- runif(100)
microbenchmark(
  diff1(x),
  diff2(x),
  diff3(x),
  diff4(x)
)`

Como ejemplo final de que una función realice menos trabajo, tenemos en caso de simplificar las estructuras de datos. Vemos en las siguientes líneas que trabajar con vectores es casi dos veces más rápido.

`sample_rows <- function(df, i) sample.int(nrow(df), i, 
  replace = TRUE)
  `

` # Generate a new data frame containing randomly selected rows
boot_cor1 <- function(df, i) {
  sub <- df[sample_rows(df, i), , drop = FALSE]
  cor(sub$x, sub$y)
}`

`# Generate new vectors from random rows
boot_cor2 <- function(df, i ) {
  idx <- sample_rows(df, i)
  cor(df$x[idx], df$y[idx])
}`

`df <- data.frame(x = runif(100), y = runif(100))
microbenchmark(
  boot_cor1(df, 10),
  boot_cor2(df, 10)
)`


# Vectorización

Es más que evitar la elaboración de bucles, aunque suele ser un paso. Vectorizaar es tener un enfoque de "todo el objeto" para el problema, pensar en vectores y no en escalares. Los dos atributos principales con los que cuenta una función vectorizada son los siguientes:
 * Los problemas se vuelven más simples al emplear esta función. 
 * Los bucles de la función vectorizadas no erstán escritos en `R`,
 sino en `C`, donde son más veloces.

Vectorizar un código es más que usar `apply()` o `lapply()`, esas funciones mejoran la interfaz de la función, pero no cmabian fundametnalmente el desmpeño. Usar vectorización para el dsempeño significa encontrar la función existente en `R` que es implementada en `C` y que sea la más aplicable a tu problema.

El álgebra de matrices es un ejemplo general d ematrices, existen bucles que son ejecutados por librerías externas alatamente eficientes como `BLAS`. Si te es posible visualizar tu problema de tal forma que el álebra de matrices lo solucionará, entonces siempre podrás obtener un código realmente veloz. 

Las desventajas de usar vecetorización es que vuelve difícil el ejercicio de la predicción de cómo las operaciones crecerán. En el siguiente ejemplo se ve que revizar 100 elementos, a `R` le toma alrededor de nueve veces el tiempo que emplearpia en revisar un elemento:

`lookup <- setNames(as.list(sample(100, 26)), letters)`

`x1 <- "j"
x10 <- sample(letters, 10)
x100 <- sample(letters, 100, replace = TRUE)`

`microbenchmark(
  lookup[x1],
  lookup[x10],
  lookup[x100]
)`

Si bien es cierto que vectorizaciones de algoritmos existentes no resolverán todos los problemas, recuerda que siempre puedes ir a C++ y escribir tu propia función vectorizada, con la ayuda del paquete Rcpp.


# Evita copias

Cuando usas c(), append(), cbind(), rbind(), o paste() para crear objetos más grandes, R debe primero separar espacio para el nuevo objeto y luego copiar el viejo objeto a su nueva casa. Si haces esto dentro, por ejemplo, de un bucle for te resultará muy caro. Ejemplificamos el problema con un ejemplo:

`random_string <- function() {
  paste(sample(letters, 50, replace = TRUE), collapse = "")
}
strings10 <- replicate(10, random_string())
strings100 <- replicate(100, random_string())`

`collapse <- function(xs) {
  out <- ""
  for (x in xs) {
    out <- paste0(out, x)
  }
  out
}`

`microbenchmark(
  loop10  = collapse(strings10),
  loop100 = collapse(strings100),
  vec10   = paste(strings10, collapse = ""),
  vec100  = paste(strings100, collapse = "")
)`


# Compilación byte code

R 2.13.0 introduce el compilador byte code, que puede incrementar la velocidad de algunos códigos. Esta es una manera fácil de nseguir mejoras en lo referente a velocidad de código. El siguiente ejemplo muestra la versión pura de lapply() en R. También se ve que compilándola nos va una mejora relevante en velocidad.

`lapply2 <- function(x, f, ...) {
  out <- vector("list", length(x))
  for (i in seq_along(x)) {
    out[[i]] <- f(x[[i]], ...)
  }
  out
}`

`lapply2_c <- compiler::cmpfun(lapply2)`

`x <- list(1:10, letters, c(F, T), NULL)
microbenchmark(
  lapply2(x, is.null),
  lapply2_c(x, is.null),
  lapply(x, is.null)
)`

Aunque aquí se ve una gran mejora al usaar el compilador byte code, en muchos otros casos o oobtenido solo suele estar entre el cinco y diez porciento de mejora en velocidad. 
