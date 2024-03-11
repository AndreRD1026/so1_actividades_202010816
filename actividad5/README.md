# Prueba de Procesos e hilos

1. **Completado del código**

```bash
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <sys/types.h>

void *thread_create(void *arg) {
  // Tarea del hilo
  printf("Hola desde el hilo!\n");
  return NULL;
}

int main() {
  pid_t pid;

  // Primer fork
  pid = fork();
  if (pid == 0) {
    // Segundo fork en el proceso hijo
    pid = fork();
    if (pid == 0) {
      // Proceso nieto
      // Se crea un hilo
      pthread_t tid;
      pthread_create(&tid, NULL, thread_create, NULL);
      pthread_join(tid, NULL);
    } else if (pid > 0) {
      // Proceso hijo
      // ...
    } else {
      // Error en el segundo fork
      perror("Error en el segundo fork");
      exit(1);
    }
  } else if (pid > 0) {
    // Proceso padre
    // ...
  } else {
    // Error en el primer fork
    perror("Error en el primer fork");
    exit(1);
  }

  return 0;
}
```

2. **Responder las preguntas**

<ol>
<li>¿Cuántos procesos únicos son creados?</li> <br>

<p> Se crean 4 procesos únicos:

- Proceso padre: El proceso original que inicia la ejecución.
- Proceso hijo 1: Creado por el primer fork.
- Proceso hijo 2: Creado por el segundo fork en el proceso hijo 1.
- Proceso nieto: Creado por el segundo fork en el proceso hijo 1.

<li>¿Cuántos hilos únicos son creados?</li> <br>

<p>Se crea 1 hilo único. </p>

</ol>
