
# **Curso de Laboratorio R**

**Lista de ejercicios-Tarea 01**
---------------------------
1. Experimenta con los siguientes comandos e interpreta los resultados.
	
	`echo hello world`
	Literalmente nos muestra la frase que sigue a echo.
	
	`passwd`
	Solicita  el cambio de contraseña del usuario.
	
	`date`
	Muestra la fecha y hora justo luego de escribir dicho comando y púlsar enter.
	
	`hostname`
	Muestra el hostname de tu máquina.
	
	`arch`
	Muestra la arquitectura de la máquina del usuario.
	
	`uname -a`
	Muestra información completa del sistema.
	
	`dmesg | more`
	Examina y controla el kernel ring  butter.
	
	`uptime`
	Responde a la pregunta: ¿Cuánto tiempo lleva el sistema ha estado abierto?.
	
	`who am i`
	No muestra nada, tal cual está (separado).
	
	`who`
	Muestra qui´en esta en el sistema.
	
	`id`
	Retorna la identidad del usuario.
	
	`last`
	Muestra una lista de recientes ingresos al sistema buscando datos desde /var/log/wtmp file.
	
	`xx|`
	Enlista los .project y .plan del directorio home de cada usuario.
	
	`w`
	Muestra quién ha iniciado sesión y qué está haciendo.
	
	
	`top`
	Muestra en tiempo real la vista de procesos ejecutándose en el sistema.

2. Realiza las siguientes actividades

 - Crea dos directorios llamados **a1** y **a2** en el directorio /home.
	
	`fernando@Delgado:~$ mkdir a1`
	`fernando@Delgado:~$ mkdir a2`

- Copia el archivo /etc/passwd al directorio **a1** y escribe las primeras 30 líneas del archivo http://lifehacker.com/5633909/who-needs-a-mouse-learn-to-use-the-command-line-for-almost-anything al direcotorio **a2**

	`fernando@Delgado:~$ cp /etc/passwd a1/`
	` fernando@Delgado:~$ gedit page # Creo un archivo de texto para copiar la página`
	 `fernando@Delgado:~$ head -n 30 page  > a2/file`
 
 - Usa find para mostrar los nombres de todos los archivos en árbol de directorios de /home. 
 
	 `find . | less`  Hemos creado una tubería para mostrar de a pocos los archivos

 - Usa locate para encontrar todos los nombres de archivos que contengan la palabra commands en el árbol de directorios de /home.

	`locate command | grep ^/home/fernando`
	
 - Utilice find y grep y sort para mostrar una lista ordenada de todos los archivos en todos los subdirectorios de / home que contienen la palabra commands , R, Pythom en algún lugar dentro de ellos.
 
	 `find . | grep -e "commands" -e "Python" -e "R" | sort`


3. Ejecuta el siguiente script y explica qué es lo que hace.

	```#!/bin/sh
	for f in $*
	do
		 if [ -f  $f -a  ! -x  $f ]
		then
			case $f in
			core)
				echo "$f: archivo de memoria"
					;;
			*.c)
				echo "$f: un programa en C"
					;;
			*.cpp|*.cc|*.cxx)
				echo "$f: un programa en C++"
					;;
			*.txt)
				echo "$f: un archivo de texto"
					;;
			*.pl)
				echo "$f: un script de Perl"
					;;
				*.html|*.htm)
				echo "$f: un documento web"
				;;
			*)
				echo "$f: parece ser  "`file -b $f`
					;;
			esac
		fi
	done
	```
	Al pasarle por argumento al programa el archivo `hola.py` el script mostró lo siguiente:
	
	`hola.py: aparece ser  ASCII text`
		
	Al pasarle el archivo `hola.c` el script mostró:
	
	`hola.c: un programa en C`
		
	Esto nos da la idea de que el programa intenta clasificar el archivo pasado como argumento. 

4. Sigue los siguientes pasos para ejecutar el siguiente script llamado bash_script:
	```
	#!/bin/sh
	# este es un comentario
	echo "El numero de argumentos es  $#"
	echo "Los argumentos son $*"
	echo "El primero es $1"
	echo "Mi numero de proceso es  $$"
	echo "Ingresa un numero desde el teclado: "
	read numero
	echo "El numero que has ingresado es $numero"
	```
	Para ejecutar el script se realiza lo siguiente:
	```
	ls -l bash_script
	chmod +x bash_script
	ls -l bash_script
	./bash_script hola a todos
	```
	El resultado fue el siguiente:
	```
	El numero de argumentos es  3
	Los argumentos son hola a todos
	El primero es hola
	Mi numero de proceso es  10324
	Ingresa un numero desde el teclado: 
	0
	El numero que has ingresado es 0
	```
