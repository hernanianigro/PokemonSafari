import wollok.game.*
import movimientos.*
import tipo.*
import batalla.*
import npc.*

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
	var property moveset = []
	var property side="ally"
	var property hpActual=1
	method image () = name + ".gif"
	method position (){
		if (side == "ally"){
			return game.at(5,4)
		}else{
			return game.at(15,7)
		}
	}
	method posicionDeLaVida (){
		if (side == "ally"){
			return game.at(1,11)
		}else{
			return game.at(21,13)
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
		moveset = [hojasnavaja,hypervoz,rayosolar,acido]
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
		moveset = [cuchillada,ataqueala,bofetonlodo,tajoaereo]
		self.stats()
	}
}

class Arcanine inherits Pokemon{
	method statsBase () {
		name ="Arcanine"
		hp  =90
		atk =110
		def =80
		spa =100
		spd =80 
		spe =95
		types=[fuego,nulo]
		moveset = [colmillofuego,colmillotrueno,colmillohielo,lanzallamas]
		self.stats()
	}
}

class Rhyhorn inherits Pokemon{
	method statsBase () {
		name ="Rhyhorn"
		hp  =80
		atk =85
		def =95
		spa =30
		spd =30
		spe =25
		types=[suelo,roca]
		moveset = [terremoto,megacuerno,bofetonlodo,tumbaroca]
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
		moveset = [surf,psicorrayo,rayohielo,esferaaural]
		self.stats()
	}
}
class Chinchou inherits Pokemon{
	method statsBase () {
		name ="Chinchou"
		hp  =75
		atk =38
		def =38
		spa =56
		spd =56
		spe =67
		types=[agua,electrico]
		moveset = [chispa,rayosenial,tajoacuatico,surf]
		self.stats()
	}
}

class Yanma inherits Pokemon{
	method statsBase () {
		name ="Yanma"
		hp  =65
		atk =65
		def =45
		spa =75
		spd =45
		spe =95
		types=[bicho,volador]
		moveset = [ataqueala,rayosenial,vientofeerico,psicorrayo]
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
		moveset = [cabezahierro,poderpasado,metalaser,garradragon]
		self.stats()
	}
}

class Sharpedo inherits Pokemon{
	method statsBase () {
		name ="Sharpedo"
		hp  =70
		atk =120
		def =40
		spa =95
		spd =40
		spe =95
		types=[agua,oscuro]
		moveset = [surf,tajoumbrio,pulsoumbrio,colmillohielo]
		self.stats()
	}
}

class Trapinch inherits Pokemon{
	method statsBase () {
		name ="Trapinch"
		hp  =45
		atk =100
		def =45
		spa =45
		spd =45
		spe =10
		types=[suelo,nulo]
		moveset = [juegorudo,bofetonlodo,puyanociva,colmillotrueno]
		self.stats()
	}
}
class Tropius inherits Pokemon{
	method statsBase () {
		name ="Tropius"
		hp  =99
		atk =68
		def =83
		spa =72
		spd =87
		spe =51
		types=[planta,volador]
		moveset = [ataqueala,tajoaereo,hojasnavaja,rayosolar]
		self.stats()
	}
}
class Regirock inherits Pokemon{
	method statsBase () {
		name ="Regirock"
		hp  =80
		atk =100
		def =200
		spa =50
		spd =100
		spe =50
		types=[roca,nulo]
		moveset = [chispa,puniosombra,poderpasado,brazomartillo]
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
		moveset = [cabezahierro,cabezazozen,cuchillada,alientodragon]
		self.stats()
	}
}
class Tangrowth inherits Pokemon{
	method statsBase () {
		name ="Tangrowth"
		hp  =100
		atk =100
		def =125
		spa =110
		spd =50
		spe =50
		types=[planta,nulo]
		moveset = [poderpasado,hojasnavaja,juegorudo,esferaaural]
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
		moveset = [alientodragon,rayohielo,hypervoz,bolasombra]
		self.stats()
	}
}