# Completely Fair Scheduler

# Descripción del Completely Fair Scheduler (CFS) de Linux

El Completely Fair Scheduler (CFS) es un algoritmo de programación de procesos utilizado en el kernel de Linux para distribuir equitativamente el tiempo de CPU entre los procesos en ejecución.

## Características principales del CFS:

1. **Equidad**: El CFS busca proporcionar una distribución justa del tiempo de CPU entre los procesos en ejecución. Cada proceso tiene una oportunidad justa de acceder a la CPU, independientemente de su prioridad o carga de trabajo.

2. **Sin prioridades estáticas**: A diferencia de otros algoritmos de planificación de procesos que asignan prioridades estáticas a los procesos, el CFS utiliza una asignación dinámica del tiempo de CPU. Esto significa que los procesos no tienen prioridades fijas; en su lugar, el tiempo de CPU se asigna proporcionalmente según las necesidades del proceso en relación con otros procesos en ejecución.

3. **Basado en el tiempo**: El CFS mide el tiempo de CPU utilizado por cada proceso y utiliza esta información para calcular la proporción de tiempo de CPU que se asignará a cada proceso. Los procesos que han utilizado menos tiempo de CPU recibirán una mayor asignación de CPU en comparación con los procesos que han consumido más tiempo de CPU.

4. **Utilización del tiempo virtual**: El CFS utiliza un concepto llamado "tiempo virtual" para realizar un seguimiento del tiempo de CPU utilizado por cada proceso. El tiempo virtual se incrementa a una tasa que depende de la prioridad dinámica del proceso y se utiliza para calcular la proporción de tiempo de CPU asignado a cada proceso.

## Funcionamiento del CFS:

1. **Mantenimiento de la lista de ejecución**: El CFS mantiene una estructura de datos llamada "árbol rojo-negro" para organizar los procesos en una cola de ejecución. Cada nodo del árbol representa un proceso en ejecución y está ordenado según su tiempo virtual.

2. **Selección del próximo proceso**: Cuando el sistema operativo necesita seleccionar el próximo proceso para ejecutar en la CPU, el CFS elige el proceso con el menor tiempo virtual, lo que significa que el proceso que ha utilizado menos tiempo de CPU tiene la prioridad para ejecutarse a continuación.

3. **Asignación del tiempo de CPU**: Una vez que se ha seleccionado un proceso para ejecutarse, el CFS asigna un quantum de tiempo de CPU al proceso. El quantum de tiempo se calcula dinámicamente en función de la carga del sistema y del número de procesos en ejecución.

4. **Actualización del tiempo virtual**: Después de que un proceso ha utilizado su quantum de tiempo asignado, se actualiza su tiempo virtual en función de la cantidad de tiempo de CPU utilizado. Esta actualización asegura que los procesos que han utilizado menos tiempo de CPU tengan prioridad para ejecutarse en el futuro.
