import wollok.game.*
import nivel.*
import npc.*

object musica {
	const music = game.sound("mainBMG.WAV")
    method replay() {music.shouldLoop(true)
    game.schedule(500, {music.play()} )
	}
}

object personaje {
	var property position = game.at(7, 2)
	method image ()= "" + direccion.image()
	var property direccion = arriba
	method empuja(unElemento) {
		try
			unElemento.movete(direccion)
		catch e {
			self.retrocede()
			throw e
		}
	}
	method retrocede() {
		position = direccion.opuesto().siguiente(position)
	}
	method retrocedeCon(caja) {
		self.retrocede()
		caja.movete(direccion.opuesto())
	}
	method irArriba() {
		direccion = arriba
		self.avanzar()
	}
	method irAbajo() {
		direccion = abajo
		self.avanzar()
	}
	method irIzquierda() {
		direccion = izquierda
		self.avanzar()
	}
	method irDerecha() {
		direccion = derecha
		self.avanzar()
	}
	method avanzar() {
		position = direccion.siguiente(position)
	}
	method setDireccion(unaDireccion) {
		direccion = unaDireccion
	}
}


class Direccion {
	method siguiente(position)
}

object izquierda inherits Direccion { 
	override method siguiente(position) = position.left(1) 
	method opuesto() = derecha
	method image() {
		return "personajeIzquierda.png"
	}
}

object derecha inherits Direccion { 
	override method siguiente(position) = position.right(1) 
	method opuesto() = izquierda
	method image() {
		return "personajeDerecha.png"
	}
}

object abajo inherits Direccion { 
	override method siguiente(position) = position.down(1) 
	method opuesto() = arriba
	method image() {
		return "personajeAbajo.png"
	}
}

object arriba inherits Direccion { 
	override method siguiente(position) = position.up(1) 
	method opuesto() = abajo
	method image() {
		return "personajeArriba.png"
	}
}

class Agua {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = true
	method image() = "water2.gif"
}

class Rio {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = false
	method image() = "river.gif"
}

class Cascada {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = false
	method image() = "waterfall.gif"
}

class Pared {
	var property position
	method movete(direccion) {
		throw new DomainException(message = "No puedes mover las paredes.", source = personaje)
	}
	method puedePisarte(_) = false
}

object squish {
  method play(){
    game.sound("squish.WAV").play()
  }
}