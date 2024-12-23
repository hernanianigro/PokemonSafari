import wollok.game.*
import batalla.*
import dialogos.*
import movimientos.*
import nivel.*
import personaje.*
import pokemon.*
import tipo.*


class Npc{
	var property direccion = npcAbajo
	var property pokemonTeam = []
	var property ocupado = false
	var property cumplioProposito = false
	method esAtravesable() {return false}
	method mirarpersonaje (){
		direccion = personaje.direccion().opuesta()
	}
	method hablar(mensaje){
		self.mirarpersonaje()
		game.say(self,mensaje)
	}
	method agregarPokemon(poke){
		poke.statsBase()
		pokemonTeam.add(poke)
	}
}

object npcIzquierda {
	method opuesta() = npcDerecha
	method image() {return "Izquierda.png"}
	method avanzar (position,cantidad) {return position.left(cantidad)}
}
object npcDerecha {
	method opuesta() = npcIzquierda
	method image() {return "Derecha.png"}
	method avanzar (position,cantidad) {return position.right(cantidad)}
}
object npcArriba {
	method opuesta() = npcAbajo
	method image() {return "Arriba.png"}
	method avanzar (position,cantidad) {return position.up(cantidad)}
}
object npcAbajo {
	method opuesta() = npcArriba
	method image() {return "Abajo.png"}
	method avanzar (position,cantidad) {return position.down(cantidad)}
}

