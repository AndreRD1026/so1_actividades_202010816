#!/bin/bash

# Crear los named pipes

mkfifo participante1_a_participante2
mkfifo participante2_a_participante1

# Verificar y crear los named pipes si no existen
if [ ! -p participante1_a_participante2 ]; then
    mkfifo participante1_a_participante2
fi

if [ ! -p participante2_a_participante1 ]; then
    mkfifo participante2_a_participante1
fi

# Función para el participante 1
participante1() {
    while true; do
        # Leer mensajes del otro participante
        read message < participante2_a_participante1
        echo "Participante 2: $message"
    done
}

# Función para el participante 2
participante2() {
    while true; do
        # Leer mensajes del otro participante
        read message < participante1_a_participante2
        echo "Participante 1: $message"
    done
}

# Iniciar participante 1 en segundo plano
participante1 &

# Iniciar participante 2 en segundo plano
participante2 &

# Escribir mensajes
while true; do
    read -p "Participante 1: " message
    echo "$message" > participante1_a_participante2

    read -p "Participante 2: " message
    echo "$message" > participante2_a_participante1
done

# Limpiar al finalizar
trap "rm -f participante1_a_participante2 participante2_a_participante1" EXIT
