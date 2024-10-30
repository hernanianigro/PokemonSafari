import wollok.game.*
import npc.*
import personaje.*

object nivel1 {
	method cargar() {
    	game.boardGround("safari.png")
		//PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
		const posicionesParedes = []
        (0 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = 0))}) // borde abajo
        (10 .. 20).forEach({ n => posicionesParedes.add(new Position(x = n, y = 1))})
        (0 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = largo)) }) // borde arriba 
        (0 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = 28)) })
        (0 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = 27)) })
        (14 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = 26)) })
        (14 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = 25)) })
        (14 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = 24)) })
        (5 .. 8).forEach({ n => posicionesParedes.add(new Position(x = n, y = 26)) })
        (5 .. 8).forEach({ n => posicionesParedes.add(new Position(x = n, y = 25)) })
        (5 .. 8).forEach({ n => posicionesParedes.add(new Position(x = n, y = 24)) })
        (5 .. 7).forEach({ n => posicionesParedes.add(new Position(x = n, y = 23)) })
        (14 .. 16).forEach({ n => posicionesParedes.add(new Position(x = n, y = 23)) })
        (15 .. 18).forEach({ n => posicionesParedes.add(new Position(x = n, y = 9)) })
        (15 .. 18).forEach({ n => posicionesParedes.add(new Position(x = n, y = 10)) })
        (15 .. 18).forEach({ n => posicionesParedes.add(new Position(x = n, y = 11)) })
        (15 .. 18).forEach({ n => posicionesParedes.add(new Position(x = n, y = 12)) })
		(0 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 0, y = n)) }) // borde izquierda
        (0 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 1, y = n)) })
        (0 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 2, y = n)) })
        (0 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 3, y = n)) })
		(0 .. largo).forEach({ n => posicionesParedes.add(new Position(x = ancho, y = n)) }) // borde derecha
        (10 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 38, y = n)) })
        (10 .. 15).forEach({ n => posicionesParedes.add(new Position(x = 33, y = n)) })
        (10 .. 15).forEach({ n => posicionesParedes.add(new Position(x = 32, y = n)) })
        (17 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 33, y = n)) })
        (17 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 32, y = n)) })
        (4 .. 7).forEach({ n => posicionesParedes.add(new Position(x = n, y = 14)) })
        (9 .. 10).forEach({ n => posicionesParedes.add(new Position(x = n, y = 14)) })
        (5 .. 9).forEach({ n => posicionesParedes.add(new Position(x = n, y = 21)) })
        (15 .. 21).forEach({ n => posicionesParedes.add(new Position(x = 4, y = n)) })
        (15 .. 21).forEach({ n => posicionesParedes.add(new Position(x = 10, y = n)) })
        (16 .. 20).forEach({ n => posicionesParedes.add(new Position(x = 5, y = n)) })
        (16 .. 20).forEach({ n => posicionesParedes.add(new Position(x = 6, y = n)) })
		posicionesParedes.addAll(
			[
			new Position(x = 4, y = 1),
            new Position(x = 8, y = 2),
			new Position(x = 5, y = 1)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new Pared(position = posicionParedes)) })
		//AGUA
		const posicionesAgua = []
        (21 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 1))})
        (21 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 2))})
        (23 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 3))})
        (23 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 4))})
        (27 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 5))})
        (27 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 6))})
        (27 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 7))})
        (27 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 8))})
        (27 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 9))})
        posicionesAgua.forEach({ posicionAgua => self.dibujar(new Agua(position = posicionAgua)) })
        //RIO
        const posicionesRio = []
        (10 .. 15).forEach({ n => posicionesRio.add(new Position(x = 32, y = n))})
        (10 .. 15).forEach({ n => posicionesRio.add(new Position(x = 33, y = n))})
        (17 .. 23).forEach({ n => posicionesRio.add(new Position(x = 32, y = n))})
        (17 .. 23).forEach({ n => posicionesRio.add(new Position(x = 33, y = n))})
        (28 .. 29).forEach({ n => posicionesRio.add(new Position(x = 32, y = n))})
        (28 .. 29).forEach({ n => posicionesRio.add(new Position(x = 33, y = n))})
        posicionesRio.forEach({ posicionRio => self.dibujar(new Rio(position = posicionRio)) })
        //CASCADA
        const posicionesCascada = []
        (24 .. 27).forEach({ n => posicionesCascada.add(new Position(x = 32, y = n))})
        (24 .. 27).forEach({ n => posicionesCascada.add(new Position(x = 33, y = n))})
        posicionesCascada.forEach({ posicionCascada => self.dibujar(new Cascada(position = posicionCascada)) })
        //personaje
		game.addVisual(personaje)
        game.addVisual(enfermeraJoy)
        game.addVisual(venusaur)
        game.addVisual(pidgeot)
        game.addVisual(arcanine)
        game.addVisual(rhyhorn)
        game.addVisual(lapras)
        game.addVisual(chinchou)
        game.addVisual(yanma)
        game.addVisual(lairon)
        game.addVisual(sharpedo)
        game.addVisual(trapinch)
        game.addVisual(tropius)
        game.addVisual(regirock)
        game.addVisual(bastiodon)
        game.addVisual(tangrowth)
        game.addVisual(kyurem)
        //TECLADO
		keyboard.up().onPressDo{if (game.height()-4 > personaje.position().y()) personaje.irArriba()}
        keyboard.down().onPressDo{if (game.height()-29 < personaje.position().y()) personaje.irAbajo()}
        keyboard.left().onPressDo{if (game.width()-36 < personaje.position().x()) personaje.irIzquierda()}
        keyboard.right().onPressDo{if (game.width()-2 > personaje.position().x()) personaje.irDerecha()}
        //keyboard.up().onHoldDo({if (game.height()-1 > personaje.position().y()) personaje.irArriba() })
		//keyboard.down().onHoldDo({if (game.height()-30 < personaje.position().y()) personaje.irAbajo() })
		//keyboard.left().onHoldDo({if (game.width()-40 < personaje.position().x()) personaje.irIzquierda() })
		//keyboard.right().onHoldDo({if (game.width()-1 > personaje.position().x()) personaje.irDerecha() })
		//COLISIONES.onPressDo({ self.comprobarSiGano(cajas) })
		game.whenCollideDo(personaje, { elemento => personaje.empuja(elemento) })
	}
	method restart() {
		game.clear()
		self.cargar()
	}
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
}

