# Instalación del Servicio

1. **Crear el Script:**

   - _Descripción:_ Primero, necesitamos un script que imprima un saludo y la fecha actual con una pausa de un segundo.

   - _Instrucciones:_ Guarda este script como `saludo.sh` en una ubicación accesible, en este caso se guardó en `/home/andre`:

     ```bash
     #!/bin/bash
     while true
     do
         echo "Hola usuario de linux :D, la fecha actual es: $(date)"
         sleep 1
     done
     ```

2. **Crear el Archivo de Unidad systemd:**

   - _Descripción:_ Ahora, creamos un archivo de unidad systemd llamado `saludo.service` en `/etc/systemd/system/`. Este archivo le indicará a systemd cómo manejar nuestro script de saludo.

   - _Instrucciones:_ El contenido del archivo debería ser el siguiente:

     ```ini
     [Unit]
     Description=Script de Saludo

     [Service]
     Type=simple
     ExecStart=/home/andre/saludo.sh

     [Install]
     WantedBy=multi-user.target
     ```

3. **Actualizar systemd:**

   - _Descripción:_ Después de crear el archivo de unidad, es importante actualizar systemd para que reconozca el nuevo archivo.

   - _Instrucciones:_ Ejecuta el siguiente comando:

     ```bash
     sudo systemctl daemon-reload
     ```

4. **Habilitar el Servicio:**

   - _Descripción:_ Para que nuestro servicio se inicie automáticamente al arrancar el sistema, necesitamos habilitarlo.

   - _Instrucciones:_ Ejecuta el siguiente comando:

     ```bash
     sudo systemctl enable saludo.service
     ```

5. **Iniciar el Servicio:**

   - _Descripción:_ Ahora estamos listos para iniciar nuestro servicio por primera vez.

   - _Instrucciones:_ Ejecuta el siguiente comando:

     ```bash
     sudo systemctl start saludo.service
     ```

6. **Verificación de los Logs del Servicio:**

   - _Descripción:_ Una vez que el servicio está en funcionamiento, podemos verificar sus registros utilizando el comando `journalctl`.

   - _Instrucciones:_ Aquí hay algunos ejemplos útiles:

     - **Ver Todos los Registros del Servicio:**

       ```bash
       sudo journalctl -u saludo.service
       ```

     - **Ver Registros en Tiempo Real:**

       ```bash
       sudo journalctl -u saludo.service -f
       ```
