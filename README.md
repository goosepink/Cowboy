# videos de la copilacion 
### ver los primeros 25 min aprox
[![asciicast](https://asciinema.org/a/0Z8r5oY3PHSAmVZtptgqxGrWR.svg)](https://asciinema.org/a/0Z8r5oY3PHSAmVZtptgqxGrWR)
### copilacion y lanzamiento del server

[![asciicast](https://asciinema.org/a/R5PovnzDtHqbiaeJIIiBIESxW.svg)](https://asciinema.org/a/R5PovnzDtHqbiaeJIIiBIESxW)

### imagenes de resultado

![Screenshot 2024-10-02 154203](https://github.com/user-attachments/assets/68794081-f44f-49b9-8979-87c0b4af19fb)

![Screenshot 2024-10-02 154248](https://github.com/user-attachments/assets/ddc50d99-c607-4121-98f0-f11e114bfe56)



---
### Fundamentos de Erlang:

#### 1. ¿Qué características de Erlang lo hacen adecuado para aplicaciones de alta concurrencia y escalabilidad?

Erlang fue diseñado específicamente para sistemas distribuidos y altamente concurrentes, como redes de telecomunicaciones. Las características clave que lo hacen adecuado incluyen:
- **Procesos ligeros**: Los procesos en Erlang son extremadamente ligeros en comparación con los hilos del sistema operativo. Estos procesos se crean en grandes cantidades sin sobrecargar la memoria o el rendimiento.
- **Modelo de concurrencia basado en actores**: En lugar de usar memoria compartida, Erlang usa un modelo de actores donde los procesos se comunican mediante paso de mensajes asíncronos. Esto reduce los bloqueos y problemas comunes de sincronización en sistemas altamente concurrentes.
- **Escalabilidad horizontal**: Erlang está diseñado para ejecutarse en entornos distribuidos, lo que facilita la escalabilidad al agregar más nodos o máquinas.
- **Tolerancia a fallos**: Erlang tiene un enfoque "let it crash" (deja que falle), donde los procesos fallidos son manejados por otros procesos supervisores, lo que garantiza que los fallos no afecten a todo el sistema.

#### 2. Explica el modelo de actores en Erlang y cómo se aplica en la gestión de procesos concurrentes.

El modelo de actores en Erlang implica que cada proceso es un "actor" que puede:
- **Crear otros procesos**.
- **Enviar y recibir mensajes** (comunicación asíncrona).
- **Actuar de manera independiente**, sin compartir memoria.

Los procesos en Erlang no bloquean ni compiten por recursos compartidos. En su lugar, se comunican mediante el paso de mensajes, lo que evita las condiciones de carrera y otros problemas de concurrencia. Cada proceso tiene su propio estado, y la única manera de influir en otro proceso es enviándole un mensaje. Esto es fundamental para gestionar la concurrencia en sistemas distribuidos y de alta disponibilidad.

### Características de Cowboy:

#### 1. ¿Cuáles son las principales ventajas de usar Cowboy como servidor HTTP en aplicaciones Erlang?

- **Ligero y rápido**: Cowboy es un servidor HTTP minimalista, diseñado para ser eficiente y rápido, con una huella de memoria pequeña.
- **Compatible con el ecosistema de Erlang**: Aprovecha las capacidades nativas de Erlang para manejar la concurrencia, la distribución y la tolerancia a fallos.
- **Soporte para múltiples protocolos**: Además de HTTP, Cowboy soporta WebSockets y HTTP/2, lo que lo hace adecuado para aplicaciones modernas que requieren comunicación en tiempo real.

#### 2. Describe cómo Cowboy maneja las conexiones concurrentes de manera eficiente.

Cowboy utiliza los procesos ligeros de Erlang para manejar cada conexión. Cada solicitud HTTP se ejecuta en su propio proceso, lo que permite manejar miles de conexiones concurrentes sin saturar el sistema. Esto es eficiente porque:
- **Los procesos de Erlang consumen muy poca memoria**.
- **No hay necesidad de sincronización compleja**, ya que cada proceso es independiente y se comunica a través de mensajes.
- **Supervisión y tolerancia a fallos**: Si una conexión falla, sólo el proceso correspondiente se ve afectado, mientras que el resto del sistema continúa funcionando normalmente.

### Uso en la Industria:

#### 1. Menciona tres empresas que utilizan Erlang/Cowboy en su infraestructura y explica brevemente cómo lo emplean.

1. **WhatsApp**: Utiliza Erlang para manejar millones de conexiones simultáneas con baja latencia. El uso de procesos ligeros de Erlang permite que los servidores manejen grandes volúmenes de mensajes y conexiones en tiempo real.
2. **Heroku**: Su plataforma de "dynos" está construida en parte sobre Erlang para manejar las conexiones HTTP y la gestión de servicios en su plataforma de aplicaciones en la nube.
3. **AdRoll**: Emplea Cowboy para construir servidores de alta concurrencia que manejan campañas publicitarias en tiempo real y procesan millones de peticiones de anuncios por segundo.

#### 2. ¿En qué tipos de aplicaciones es menos común utilizar Cowboy y por qué?

Cowboy es menos común en aplicaciones con interfaces gráficas (GUI), procesamiento intensivo de gráficos o cálculos pesados (como los juegos 3D o aplicaciones científicas). Esto se debe a que Cowboy está optimizado para manejar solicitudes HTTP, WebSockets y otras interacciones web, mientras que para cálculos intensivos, lenguajes como C o Python (con bibliotecas especializadas) pueden ser más adecuados.

### Integración con Otros Frameworks:

#### 1. ¿Cómo se integra Cowboy con el framework Phoenix en Elixir?

Phoenix, un popular framework web de Elixir, utiliza Cowboy como su servidor HTTP subyacente para manejar solicitudes. Phoenix se basa en el ecosistema de Erlang, y Cowboy es la opción predeterminada para manejar la comunicación HTTP y WebSocket en sus aplicaciones. Elixir compila en la misma máquina virtual de Erlang (BEAM), lo que permite una integración perfecta con Cowboy.

#### 2. Explica la relación entre Phoenix Channels y Cowboy en el manejo de WebSockets.

Phoenix Channels es una abstracción que facilita la comunicación en tiempo real a través de WebSockets, que son gestionados por Cowboy en la capa inferior. Cowboy maneja las conexiones WebSocket de forma concurrente, y Phoenix Channels proporciona la lógica de aplicación para enviar y recibir mensajes a través de esas conexiones. Esta arquitectura permite la creación de aplicaciones con interactividad en tiempo real, como chats y notificaciones en vivo.

### Desafíos y Consideraciones:

#### 1. ¿Cuáles son los principales desafíos al aprender y utilizar Cowboy para nuevos desarrolladores?

- **Curva de aprendizaje del modelo de actores**: Para los nuevos desarrolladores, puede ser difícil adaptarse al modelo de procesos ligeros y comunicación basada en mensajes de Erlang.
- **Configuración inicial**: Cowboy es un servidor HTTP minimalista, lo que significa que no incluye muchas características predeterminadas. Los desarrolladores deben construir muchas funcionalidades desde cero o mediante bibliotecas adicionales.
- **Documentación limitada**: Aunque hay buenos recursos para aprender Erlang, la documentación de Cowboy puede ser menos accesible o detallada para principiantes.

#### 2. Discute cómo la tolerancia a fallos de Erlang beneficia a las aplicaciones desarrolladas con Cowboy.

Erlang está diseñado con tolerancia a fallos en mente, lo que significa que las aplicaciones desarrolladas con Cowboy heredan esta capacidad. Erlang utiliza el concepto de supervisores, que son procesos especiales encargados de reiniciar otros procesos en caso de fallo. Si una conexión HTTP manejada por Cowboy falla, solo el proceso correspondiente es reiniciado, sin afectar a todo el sistema. Esto permite que las aplicaciones mantengan alta disponibilidad y se recuperen rápidamente de errores sin interrumpir el servicio.

