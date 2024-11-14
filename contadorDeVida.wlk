import wollok.game.*
import barraDeVida.*
import batalla.*
import movimientos.*
import nivel.*
import npc.*
import personaje.*
import pokemon.*
import tipo.*
/*
class MostrarNumero{
	var cuantasCifras = 1
	var contadorParaMostrar = 1
	var contadorParaCuantasCifras = 0
	var yaCalculeCifras = false	//<--------	Flag para que cuando se pretende cambiar un numero que pueda pasar de 3 cifras a 2 dibujandolo encima no se vuelvan a calcular 
											// las cifras, ya que esto causaria un bug visual. Si se pretende dejar el numero como esta, no genera ningun inconveniente.
	method init() {
        cuantasCifras = 1
        contadorParaMostrar = 1
        contadorParaCuantasCifras = 0
        yaCalculeCifras = false
    }
	method mostrar (queNumero, donde){
		self.determinarCifras(queNumero)
		self.dibujarNumeros (queNumero, donde)
	}
	method dibujarNumeros (queNumero, donde){
		var cifra = queNumero.div(10**(cuantasCifras-contadorParaMostrar))%10	
		var posX = donde.x()
    	var posY = donde.y()
		var nuevoNumero = new Numero(numero = cifra, x = posX, y = posY)
		nuevoNumero.init(cifra,posX,posY)
		game.addVisual(nuevoNumero)
		return
		//ANTIGUO:  game.addVisual(new Numero(numero = cifra), donde)
		if (contadorParaMostrar != cuantasCifras){
			contadorParaMostrar++
			self.dibujarNumeros(queNumero, donde.right(1))
		}
		if (contadorParaMostrar == cuantasCifras) {contadorParaMostrar = 1}
	}
	method determinarCifras (numero){
		if (numero == null || numero <= 0) {
        throw new Exception(message = "El número debe ser un entero positivo")
    	}
		if(!yaCalculeCifras){
			var numeroAux = numero/10
			contadorParaCuantasCifras++
			if (numeroAux>=1){
				self.determinarCifras(numeroAux)
			}else{
				cuantasCifras = contadorParaCuantasCifras
				contadorParaCuantasCifras = 0
				yaCalculeCifras = true
			}
		}
	}
	method fijarCifras (numero){
		cuantasCifras = numero
		yaCalculeCifras = true
	}
}

class Numero{
	var property numero
	var property x
    var property y
    method init(n, posX, posY) {
        numero = n
        x = posX
        y = posY
    }
	method image() = numero.toString() + ".png"
}*/