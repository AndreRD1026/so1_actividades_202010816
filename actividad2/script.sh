#!/bin/bash

# Variable para almacenar el nombre del usuario GITHUB_USER.
echo Ingresa un usario de GitHub: 
read GITHUB_USER

# Validando que el usuario sea uno existente
EXIST=$(curl https://api.github.com/users/$GITHUB_USER | jq '.message')

# Si el usuario no retorna datos, se saca el mensaje de no existe.
if [ "$EXIST" = '"Not Found"' ]; then
 echo El usuario a buscar no existe

# Si retorna datos se procede a continuar.
else

# Hacer la petición a la api de github, agregando el usuario elegido.
CONSULT=$(curl https://api.github.com/users/$GITHUB_USER)

# Mediante jq buscar en el json la parte de 'id' y obtener su contenido.
ID_ACC=$(echo $CONSULT | jq '.id')

# Mediante jq buscar en el json la parte de 'created_at' y obtener su contenido.
CREATED_ACC=$(echo $CONSULT | jq '.created_at')

# Impresión del mensaje.
echo Hola $GITHUB_USER. User ID: $ID_ACC. Cuenta fue creada el: $CREATED_ACC.

# Obteniendo la fecha actual.
SCRIPT_DATE="$(date '+%Y-%m-%d')"

# Validando que el directorio exista, sino debe crearlo.
if [ ! -d /tmp/$SCRIPT_DATE ]; then
    mkdir -p /tmp/$SCRIPT_DATE
fi

# Salida del mensaje en un archivo log.
LOG_FILE="Hola $GITHUB_USER. User ID: $ID_ACC. Cuenta fue creada el: $CREATED_ACC."

# Crear el achivo log.
echo "$LOG_FILE" >> /tmp/$SCRIPT_DATE/saludos.log

# Fin del if y del programa.
fi

# Añadir el script al crontab.

# Obteniendo la ruta absoluta del script.
ABS_PATH=$(readlink -f "$0")

# Linea para agregar al crontab.
ADD_CRON="* * * * * $ABS_PATH"

# Verificando si ya existe la linea en el crontab.
if ! crontab -l | grep -qF "$ADD_CRON" ; then
    (crontab -l; echo "$ADD_CRON") | crontab -
fi