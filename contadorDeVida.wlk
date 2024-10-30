import wollok.game.*

class MostrarNumero{
	var cuantasCifras = 1
	var contadorParaMostrar = 1
	var contadorParaCuantasCifras = 0
	var yaCalculeCifras = false	//<-------------------------------	Flag para que cuando se pretende cambiar un numero que pueda pasar de 3 cifras a 2 dibujandolo encima no se vuelvan a calcular las cifras,
																//	ya que esto causaria un bug visual. Si se pretende dejar el numero como esta, no genera ningun inconveniente.
	method mostrar (queNumero, donde){
		self.determinarCifras(queNumero)
		self.dibujarNumeros (queNumero, donde)
	}
	
	method dibujarNumeros (queNumero,donde){
		const cifra = queNumero.div(10**(cuantasCifras-contadorParaMostrar))%10		
		game.addVisualIn(new Numero(numero = cifra), donde)
		if (contadorParaMostrar != cuantasCifras){
			contadorParaMostrar++
			self.dibujarNumeros(queNumero, donde.right(1))
		}
		contadorParaMostrar = 1
	}
	
	method determinarCifras (numero){
		if(!yaCalculeCifras){
			const numeroAux = numero/10
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
	const numero
	method image() = numero.toString() + ".png"
}