5.  Prueba en secuencia los siguientes comandos y explica tus pasos:

	`cd`
	Nos lleva a /home/fernando
	
    `pwd`
    imprime el directorio de trabajo, es decir, /home/fernando
    
    `ls -al`
    Enlista todos los archivos, ocultos y no ocultos con sus respectivos permisos, tamaños, nombres entre otros.
    
    `cd .`
    Nos deja en el mismo directorio actual.
    
    `pwd`
    Imprime nuestro directorio de trabajo, que nuevamente es, /home/fernando.
    
    `cd ..`
    Nos lleva a un directorio antes, en este caso /home
    
    `pwd`
    Nuestro directorio de trabajo ahora es /home
    
    `ls -al`
    Enlista los archivos y directorios con sus respectivvos permisos, nombres, tamaños, etc; pero esgta vez de /home.
    
    `cd ..`
    Nos lleva al directorio anterior, es decir a /
    
    `pwd`
    Ahora nos muestra /
    
    `ls -al`
    Enlista los permisos, nombres y tamaños, entre otros, de los archivos y directorios pero esta vez de / 
    
    `cd ..`
    Ya no nos lleve a ningún lado, permanecemos en /
    `pwd`
    Muestra /
    
    `cd /etc`
    Nos lleva al directorio /etc
    
    `ls -al | more`
    Enlista los permisos, nombres, entrer otros, de los archivos y directorios de /, gracias a la "tubería" more este enlistado es por mostrado condicionado a pulsar `enter`
    
   ` cat passwd`
   Muestra el contenido del archivo de nombre `passwd`
   
   ` cd -`
   Nos lleva al direcorio inmediato anterior en el que nos encontrábamos, en este caso a /
   
    `pwd`
    Muestra /

6. Revisa el archivo `chipotle.tsv` dentro del repositorio del curso, en la carpeta donde se aloja esta tarea. Piensa un minuto en cómo se estructuran los datos. 
 * ¿Qué crees que significa cada columna?

	   `order_id` es el identificador de la orden: `quantity` representa la cantidad de cada orden: `item_name` viene a ser los nombres que se piden en las ordenes;  `choioce_description` nos da más detalles de la ordenes: `item_price` es el precio de la orden.
   
 *  ¿Qué crees que significa cada fila?. 

	 Cada orden contiene es repartida en una o más filas.
 
 Responde las siguientes preguntas.

* ¿Cuántas órdenes aparecen en el archivo?

		`1834` órdenes, pues ese es el número más alto en la columna `order_id`
* ¿Cuántas líneas hay en este archivo?

		Usamos `wc -l chipotle.tsv`y nos da `4623` líneas


* ¿Qué burrito es más popular, el de carne o pollo?
	Hallamos el número de `chicken burrito con `grep -i "chicken burrito" chipotle.tsv | wc -l` y nos da `553`. Mientras que el número de `steak burrito` al hallarlo con `grep -i "steak burrito" chipplote.tsv | wc -l` nos da `338`; por lo que el `chicken burrito` es el más popular.
	
* ¿Los burritos de pollo tienen más frecuentemente frijoles negros o frijoles pintos?

		Usamos `grep -i 'chicken burrito' chipotle.tsv | grep -i 'black beans' | wc -l` para hallar el número de frijoles negros`282`; mientras 	que  para frijoles pintos al usar `grep -i 'chicken burrito' chipotle.tsv | grep -i 'pinto beans' | wc -l` nos da `105`. Por lo tanto la respuesta es frijoles negros.

 * Haga una lista de todos los archivos CSV o TSV en el repositorio del curso (usando un solo comando). Piense en cómo los caracteres comodín pueden ayudarte con esta tarea. Cuente el número aproximado de apariciones de la palabra "dictionary" (independientemente del caso) en todos los archivos del repositorio del curso.

	Puesto que buscamos archivos, recurrimos a  `find`  y usamos `find . -name *.?sv` 