# PokemonSafari
En el primer commit del programa había hecho solamente todo lo que es el nivel (o sea el lugar donde ocurre el juego, la interfaz, todo lo que es los gráficos, los npc, los personajes), por ese momento me había enfocado más que todo lo gráfico. Yo pensaba hacer una zona cerrada, un tablero cerrado donde vos empezas con tu personaje y ahí están repartidos en el paisaje los npcs (pokemon) y obviamente los lugares que no puede pasar por encima. Ese fue el plan principal, entonces me enfoqué en ese momento en todo lo que era gráficos y cosas como mover los personajes, como interactuar, como hacer que cambien de de dirección acorde hacia donde uno se mueve, ese tipo de cosas y hasta ahí lo probaba y estaba bien todo.

En el segundo commit me dediqué a la parte grafica, sprites, musica, fondo de batalla, pantallas, pokemon, etc.

En el tercer commit lo que hice fue empezar a agregar todo lo que era: como eran las batallas, toda la interfaz de la batalla con los contadores de vida, le agregué todo lo relacionado a la batalla, como entrar y salir de las batallas, todos los Pokémon que iban ahí y todos sus movimientos y relaciones. Tuve un montón de problemas y errores pero bueno lo relacione todo bien. El plan de ahí en adelante era que en la zona uno empieza hablando con el prof. oak, recibe su equipo de tres primeros pokemon, con ese equipo de tres tiene que ir por el lugar derrotando y capturando (automaticamente después de derrotar) a los demás excepto por el último legendario y de ahí formar un equipo cada vez más grande. A medida que uno los derrota desaparecen para que obviamente no se pueda volver a interactuar.

En el cuarto commit ya casi todo el código está completo, lo unico que hace falta completar es el metodo que dibuja la vida (hp) del pokemon "contadorDeVida.wlk" y como funcionan los ataques. Para completar lo siguiente (ver como termina la batalla, verificar que los ataques funcionen, que el pokemon vencido desaparezca del mapa y sea añadido al equipo) hay que solucionar eso primero.

En el cuarto commit V2 aun no pude encontrar la solucion al problema de cómo mostrar la vida. Intente cambiar el numero individual de cada pokemon con una simple barra de 10hp pero el error persiste. Lo dejo aca por si alguien quiere solucionarlo:
    wollok.lang.EvaluationError
        at barraDeVida.MostrarBarra.mostrarImagen(nombreImagen, posicion) [barraDeVida.wlk:13]
        at batalla.vida.dibujarVidaDe(pokemon) [batalla.wlk:190]
        at batalla.batalla.iniciar(npc) [batalla.wlk:16]
Tambien recuerden escribir sus nombres en la seccion "participantes".


# Pokemon Safari Zone

## Equipo
Grupo KBT-11220

## Participantes
Ianigro, Hernán Andrés


## Cómo jugar
El juego funciona de manera similar a los juegos de Pokemon, con varias simplificaciones. Al iniciar el juego, nos encontramos con nuestro entrenador, al que movemos con las flechas direccionales. Con la tecla ‘Z’ interactuamos con el NPC que estemos mirando. El NPC con el pelo rosa es el encargado de curar a nuestros Pokemon cuando estos se debilitan tras un combate (más adelante se detalla esto) y el más cercano a nosotros es el encargado de darnos nuestro equipo Pokemon inicial. El resto son otros entrenadores dispuestos a desafiarnos y al interactuar con ellos comienza la parte divertida, la batalla Pokemon.
Durante la batalla tenemos 4 ataques a elegir (todos ofensivos y sin ningún efecto secundario), y el color de sus bordes indica su tipo (para movernos en la selección de ataque e interactuar con ellos se utilizan las mismas teclas que en el mapa). También tienen una precisión, por lo que determinados ataques pueden fallar. A su vez, cada Pokemon tiene 1 o 2 tipos propios, que pueden ser mas vulnerables o resistentes a cierto tipo de ataque. Al final de este archivo dejo una imagen con estos datos. También hay que tener en cuenta que no todos los entrenadores tienen la misma inteligencia, pero algunos son bastante conscientes de como funciona esto y es muy probable que elijan atacar a nuestros Pokemon con el ataque más efectivo que tengan. También hay una división entre ataques físicos y especiales, que usan diferentes estadísticas ofensivas de nuestros Pokemon y defensivas del Pokemon rival para calcular el daño que se va a realizar. Esto se debe a que, a la hora de pelear, un Pokemon tiene

Controles:
- Las flechas arriba, abajo, izquierda y derecha mueven al personaje.
- El botón Z sirve para interactuar con los demás personajes y para aceptar las opciones.
- El botón X sirve para cancelar una opción elegida.

Stats:
- Puntos de vida (hp): La cantidad de vida del Pokemon, que disminuye con cada ataque. Al llegar a 0, el pokemon ya no puede continuar peleando.
- Ataque (atk): Determina el daño de los ataques físicos (Cuchillada, Megacuerno, etc).
- Ataque Especial (spa): Determina el daño de ataques especiales (Aliento Dragón, Lanzallamas, etc).
- Defensa (def): Determina la capacidad de cada Pokemon para defenderse de ataques físicos.
- Defensa Especial (spd): Determina la capacidad de cada Pokemon para defenderse de ataques especiales.
- Velocidad (spe): El pokemon con más velocidad será el primero en atacar.

Resultados de una batalla:
- Que todos nuestros Pokemon se debiliten, por lo que nosotros perdemos y debemos ir a curarlos para volver a jugar una revancha.
- Que el Pokemon rival se debilite, por lo que el rival pierde. Al interactuar con los rivales derrotados estos son "capturados y añadidos al equipo (exceptuando los Pokemon legendarios).