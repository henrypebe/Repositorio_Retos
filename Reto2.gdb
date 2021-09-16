# con esta sentencia se indica el archivo de salida 
# para poder ver los resultados
set logging file outputReto2.txt

# para que las salidas de print se vean bien
set print pretty on

# para que las salidas de los comandos se registren
set logging on

# para evitar que gdb haga preguntas y\n
set pagination off

# para fijar el argumento del programa que se va a depurar
set args 10

# para indicar el archivo que se va a depurar
file Reto2

# para fijar un breakpoint en main
b _start

# para fijar un breakpoint en main
b antes_loop

# para fijar un breakpoint en salida_2
b salida_2

# hook previo para echo
define hook-echo
echo <<<---
end

# hook posterior para echo
define hookpost-echo
echo --->>>\n
end

# aqui empieza el programa
echo INICIO

# para empezar a correr el programa
r

echo ANTES DE FACTORIAL
c
i r r8
i r r10

# aqui empieza el factorial
echo FACTORIAL

# salta a la salida_2 conteniendo el factorial completo
c
ni
i r rax
i r r8
i r r10
#salta para terminar
c
# aqui termina
echo FIN 

# gracias
