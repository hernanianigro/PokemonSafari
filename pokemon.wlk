import wollok.game.*
import batalla.*
import contadorDeVida.*
import movimientos.*
import nivel.*
import npc.*
import personaje.*
import tipo.*

class Pokemon{
	var property owner=self
	var property name=""
	var property hp=0
	var property atk=0
	var property def=0
	var property spa=0
	var property spd=0
	var property spe=0
	var property types=[nulo,nulo]
	var property moveset = [ninguno,ninguno,ninguno,ninguno]
	var property side="ally"
	var property hpActual=1
	method image () = if (side == "ally"){
			return name + "3Dback.png"
		}else{
			return name + "3D.png"
		}
	method position (){
		if (side == "ally"){
			return game.at(9,9)
		}else{
			return game.at(25,15)
		}
	}
	method posicionDeLaVida (){
		if (side == "ally"){
			return game.at(3,14)
		}else{
			return game.at(20,20)
		}
	}
	method estaVivo () = hpActual != 0
	method recuperarse(){
		hpActual = hp
	}
	method elAtaqueAcerto (ataque, objetivo) = (1 .. 100).anyOne() <= ataque.accuracy()
	method atacar(ataque,objetivo){
		self.owner().ocupado(true)
		game.say(self, name + " ha usado " + ataque.name())
		if (self.elAtaqueAcerto(ataque, objetivo)){
			objetivo.recibirDanio (ataque,self)	
		}
		else{
			game.schedule(2000,{game.say(objetivo,objetivo.name()+" esquivo el ataque.")})
			game.schedule(6000,{owner.ocupado(false)})
		}
	}
	
	method recibirDanio (ataque,pokemon){
		hpActual = (hpActual - self.danio(ataque,pokemon)).max(0)
		game.schedule(2000,{vida.dibujarVidaDe(self)})
		if (self.hpActual() == 0){
				game.schedule(4000,{game.say(self, self.name() + " no puede continuar.")})
				game.schedule(6500,{batalla.pokemonKO(self)})
		} else game.schedule(6000,{pokemon.owner().ocupado(false)})
	}
	method danio(ataque,pokemon){
		return (((((2*100*0.5+2)*ataque.dmg()*ataque.type().conQueAtacar(pokemon)/ataque.type().conQueDefenderse(self))*0.02)+2)*self.calcularMultiplicador(ataque,pokemon)).div(2)
	}
	
	method calcularEficacia(ataque){
		var multiplicador = 1
		self.types().forEach({tipo=>multiplicador*=tipo.calcularMultiplicador (ataque.damagetype())})
		return multiplicador
	}
	method calcularMultiplicador(ataque,pokemon){
		var multiplicador= self.calcularEficacia(ataque)
		if (multiplicador == 0) game.schedule(2000,{game.say(self,"Es inmune al ataque!")})else{
			if (multiplicador >= 2) game.schedule(2000,{game.say(self,"Es super efectivo!")})
			if (multiplicador <= 0.5) game.schedule(2000,{game.say(self,"No es muy efectivo...")})
			if(multiplicador < 2 && multiplicador > 0.5) game.schedule(2000,{game.say(self,"El ataque dio en el blanco!")})
		}
		if (pokemon.types().contains(ataque.damagetype())) multiplicador *= 1.5
		multiplicador *= new Range(start = 85, end = 100).anyOne() / 100
		return multiplicador
	}
	
	method calcularStat (stat) = 2*stat+ (20 .. 31).anyOne()
	
	method stats(){
		hp= self.calcularStat(hp) + 110
		atk= self.calcularStat(atk) + 5
		def = self.calcularStat(def) + 5
		spa = self.calcularStat(spa) + 5
		spd = self.calcularStat(spd) + 5
		spe = self.calcularStat(spe) + 5
		hpActual=hp 
	}
}

class Torterra inherits Pokemon{
	method statsBase(){
		name ="Torterra"
		hp  =95
		atk =109
		def =105
		spa =75
		spd =85 
		spe =56
		types=[planta,suelo]
		moveset = [hojasnavaja,rayosolar,terremoto,bofetonlodo]
		self.stats()
	}
}

class Blaziken inherits Pokemon{
	method statsBase(){
		name ="Blaziken"
		hp  =80
		atk =120
		def =70
		spa =110
		spd =70 
		spe =80
		types=[fuego,lucha]
		moveset = [colmillofuego,lanzallamas,brazomartillo,esferaaural]
		self.stats()
	}
}

class Lanturn inherits Pokemon{
	method statsBase(){
		name ="Lanturn"
		hp  =125
		atk =58
		def =58
		spa =76
		spd =76
		spe =67
		types=[agua,electrico]
		moveset = [tajoacuatico,surf,colmillotrueno,chispa]
		self.stats()
	}
}

