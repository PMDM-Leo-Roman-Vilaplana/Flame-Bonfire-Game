#  Dungeon Escape

Dungeon Escape es un videojuego desarrollado con Flutter, utilizando las librerías Flame y Bonfire, reminiscente de los videojuegos del género RPG de los años 90 y 2000.
Nos pondremos en la piel de un héroe sin nombre con verdes ropajes cuyo objetivo es ser el más fuerte bajo el sol. Esta aventura nos mostrará una secuencia de escape de una mazmorra y nos dará un
soplo de libertad nada mas salimos a los bosques que rodean la funesta prisión que encerraba a nuestro personaje.

Podremos tener una experiencia que nos transporta 20 años al pasado, sin comprometer nuestro día a día, permitiéndonos jugar en diversos dispositivos, partiendo desde móviles hasta navegadores y sistemas operativos como Linux o Windows.
Esto es posible gracias a la posibilidad que nos proporciona Bonfire de tener esquemas de control diferentes en función del dispositivo en el que juguemos.

# Vídeos del Juego en Ejecución

**Video DEMO del juego en funcionamiento (en un navegador)** [aquí](https://www.youtube.com/watch?v=USLmxgHlwjE).

**Video Explicativo de algunos sistemas del Juego** [aquí]().

#Muestra de la UI en Dispositivos Móviles

Aunque ambos videos de muestra del videojuego han sido realizados grabando el navegador, podremos ver la UI en dispositivos móviles en la siguiente imagen:

![UI Dungeon Escape](https://media.discordapp.net/attachments/800737769450242098/1116668322981879910/ui_dungeon_escape.jpg?width=832&height=468 "UI móvil en Dungeon Escape")

## Sistemas y Elementos del Videojuego

A continuación listaremos algunos de los sistemas o elementos más importantes del videojuego.

+ Sistema de Stamina
+ Sistema de Iluminación
+ Sistema de Movimiento Automátivo
+ Sistema de Observación
+ Sistema de Regeneración de Vida
+ Sistema de Caída y recepción de daño
+ Pantallas de Victoria y Derrota
+ Diferentes modelos de control (Teclado y Joysticks Táctiles)
+ Animaciones
+ Colisiones
+ Sensores o Triggers
+ Ataques: Rango y Melee
+ Música de Fondo y Efectos de Sonido
+ 2 Niveles
+ Objetos recolectables
+ Enemigos diversos
+ Jefe final con cambio de música de fondo al ser observado
+ Conversaciones con NPC
+ Daño residual por entorno
+ Mapas personalizados basados en Tilesets

## Programas, Librerías y Paquetes utilizados

A continuación, voy a listar algunos de las herramientas utilizadas durante el desarrollo de Dungeon Escape

Software

+ Android Studio (IDE)
+ Tiled (Creación de Mapas)
+ GIMP (Edicion de fotografías, tilesets..)
+ Notion (Organizacion)
+ GIT (Control de Versiones)
+ Spotify (Música)

Lenguajes de programación y Librerías / Paquetes.

+ Flutter
+ Dart
+ Flutter Flame
+ Flame Audio
+ Bonfire
+ Async

### ¿Porqué necesitamos un sistema de Stamina?

Stamina o Energía es un sistema implementado en numerosos videojuegos con el objetivo de limitar las acciones del jugador. Aunque limitar las acciones del jugador suena a algo desagradable, crea una dificultad añadida a través de la gestión de un nuevo recurso, que fuerza al jugador
a tener un aproximamiento a las situaciones del juego de una forma diferente.

### ¿Porqué necesitamos un sistema de Movimiento Automatico y Observación?

Si queremos crear un mundo vivo y verosímil, necesitaremos que aquellos que lo habiten se muevan por él de una forma creíble y automática. Esto incluye a ciudadanos como NPC o a enemigos, que patrullan la zona. Además, neceistaremos que éstos se acerquen al jugador cuando lo observen, ya sea para entablar una conversación o para tratar de atacarle.

### Ataques: Melee y a Distancia

Muchos juegos proporcionan modelos de combates híbridos, proporcionando al usuario con diferentes opciones para lidiar con cada situacion de combate. Debido a que nuestro personaje es un Ninja, podremos atacar con nuestra espada, haciendo mucho daño, pero recibiendo daño también. También podremos atacar a larga distancia lanzando nuestros shuriken, haciendo menos daño pero manteniéndonos a salvo. ¿Como derribarás a tu enemigo?

 ### ¿Cómo perder?¿Cómo ganar?¿Cuales son los objetivos del juego?
 
En vez de explicar de forma directa los objetivos del juego, dejamos que el jugador los intuya, a través del diálogo con los diversos NPC. Ya sea escapar de la mazmorra o liberar el bosque de una magia oscura, descubriremos a través del diálogo la forma de tener éxito en nuestras proezas, acercándonos poco a poco a ser los más fuertes bajo el sol.
 
Si nuestro héroe perdiese toda su vida, moriría, por lo tanto, perderemos si nuestra vida llega a 0. Para poder evitar esto, elimina enemigos para obtener botiquines y seguir por tu senda.

## Niveles: Mazmorra

Una mazmorra olvidada en la que se encuentran los prisioneros de guerras pasadas, a la que no ha ido nadie en mucho tiempo. Nadie ha entrado. Nadie ha salido. Solo quedan los prisioneros y los guardias, nada podrá impedir un motín y es probable que la prisión no lo pueda resistir debido a su decrépito estado.

![Nivel 1: Mazmorra](https://media.discordapp.net/attachments/800737769450242098/1116656842630766603/dungeon_escape_gallows.PNG?width=746&height=468)

## Niveles: Templo Abandonado

Las ruinas de un antiguo templo han dado paso a una zona en la que la vegetacion crece de forma libre, creando un entorno en el que muchos empezaron a vivir tras la guerra. Aparentemente, en los años recientes la zona ha sido uno de los puntos mágicos más altos de todo el país.

![Nivel 2: Templo Abandonado](https://media.discordapp.net/attachments/800737769450242098/1116656820237377616/dungeon_escape_woods.PNG?width=1020&height=448)


## Tracklist - Canciones utilizadas

Para seleccionar las canciones utilizadas, he teneido en cuenta la sensación que querría transmitir en cada una de las situaciones desde sosiego, una atmósfera asfixiante o el sentimiento de encontrarte con un enemigo que inflinje respeto y terror.

- Menú principal: [Donkey Kong Country 2 - Welcome to Crocodile Isle](https://www.youtube.com/watch?v=n0onfHl7alU)
- Nivel 1 Mazmorra: [SMT IV Apocalypse - Enemy of God](https://www.youtube.com/watch?v=b-uT-MHifKU)
- Nivel 2 Templo Abandonado: [Dark Souls 2 - Majula](https://www.youtube.com/watch?v=SrHk3QkLd60)
- Combate contra el Demonio: [Dark Souls 3 - Vordt of the Boreal Valley](https://www.youtube.com/watch?v=eIpJmdxnP1E)
- Pantalla de Victoria: [SMT IV Tokyo (Ocarina of time SoundFont)](https://www.youtube.com/watch?v=cdAz8k3jw2Q)
- Pantallas de Derrota: [Pokémon - Symphony of Lugia](https://www.youtube.com/watch?v=HDjKqw8hh2I)



