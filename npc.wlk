import wollok.game.*
import personaje.*
import nivel.*

class Npc{
	var property direccion = abajo
	method esAtravesable() = false
	method mirarPj (){
		direccion = personaje.direccion().opuesta()
	}
	method hablar(mensaje){
		self.mirarPj()
		game.say(self,mensaje)
	}
}

class NpcDireccion {
	method siguiente(position)
}

object npcIzquierda inherits NpcDireccion { 
	override method siguiente(position) = position.left(1) 
	method opuesto() = derecha
	method image() {
		return "Izquierda.png"
	}
}

object npcDerecha inherits NpcDireccion { 
	override method siguiente(position) = position.right(1) 
	method opuesto() = izquierda
	method image() {
		return "Derecha.png"
	}
}

object npcAbajo inherits NpcDireccion { 
	override method siguiente(position) = position.down(1) 
	method opuesto() = arriba
	method image() {
		return "Abajo.png"
	}
}

object npcArriba inherits NpcDireccion { 
	override method siguiente(position) = position.up(1) 
	method opuesto() = abajo
	method image() {
		return "Arriba.png"
	}
}

object enfermeraJoy inherits Npc{
	var property npcDireccion = npcAbajo
	method position () = game.at(6,19)
	method image () = "Joy" + npcDireccion.image()
}

object enfermeraJoy1 inherits Npc{
	var property npcDireccion = npcAbajo
	method image () = "Joy" + npcDireccion.image()
	method position () = game.at(4,26)
}

object enfermeraJoy2 inherits Npc{
	var property npcDireccion = npcArriba
	method image () = "Joy" + npcDireccion.image()
	method position () = game.at(27,22)
}

object enfermeraJoy3 inherits Npc{
	var property npcDireccion = npcArriba
	method image () = "Joy" + npcDireccion.image()
	method position () = game.at(16,8)
}

object enfermeraJoy4 inherits Npc{
	var property npcDireccion = npcDerecha
	method image () = "Joy" + npcDireccion.image()
	method position () = game.at(25,6)
}

object enfermeraJoy5 inherits Npc{
	var property npcDireccion = npcDerecha
	method image () = "Joy" + npcDireccion.image()
	method position () = game.at(36,3)
}

object enfermeraJoy6 inherits Npc{
	var property npcDireccion = npcIzquierda
	method image () = "Joy" + npcDireccion.image()
	method position () = game.at(35,12)
}
object enfermeraJoy7 inherits Npc{
	var property npcDireccion = npcIzquierda
	method image () = "Joy" + npcDireccion.image()
	method position () = game.at(35,22)
}