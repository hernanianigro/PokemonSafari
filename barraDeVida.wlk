import wollok.game.*
import batalla.*
import contadorDeVida.*
import movimientos.*
import nivel.*
import npc.*
import personaje.*
import pokemon.*
import tipo.*


class MostrarBarra {
    method mostrarImagen(nombreImagen, posicion) {
        //if (nombreImagen.isString() && posicion != null) {
        const posX = posicion.x()
        const posY = posicion.y()
        const numeroVisual = new Numero(numero = nombreImagen, x = posX, y = posY)
        numeroVisual.init(nombreImagen, posX, posY)
        //game.addVisual(nombreImagen).at(posicion)
        game.addVisual(numeroVisual)
        //self.dibujarBarra(nombreImagen, posicion)
        //} else {
            //console.println("Error: nombreImagen no es un String o posicion es null")
        //}
    }
    /*// Muestra la barra de vida inicial al inicio de la batalla
    method mostrar(queNumero, donde) {
        self.dibujarBarra(queNumero, donde)
    }
    // Dibuja la barra de vida actualizada en función del HP actual
    method dibujarBarra(queNumero, donde) {
        var posX = donde.x()
        var posY = donde.y()
        // Crear una instancia de Numero para el HP actual
        var numeroVisual = new Numero(numero = queNumero, x = posX, y = posY)
        numeroVisual.init(queNumero, posX, posY)
        // Añadir la imagen de la barra de vida al juego
        game.addVisual(numeroVisual)
    }*/
}

class Numero inherits MostrarBarra {
	var property numero
	var property x
    var property y
    method init(n, posX, posY) {
        numero = n
        x = posX
        y = posY
    }
	method image() = numero.toString() + ".png"
}

