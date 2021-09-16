# con esta sentencia se indica el archivo de salida 
# para poder ver los resultados
set logging file outputReto3.txt

# para que las salidas de print se vean bien
set print pretty on

# para que las salidas de los comandos se registren
set logging on

# para evitar que gdb haga preguntas y\n
set pagination off

# para fijar el argumento del programa que se va a depurar
set args 10

# para indicar el archivo que se va a depurar
file Reto3

# para fijar un breakpoint en main
b _start

# para fijar un breakpoint en salida
b salida

# para fijar un breakpoint en salida2
b salida2

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
ni
ni
ni
# se verifica antes de entrar al bucle1
echo ANTES DE BUCLE1
i r rcx
i r rbx
# salta a la salida, teniendo la posicion final como inicial
c
echo DESPUES DEL BUCLE1
i r rcx
i r rbx
# salta a la salida, teniendo la palabra volteada
c
echo DESPUES DEL BUCLE2
i r rcx
i r rbx
#salta para comprueba y terminar
echo RESULTADO
c
# aqui termina
echo FIN 

# gracias