class Venusaur inherits Pokemon{
	method statsBase(){
		name ="Venusaur"
		hp  =80
		atk =82
		def =83
		spa =100
		spd =100
		spe =80
		types=[planta,veneno]
		moveset = [hojasnavaja,rayosolar,puyanociva,acido]
		self.stats()
	}
}

class Pidgeot inherits Pokemon{
	method statsBase () {
		name ="Pidgeot"
		hp  =83
		atk =80
		def =75
		spa =70
		spd =70
		spe =101
		types=[normal,volador]
		moveset = [cuchillada,hypervoz,ataqueala,tajoaereo]
		self.stats()
	}
}

class Victini inherits Pokemon{
	method statsBase () {
		name ="Victini"
		hp  =90
		atk =110
		def =80
		spa =100
		spd =80 
		spe =95
		types=[psiquico,fuego]
		moveset = [cabezazozen,psicorrayo,colmillofuego,lanzallamas]
		self.stats()
	}
}

class Zweilous inherits Pokemon{
	method statsBase () {
		name ="Zweilous"
		hp  =72
		atk =85
		def =70
		spa =65
		spd =70
		spe =58
		types=[oscuro,dragon]
		moveset = [tajoumbrio,pulsoumbrio,garradragon,alientodragon]
		self.stats()
	}
}

class Lapras inherits Pokemon{
	method statsBase () {
		name ="Lapras"
		hp  =130
		atk =85
		def =80
		spa =85
		spd =95
		spe =60
		types=[agua,hielo]
		moveset = [tajoacuatico,surf,colmillohielo,rayohielo]
		self.stats()
	}
}
class Rotom inherits Pokemon{
	method statsBase () {
		name ="Rotom"
		hp  =50
		atk =50
		def =77
		spa =95
		spd =77
		spe =91
		types=[electrico,fantasma]
		moveset = [colmillotrueno,chispa,puniosombra,bolasombra]
		self.stats()
	}
}

class Butterfree inherits Pokemon{
	method statsBase () {
		name ="Butterfree"
		hp  =60
		atk =45
		def =50
		spa =90
		spd =80
		spe =70
		types=[bicho,volador]
		moveset = [megacuerno,rayosenial,ataqueala,tajoaereo]
		self.stats()
	}
}

class Lairon inherits Pokemon{
	method statsBase () {
		name ="Lairon"
		hp  =60
		atk =90
		def =140
		spa =50
		spd =50
		spe =40
		types=[acero,roca]
		moveset = [cabezahierro,metalaser,tumbaroca,poderpasado]
		self.stats()
	}
}

class Wigglytuff inherits Pokemon{
	method statsBase () {
		name ="Wigglytuff"
		hp  =140
		atk =70
		def =45
		spa =85
		spd =50
		spe =45
		types=[normal,hada]
		moveset = [cuchillada,hypervoz,juegorudo,vientofeerico]
		self.stats()
	}
}

class Sandile inherits Pokemon{
	method statsBase () {
		name ="Sandile"
		hp  =50
		atk =72
		def =35
		spa =35
		spd =35
		spe =65
		types=[suelo,oscuro]
		moveset = [terremoto,bofetonlodo,tajoumbrio,pulsoumbrio]
		self.stats()
	}
}
class Shedinja inherits Pokemon{
	method statsBase () {
		name ="Shedinja"
		hp  =150
		atk =90
		def =45
		spa =30
		spd =30
		spe =40
		types=[bicho,fantasma]
		moveset = [megacuerno,rayosenial,puniosombra,bolasombra]
		self.stats()
	}
}
class Toxicroak inherits Pokemon{
	method statsBase () {
		name ="Toxicroak"
		hp  =83
		atk =106
		def =65
		spa =86
		spd =65
		spe =85
		types=[veneno,lucha]
		moveset = [puyanociva,acido,brazomartillo,esferaaural]
		self.stats()
	}
}
class Bastiodon inherits Pokemon{
	method statsBase () {
		name ="Bastiodon"
		hp  =60
		atk =52
		def =168
		spa =47
		spd =138
		spe =30
		types=[roca,acero]
		moveset = [tumbaroca,poderpasado,cabezahierro,metalaser]
		self.stats()
	}
}
class Gardevoir inherits Pokemon{
	method statsBase () {
		name ="Gardevoir"
		hp  =68
		atk =65
		def =65
		spa =125
		spd =115
		spe =80
		types=[psiquico,hada]
		moveset = [cabezazozen,psicorrayo,juegorudo,vientofeerico]
		self.stats()
	}
}
class Kyurem inherits Pokemon{
	method statsBase () {
		name ="Kyurem"
		hp  =125
		atk =130
		def =90
		spa =130
		spd =90
		spe =95
		types=[dragon,hielo]
		moveset = [garradragon,alientodragon,colmillohielo,rayohielo]
		self.stats()
	}
}