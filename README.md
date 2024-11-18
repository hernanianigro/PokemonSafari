# PokemonSafari
En el primer commit del programa había hecho solamente todo lo que es el nivel (o sea el lugar donde ocurre el juego, la interfaz, todo lo que es los gráficos, los npc, los personajes), por ese momento me había enfocado más que todo lo gráfico. Yo pensaba hacer una zona cerrada, un tablero cerrado donde vos empezas con tu personaje y ahí están repartidos en el paisaje los npcs (pokemon) y obviamente los lugares que no puede pasar por encima. Ese fue el plan principal, entonces me enfoqué en ese momento en todo lo que era gráficos y cosas como mover los personajes, como interactuar, como hacer que cambien de de dirección acorde hacia donde uno se mueve, ese tipo de cosas y hasta ahí lo probaba y estaba bien todo.

En el segundo commit me dediqué a la parte grafica, sprites, musica, fondo de batalla, pantallas, pokemon, etc.

En el tercer commit lo que hice fue empezar a agregar todo lo que era: como eran las batallas, toda la interfaz de la batalla con los contadores de vida, le agregué todo lo relacionado a la batalla, como entrar y salir de las batallas, todos los Pokémon que iban ahí y todos sus movimientos y relaciones. Tuve un montón de problemas y errores pero bueno lo relacione todo bien. El plan de ahí en adelante era que en la zona uno empieza hablando con el prof. oak, recibe su equipo de tres primeros pokemon, con ese equipo de tres tiene que ir por el lugar derrotando y capturando (automaticamente después de derrotar) a los demás excepto por el último legendario y de ahí formar un equipo cada vez más grande. A medida que uno los derrota desaparecen para que obviamente no se pueda volver a interactuar.

En el cuarto commit ya casi todo el código está completo, lo unico que hace falta completar es el metodo que dibuja la vida (hp) del pokemon "contadorDeVida.wlk" y como funcionan los ataques. Para completar lo siguiente (ver como termina la batalla, verificar que los ataques funcionen, que el pokemon vencido desaparezca del mapa y sea añadido al equipo) hay que solucionar eso primero.

En el cuarto commit V2 aun no pude encontrar la solucion al problema de cómo mostrar la vida. Intente cambiar el numero individual de cada pokemon con una simple barra de 10hp pero el error persiste.

En el quinto commit (final) descarté por completo la idea de la barra de vida, ya que no había manera de hacerla funcionar. Mucho código quedó suelto e inutil, pero me concentré en que el juego sea completamente funcional de principio a fin. Ahora ya es jugable, pueden probar derrotar a todos los pokemon.


# Pokemon Safari Zone

## Equipo
Grupo KBT-11220

## Participantes
Ianigro, Hernán Andrés


## Cómo jugar
¡Bienvenido a la Zona Safari, un lugar lleno de extraños Pokemon! Al iniciar el juego, nos convertimos en un entrenador Pokemon, al que movemos con las flechas direccionales. Con la tecla "Z" interactuamos con el individuo que estemos mirando. El personaje de cabello rosa es la enfermera Joy, encargada de curar a nuestros Pokemon cuando estos se debilitan tras un combate, y el más cercano a nosotros es el profesor Oak, encargado de darnos nuestro equipo de tres Pokemon iniciales. Dentro de la zona nos vamos a encontrar diferentes tipo de Pokemon salvajes, los cuales hay que combatir y derrotar. La dificultad de cada uno varía con sus tipos y debilidades, además, hay un Pokemon legendario llamado Kyurem. ¡El más fuerte de todos!
Al entrar en batalla, cada Pokemon tiene 4 ataques a elegir (dos de su tipo primario y dos de su tipo secundario), el color de sus bordes indica su tipo. Para seleccionar el ataque usamos las flechas direccionales y lo seleccionamos con "Z". Cada ataque tiene su precisión, por lo que a veces pueden fallar. Trata de explotar las vulnerabilidades de cada tipo.

### Controles:
- Presiona ENTER para comenzar.
- Las flechas arriba, abajo, izquierda y derecha mueven al personaje.
- El botón Z sirve para interactuar con los demás personajes y para aceptar las opciones.

### Resultados de una batalla:
- Que todos nuestros Pokemon se debiliten, por lo que nosotros perdemos y debemos ir a curarlos para volver a jugar una revancha.
- Que el Pokemon rival se debilite, por lo que el rival pierde. Al interactuar con los rivales derrotados estos son "capturados" y añadidos al equipo (exceptuando los Pokemon legendarios).

### Tabla de ventajas y debilidades
Normal
- debilidades: lucha 
- inmunidades: fantasma

Lucha
- debilidades: volador, psiquico, hada
- resistencias: roca, bicho, oscuro

Volador
- debilidades: roca, electrico, hielo
- resistencias: lucha, bicho, planta
- inmunidades: suelo

Veneno
- debilidades: suelo, psiquico
- resistencias: lucha, veneno, bicho, planta, hada

Suelo
- debilidades: agua, planta, hielo
- resistencias: veneno, roca
- inmunidades: electrico

Roca
- debilidades: lucha, acero, agua, planta
- resistencias: normal, volador, veneno, fuego

Bicho
- debilidades: volador, roca, fuego
- resistencias: lucha, suelo, planta

Fantasma
- debilidades: fantasma, oscuro
- resistencias: veneno, bicho
- inmunidades: normal, lucha

Acero
- debilidades: lucha, suelo, fuego
- resistencias: normal, lucha, roca, bicho, acero, planta, psiquico, hielo, dragon, hada
- inmunidades: veneno

Fuego
- debilidades: suelo, roca, agua
- resistencias: bicho, acero, fuego, planta, hielo, hada

Agua
- debilidades: planta, electrico
- resistencias: acero, fuego, agua, hielo

Planta
- debilidades: volador, veneno, bicho, fuego, hielo
- resistencias: suelo, agua, planta, electrico

Electrico
- debilidades: suelo
- resistencias: volador, acero, electrico

Psiquico
- debilidades: bicho, fantasma, oscuro
- resistencias: lucha, psiquico

Hielo
- debilidades: lucha, roca, acero, fuego
- resistencias: hielo

Dragon
- debilidades: hielo, dragon, hada
- resistencias: fuego, agua, planta, electrico

Oscuro
- debilidades: lucha, bicho, hada
- resistencias: fantasma, oscuro
- inmunidades: psiquico

Hada
- debilidades: veneno, acero
- resistencias: lucha, bicho, oscuro
- inmunidades: dragon

### Stats:
- Puntos de vida (hp): La cantidad de vida del Pokemon, que disminuye con cada ataque. Al llegar a 0, el pokemon ya no puede continuar peleando.
- Ataque (atk): Determina el daño de los ataques físicos (Cuchillada, Megacuerno, etc).
- Ataque Especial (spa): Determina el daño de ataques especiales (Aliento Dragón, Lanzallamas, etc).
- Defensa (def): Determina la capacidad de cada Pokemon para defenderse de ataques físicos.
- Defensa Especial (spd): Determina la capacidad de cada Pokemon para defenderse de ataques especiales.
- Velocidad (spe): El pokemon con más velocidad será el primero en atacar.