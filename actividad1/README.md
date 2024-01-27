# Actividad 1

## Tipos de Kernel y sus diferencias

Un kernel es la parte central de un sistema operativo que gestiona los recursos del hardware y proporciona servicios a las aplicaciones. Hay diferentes tipos de kernels, y sus diferencias radican en la interacción con el hardware y la forma en que manejan las solicitudes del sistema.

### Comparación de Tipos de Kernel

| Tipo de Kernel  | Ventajas                                                                                                                 | Desventajas                                                                                                        | Ejemplos                                              |
| --------------- | ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------- |
| **Monolítico**  | - Alta eficiencia y rendimiento.<br>- Menos sobrecarga en la comunicación entre servicios.                               | - Menos seguro debido a la alta integración.<br>- Difícil de mantener y actualizar.                                | Linux, FreeBSD, Windows (en sus versiones anteriores) |
| **Microkernel** | - Mayor seguridad y estabilidad.<br>- Fácil de mantener y extender.                                                      | - Sobrecarga por comunicación entre servicios.<br>- Potencialmente menor rendimiento.                              | Minix, QNX, L4                                        |
| **Híbrido**     | - Equilibrio entre rendimiento y modularidad.<br>- Mejor seguridad que un kernel monolítico.                             | - Más complejo de diseñar.<br>- Puede sufrir problemas de rendimiento en algunos escenarios.                       | Windows NT, macOS XNU                                 |
| **Exokernel**   | - Eficiencia al permitir a las aplicaciones más control sobre los recursos.<br>- Flexibilidad en la gestión de recursos. | - Mayor complejidad en el desarrollo de aplicaciones.<br>- Menos madurez y soporte en comparación con otros tipos. | MIT's XOK/ExOS                                        |

## User vs Kernel Mode

El modo de usuario y el modo kernel son dos estados de operación de la CPU que permiten proteger la integridad del sistema operativo y sus datos.

| Modo        | Descripción                                                                                                                                                               | Ejemplos                                                   | Aspectos Clave                                                                                                                                                                                                             |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Usuario** | Las aplicaciones se ejecutan en este modo, con acceso limitado a los recursos del sistema para evitar que afecten directamente la estabilidad del sistema operativo.      | Aplicaciones como navegadores web, editores de texto.      | Las aplicaciones en modo usuario no pueden ejecutar instrucciones que interfieran con el funcionamiento del kernel.                                                                                                        |
| **Kernel**  | El sistema operativo y los controladores de dispositivo se ejecutan en este modo. Tiene acceso completo a los recursos del sistema y puede realizar operaciones críticas. | Componentes del sistema operativo, drivers de dispositivo. | - El kernel tiene privilegios completos para acceder y modificar cualquier parte del sistema.<br>- Las llamadas al sistema permiten a las aplicaciones en modo usuario solicitar servicios del kernel de forma controlada. |

## Interrupciones vs Trampas

Las interrupciones y las trampas son mecanismos fundamentales en los sistemas operativos para manejar eventos y llamadas al sistema, respectivamente. Ambos permiten al sistema operativo responder a diferentes situaciones y solicitudes.

| Tipo             | Descripción                                                                                                                                                        | Ejemplo                                                                            |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------- |
| **Interrupción** | Se produce externamente al programa en ejecución y es una señal que indica que se debe interrumpir el flujo normal de ejecución para manejar un evento específico. | Interrupciones de hardware como pulsaciones de teclado, movimientos del ratón.     |
| **Trampa**       | Es generada internamente por el programa en ejecución para solicitar un servicio del sistema operativo. Similar a una llamada al sistema, pero más localizada.     | Errores de programa, llamadas al sistema como solicitudes de I/O (Entrada/Salida). |

### Funcionamiento de Interrupciones y Trampas

1. **Interrupciones:**

   - Cuando se genera una interrupción, la CPU detiene la ejecución del programa actual.
   - Se guarda el estado actual del programa.
   - Se ejecuta una rutina de servicio de interrupción específica para manejar el evento.

2. **Trampas:**
   - Las trampas son generadas por instrucciones del programa, como una llamada al sistema.
   - La CPU cambia al modo kernel y ejecuta una rutina específica para atender la solicitud del programa.
   - Después de manejar la solicitud, el control se devuelve al programa y continúa su ejecución.

Estos mecanismos son fundamentales para la multitarea y la gestión eficiente de los recursos del sistema, permitiendo al sistema operativo responder rápidamente a eventos externos y solicitudes internas.