//------------------------------------------------------------------------------------------
object cartel inherits Npc{
	var property npcDireccion = npcAbajo
	method position () = game.at(8,2)
	method mostrarDialogo(){
		game.addVisual(dialogocartel)
		game.schedule(3000, {game.removeVisual(dialogocartel)})
	}
	method interactuar(){
		personaje.ocupado(true)
		self.mostrarDialogo()
		game.sound("button.mp3").play()
		game.schedule(3000, {personaje.ocupado(false)})
	}
}
//------------------------------------------------------------------------------------------
object enfermeraJoy inherits Npc{
	var property npcDireccion = npcAbajo
	method position () = game.at(2,5)
	method image () = "Joy" + npcDireccion.image()
	method mostrarDialogo(){
		game.addVisual(dialogojoy)
		game.schedule(2000, {game.removeVisual(dialogojoy)})
	}
	method interactuar(){
		personaje.ocupado(true)
		self.mostrarDialogo()
		game.sound("heal.mp3").play()
		game.schedule(2000, {personaje.ocupado(false)})
		personaje.pokemonTeam().forEach{pokemon=>pokemon.recuperarse()}
	}
}
//------------------------------------------------------------------------------------------
object profesorOak inherits Npc{
	var property npcDireccion = npcAbajo
	var property hablo = false
	method image () = "Oak" + npcDireccion.image()
	method position () = game.at(7,4)
	method llamar(){
		if(!cumplioProposito&&!hablo){game.say(self, "Habla conmigo!")}
	}
	method mostrarDialogo1(){
		game.addVisual(dialogooak1)
		game.schedule(2000, {game.removeVisual(dialogooak1)})
	}
	method mostrarDialogo2(){
		game.addVisual(dialogooak2)
		game.schedule(2000, {game.removeVisual(dialogooak2)})
	}
	method mostrarDialogo3(){
		game.addVisual(dialogooak3)
		game.schedule(2000, {game.removeVisual(dialogooak3)})
	}
	method interactuar (){
		personaje.ocupado(true)
		if(!cumplioProposito&&!hablo){
			self.mostrarDialogo1()
			game.removeVisual(dialogooak2)
			game.sound("button.mp3").play()
			personaje.agregarPokemon(new Torterra(owner=personaje))
			personaje.agregarPokemon(new Blaziken(owner=personaje))
			personaje.agregarPokemon(new Lanturn(owner=personaje))
			cumplioProposito = true
		}
		if(cumplioProposito&&hablo){
			self.mostrarDialogo2()
			game.sound("button.mp3").play()
		}
		if(venusaur.perdio()&&pidgeot.perdio()&&lapras.perdio()&&butterfree.perdio()&&lairon.perdio()&&wigglytuff.perdio()&&kyurem.perdio()){
		game.removeVisual(dialogooak2)
		self.mostrarDialogo3()
		game.sound("winner.mp3").play()
		nivelCentral.descargar()
		game.schedule(3000,{game.clear()})
		game.schedule(3000,{final.cargar()})
		}
		hablo = true
		game.schedule(2000,{personaje.ocupado(false)})
	}
}
//------------------------------------------------------------------------------------------
object venusaur inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 70
	method PokemonTeam(){
		self.agregarPokemon(new Venusaur(side="enemy",owner=self))
	}
	method image () {if(!perdio){return "Venusaur.gif"}else{return null}}
	override method esAtravesable() {return perdio}
	method position () = game.at(11,9)
	method mostrarDialogo1(){
		game.addVisual(dialogovenusaur1)
		game.schedule(2000, {game.removeVisual(dialogovenusaur1)})
	}
	method mostrarDialogo2(){
		game.addVisual(dialogovenusaur2)
		game.schedule(2000, {game.removeVisual(dialogovenusaur2)})
	}
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.mostrarDialogo1()
			game.sound("Venusaur.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
		}else{
			self.mostrarDialogo2()
			game.sound("Venusaur.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Venusaur(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			game.removeVisual(self)
		}
	}
	method perder() {
		self.mostrarDialogo2()
			game.sound("Venusaur.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Venusaur(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			game.removeVisual(self)
			perdio = true
	}
}
//------------------------------------------------------------------------------------------
object pidgeot inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 60
	method PokemonTeam(){
		self.agregarPokemon(new Pidgeot(side="enemy",owner=self))
	}
	method image () {if(!perdio){return "Pidgeot.gif"}else{return null}}
	override method esAtravesable() {return perdio}
	method position () = game.at(3,10)
	method mostrarDialogo1(){
		game.addVisual(dialogopidgeot1)
		game.schedule(2000, {game.removeVisual(dialogopidgeot1)})
	}
	method mostrarDialogo2(){
		game.addVisual(dialogopidgeot2)
		game.schedule(2000, {game.removeVisual(dialogopidgeot2)})
	}
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.mostrarDialogo1()
			game.sound("Pidgeot.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
		}else{
			self.mostrarDialogo2()
			game.sound("Pidgeot.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Pidgeot(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			game.removeVisual(self)
		}
	}
	method perder() {
		self.mostrarDialogo2()
			game.sound("Pidgeot.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Pidgeot(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			game.removeVisual(self)
			perdio = true
	}
}
//------------------------------------------------------------------------------------------
object lapras inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 60
	method PokemonTeam(){
		self.agregarPokemon(new Lapras(side="enemy",owner=self))
	}
	method image () {if(!perdio){return "Lapras.gif"}else{return null}}
	override method esAtravesable() {return perdio}
	method position () = game.at(4,3)
	method mostrarDialogo1(){
		game.addVisual(dialogolapras1)
		game.schedule(2000, {game.removeVisual(dialogolapras1)})
	}
	method mostrarDialogo2(){
		game.addVisual(dialogolapras2)
		game.schedule(2000, {game.removeVisual(dialogolapras2)})
	}
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.mostrarDialogo1()
			game.sound("Lapras.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
		}else{
			self.mostrarDialogo2()
			game.sound("Lapras.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Lapras(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
	method perder() {
		self.mostrarDialogo2()
			game.sound("Lapras.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Lapras(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			game.removeVisual(self)
			perdio = true
	}
}
//------------------------------------------------------------------------------------------
object butterfree inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 30
	method PokemonTeam(){
		self.agregarPokemon(new Butterfree(side="enemy",owner=self))
	}
	method image () {if(!perdio){return "Butterfree.gif"}else{return null}}
	override method esAtravesable() {return perdio}
	method position () = game.at(10,10)
	method mostrarDialogo1(){
		game.addVisual(dialogobutterfree1)
		game.schedule(2000, {game.removeVisual(dialogobutterfree1)})
	}
	method mostrarDialogo2(){
		game.addVisual(dialogobutterfree2)
		game.schedule(2000, {game.removeVisual(dialogobutterfree2)})
	}
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.mostrarDialogo1()
			game.sound("Butterfree.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
		}else{
			self.mostrarDialogo2()
			game.sound("Butterfree.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Butterfree(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
	method perder() {
		self.mostrarDialogo2()
			game.sound("Butterfree.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Butterfree(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			game.removeVisual(self)
			perdio = true
	}
}
//------------------------------------------------------------------------------------------
object lairon inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 40
	method PokemonTeam(){
		self.agregarPokemon(new Lairon(side="enemy",owner=self))
	}
	method image () {if(!perdio){return "Lairon.gif"}else{return null}}
	override method esAtravesable() {return perdio}
	method position () = game.at(2,13)
	method mostrarDialogo1(){
		game.addVisual(dialogolairon1)
		game.schedule(2000, {game.removeVisual(dialogolairon1)})
	}
	method mostrarDialogo2(){
		game.addVisual(dialogolairon2)
		game.schedule(2000, {game.removeVisual(dialogolairon2)})
	}
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.mostrarDialogo1()
			game.sound("Lairon.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
		}else{
			self.mostrarDialogo2()
			game.sound("Lairon.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Lairon(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
	method perder() {
		self.mostrarDialogo2()
			game.sound("Lairon.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Lairon(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			game.removeVisual(self)
			perdio = true
	}
}
//------------------------------------------------------------------------------------------
object wigglytuff inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 40
	method PokemonTeam(){
		self.agregarPokemon(new Wigglytuff(side="enemy",owner=self))
	}
	method image () {if(!perdio){return "Wigglytuff.gif"}else{return null}}
	override method esAtravesable() {return perdio}
	method position () = game.at(8,3)
	method mostrarDialogo1(){
		game.addVisual(dialogowigglytuff1)
		game.schedule(2000, {game.removeVisual(dialogowigglytuff1)})
	}
	method mostrarDialogo2(){
		game.addVisual(dialogowigglytuff2)
		game.schedule(2000, {game.removeVisual(dialogowigglytuff2)})
	}
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.mostrarDialogo1()
			game.sound("Wigglytuff.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
		}else{
			self.mostrarDialogo2()
			game.sound("Wigglytuff.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Wigglytuff(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
	method perder() {
		self.mostrarDialogo2()
			game.sound("Wigglytuff.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Wigglytuff(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			game.removeVisual(self)
			perdio = true
	}
}
//------------------------------------------------------------------------------------------
object kyurem inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 100
	method PokemonTeam(){
		self.agregarPokemon(new Kyurem(side="enemy",owner=self))
	}
	method image () {return null}
	override method esAtravesable() {return perdio}
	method position () = game.at(7,8)
	method mostrarDialogo1(){
		game.addVisual(dialogokyurem1)
		game.schedule(2000, {game.removeVisual(dialogokyurem1)})
	}
	method mostrarDialogo2(){
		game.addVisual(dialogokyurem2)
		game.schedule(2000, {game.removeVisual(dialogokyurem2)})
	}
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.mostrarDialogo1()
			game.sound("Kyurem.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
		}else{
			self.mostrarDialogo2()
			game.sound("Kyurem.mp3").play()
			if(!cumplioProposito){
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
	method perder() {
		self.mostrarDialogo2()
			game.sound("Kyurem.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Kyurem(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			game.removeVisual(self)
			game.removeVisual(kyuremImagen)
			perdio = true
	}
}
object kyuremImagen inherits Npc{
	var property perdio = true
	method image () = "KyuremLegend.png"
	override method esAtravesable() {return perdio}
	method position () = game.at(6,8)
}