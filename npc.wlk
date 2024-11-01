import wollok.game.*
import personaje.*
import nivel.*
import pokemon.*
import batalla.*

class Npc{
	var property direccion = abajo
	var property pokemonTeam = []
	var property ocupado = false
	var property cumplioProposito = false
	method esAtravesable() = false
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
	method position () = game.at(5,5)
	method image () = "Joy" + npcDireccion.image()
	method interactuar(){
		personaje.ocupado(true)
		self.hablar("Bienvenido a la Zona Safari! Dejame recuperar tu salud.")
		game.schedule(2000, {personaje.ocupado(false)})
		personaje.pokemonTeam().forEach{pokemon=>pokemon.recuperarse()}
	}
}

object profesorOak inherits Npc{
	var property npcDireccion = npcAbajo
	method image () = "Oak" + npcDireccion.image()
	method position () = game.at(7,3)
	method interactuar (){
		personaje.ocupado(true)
		self.hablar("Bienvenido! Aqui tienes 3 Pokemon para comenzar tu viaje.")
		if(!cumplioProposito){
			personaje.agregarPokemon(new Torterra(owner=personaje))
			personaje.agregarPokemon(new Blaziken(owner=personaje))
			personaje.agregarPokemon(new Samurott(owner=personaje))
			cumplioProposito = true
		}
		game.schedule(2000,{personaje.ocupado(false)})
	}
}

object venusaur inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 70
	method PokemonTeam(){
		self.agregarPokemon(new Venusaur(side="enemy",owner=self))
	}
	method image () = "003venusaur.png"
	method position () = game.at(35,12)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Saaaur!!!")
			game.sound("003venusaur.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Venu...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Venusaur(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object pidgeot inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 60
	method PokemonTeam(){
		self.agregarPokemon(new Pidgeot(side="enemy",owner=self))
	}
	method image () = "018pidgeot.png"
	method position () = game.at(23,13)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Pidgeoot!!!")
			game.sound("018pidgeot.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Piii...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Pidgeot(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object arcanine inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 50
	method PokemonTeam(){
		self.agregarPokemon(new Arcanine(side="enemy",owner=self))
	}
	method image () = "059arcanine.png"
	method position () = game.at(4,26)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Roaaar!!!")
			game.sound("059arcanine.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Grrr...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Arcanine(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object rhyhorn inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 40
	method PokemonTeam(){
		self.agregarPokemon(new Rhyhorn(side="enemy",owner=self))
	}
	method image () = "111rhyhorn.png"
	method position () = game.at(6,19)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Hooorn!!!")
			game.sound("111rhyhorn.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Rhy...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Rhyhorn(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object lapras inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 60
	method PokemonTeam(){
		self.agregarPokemon(new Lapras(side="enemy",owner=self))
	}
	method image () = "131lapras.png"
	method position () = game.at(36,3)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Laaaa!!!")
			game.sound("131lapras.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Lapras...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Lapras(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object chinchou inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 15
	method PokemonTeam(){
		self.agregarPokemon(new Chinchou(side="enemy",owner=self))
	}
	method image () = "170chinchou.png"
	method position () = game.at(31,6)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Bzzzt!!!")
			game.sound("170chinchou.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Bzzzt...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Chinchou(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object yanma inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 30
	method PokemonTeam(){
		self.agregarPokemon(new Yanma(side="enemy",owner=self))
	}
	method image () = "193yanma.png"
	method position () = game.at(15,22)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("BzzzBzzz!!!")
			game.sound("193yanma.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Bzzz...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Yanma(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object lairon inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 40
	method PokemonTeam(){
		self.agregarPokemon(new Lairon(side="enemy",owner=self))
	}
	method image () = "305lairon.png"
	method position () = game.at(9,20)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Laaaaai!!!")
			game.sound("305lairon.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Grrr...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Lairon(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object sharpedo inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 40
	method PokemonTeam(){
		self.agregarPokemon(new Sharpedo(side="enemy",owner=self))
	}
	method image () = "319sharpedo.png"
	method position () = game.at(24,2)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Crunch!!!")
			game.sound("319sharpedo.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Clac clac...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Sharpedo(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object trapinch inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 25
	method PokemonTeam(){
		self.agregarPokemon(new Trapinch(side="enemy",owner=self))
	}
	method image () = "328trapinch.png"
	method position () = game.at(8,9)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Chomp chomp!!!")
			game.sound("328trapinch.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Chomp...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Trapinch(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object tropius inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 50
	method PokemonTeam(){
		self.agregarPokemon(new Tropius(side="enemy",owner=self))
	}
	method image () = "357tropius.png"
	method position () = game.at(17,8)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Roooo!!!")
			game.sound("357tropius.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Roooo...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Tropius(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object regirock inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 90
	method PokemonTeam(){
		self.agregarPokemon(new Regirock(side="enemy",owner=self))
	}
	method image () = "377regirock.png"
	method position () = game.at(36,23)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Gi ro gi ro reee!!!")
			game.sound("377regirock.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Re re re gi gi ro...")
			if(!cumplioProposito){
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object bastiodon inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 70
	method PokemonTeam(){
		self.agregarPokemon(new Bastiodon(side="enemy",owner=self))
	}
	method image () = "411bastiodon.png"
	method position () = game.at(25,6)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Aaargh!!!")
			game.sound("411bastiodon.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Grrr...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Bastiodon(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object tangrowth inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 70
	method PokemonTeam(){
		self.agregarPokemon(new Tangrowth(side="enemy",owner=self))
	}
	method image () = "465tangrowth.png"
	method position () = game.at(27,18)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Growth!!!")
			game.sound("465tangrowth.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Taaann...")
			if(!cumplioProposito){
				personaje.agregarPokemon(new Tangrowth(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}

object kyurem inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 100
	method PokemonTeam(){
		self.agregarPokemon(new Kyurem(side="enemy",owner=self))
	}
	method image () = "646kyurem.png"
	method position () = game.at(22,23)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Kyuuuu!!!")
			game.sound("646kyurem.mp3")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Kyuuuu...")
			if(!cumplioProposito){
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
			self.position() game.at(50,50)
		}
	}
}