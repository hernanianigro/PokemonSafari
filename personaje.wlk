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
	var property ocupado = false
	var property pokemonTeam = []
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
	method agregarPokemon(poke){
		poke.statsBase()
		pokemonTeam.add(poke)
	}
	method pokemonVivos (){
		return pokemonTeam.filter({pokemon=>pokemon.estaVivo()})
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
		throw new DomainException(message = "No puedo pasar por aqui.", source = personaje)
	}
	method puedePisarte(_) = false
}

object paredesMenu {
	method generar(){
		const ancho = game.width() 
		const largo = game.height() 
		const posParedes = []
		(0 .. 9).forEach{ n => posParedes.add(new Position(x=n, y=0)) }
		(0 .. 9).forEach{ n => posParedes.add(new Position(x=n, y=3)) }
		(0 .. 2).forEach{ n => posParedes.add(new Position(x=-3, y=n)) }
		(0 .. 2).forEach{ n => posParedes.add(new Position(x=9, y=n)) }
		posParedes.forEach { p => game.addVisual(new Pared(position = p))}
	}
}