object juego {
	var juegoIniciado = false
	method empezar(){
		game.sound("opening.mp3")
		if (not juegoIniciado){
			game.removeVisual(pantallaDeInicio)
			juegoIniciado = true
			pantallaDeInicio.terminarAnimacion()
		}
	}
}

object pantallaDeInicio{
	var imagen = false
	method iniciarAnimacion(){game.onTick(250,"Animacion del menu",{self.cambiar()})}
	method terminarAnimacion(){game.removeTickEvent("Animacion del menu")}
	method cambiar(){
		if(imagen)
			imagen = false
		else
			imagen = true
	}
	method image() {
		if(imagen)
			return "title1.png"
		else
			return "title2.png"
	}
}

object nivel{
	var property posProhibidas = []
	var property posOcupadas = []
	method agregar(pos){posOcupadas.add(pos)}
	method remover(pos){posOcupadas.remove(pos)}
	method posicionOcupada(pos){return posProhibidas.contains(pos) or posOcupadas.contains(pos)}
	method posicionQuePuedeSerAfectadaPorUnaBomba(pos){return posOcupadas.contains(pos) or pos == personaje.position()}
	method esUnaPared(pos){return posProhibidas.contains(pos)}
	method agregarPosiciones(){
		5.times{i=>
			5.times{j=>
				posProhibidas.add(game.at(i*2,j*2))
			}
		}
		11.times{k=>
			posProhibidas.add(game.at(k,0))
			posProhibidas.add(game.at(k,12))
			posProhibidas.add(game.at(0,k))
			posProhibidas.add(game.at(12,k))			
		}
	}
}